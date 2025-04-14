from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI(
    title="AV Device API",
    description="API for WAMS AV devices",
    version="1.0",
    root_path="/api",
)


@app.get("/register/{mac}")
async def register(mac: str):
    return {"message": "Device registered successfully", "mac": mac}


@app.get("/ping", response_class=HTMLResponse)
async def ping():
    return "<h1>Pong</h1>"
