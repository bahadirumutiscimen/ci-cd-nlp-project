from fastapi import FastAPI, Form, Request
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from core_nlp import get_phrases
from pathlib import Path
import uvicorn

app = FastAPI()

# Templates için Jinja2Templates nesnesini oluşturuyoruz.
templates = Jinja2Templates(directory="templates")

# Static dosyaları sunmak için "static" klasörünü ayarlıyoruz.
app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/", response_class=HTMLResponse)
def index(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

@app.post("/result", response_class=HTMLResponse)
def analyze_wikipedia(request: Request, name: str = Form(...)):
    if name:
        phrases = get_phrases(name)
        return templates.TemplateResponse("result.html", {"request": request, "name": name, "phrases": phrases})

if __name__ == "__main__":
     uvicorn.run(f"{Path(__file__).stem}:app", host="0.0.0.0", port=8000)
