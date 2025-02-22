from fastapi import FastAPI
from core.config import config
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

if __name__ == "__main__":
    uvicorn.run(
        "main:app",  
        reload=True if config.ENVIRONMENT != "production" else False,
        workers=1,
    )