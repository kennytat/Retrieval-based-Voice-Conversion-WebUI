# syntax=docker/dockerfile:1

FROM python:3.10-bullseye

EXPOSE 7865

WORKDIR /app

COPY requirements.txt ./
RUN apt update && apt install -y -qq ffmpeg && apt clean
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
# VOLUME [ "/app/weights", "/app/opt" ]

CMD ["python3", "infer-web.py"]