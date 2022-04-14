from typing import Optional

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "from fast api"}


@app.get("/{q}")
def read_item(q: Optional[str] = None):
    return {"Hello from fast api": q}
