FROM python:3.13-alpine

WORKDIR /app

RUN apk add --no-cache gcc musl-dev

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
