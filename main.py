import uvicorn
from fastapi import FastAPI

from core.config import config

app = FastAPI()


@app.get("/")
def read_root():
    return {"message": "Hello, World!"}
if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host="0.0.0.0",  # Bind to all available network interfaces
        port=8000,        # Ensure this matches the exposed port in Docker
        reload=True if config.ENVIRONMENT != "production" else False,
        workers=1,
    )
