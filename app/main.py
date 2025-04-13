from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()

@app.post("/register")
async def register(mac: str):
    return {"message": "Device registered successfully",
            "mac": mac}

@app.get("/ping", response_class=HTMLResponse)
async def ping():
    return "<h1>Pong</h1>"