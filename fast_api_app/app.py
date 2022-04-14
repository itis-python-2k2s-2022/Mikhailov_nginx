from typing import Optional

import uvicorn
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates


app = FastAPI(debug=True)
templates = Jinja2Templates(directory="templates")


@app.get("/")
def read_root():
    return "Hello from fast api"


@app.get("/{string}")
def read_item(request: Request, string: str):
    return templates.TemplateResponse("index.html", {"request": request, "string": string})


if __name__ == "__main__":
    uvicorn.run(app)
