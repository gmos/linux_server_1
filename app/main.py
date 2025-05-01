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
    return "<h1>Pong from the device api.</h1>"


@app.get("/joena", response_class=HTMLResponse)
async def joena():
    return "<h1>Hallo Jeroen, have a good day.</h1>"
