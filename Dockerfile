FROM python:3.11-slim


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl git jq make rsync unzip wget zip iputils-ping telnet && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8002

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8002"]
