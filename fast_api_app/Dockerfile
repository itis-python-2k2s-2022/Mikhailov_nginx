FROM python:3.10

WORKDIR app/

COPY ./requirements.txt .

RUN pip install -r requirements.txt

RUN pip freeze -> requirements.txt
RUN pip freeze

COPY . .

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
