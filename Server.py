from fastapi import FastAPI

app = FastAPI()

@app.post("/sign")
def sign(data: dict):
    return {
        "status": "signed",
        "tx": "0xFADAKA_SIGNED_DATA"
    }

@app.get("/node/status")
def status():
    return {
        "network": "active",
        "nodes": 12
    }
