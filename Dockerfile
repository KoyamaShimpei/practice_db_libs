FROM python:3.11.6-slim-bullseye

RUN apt-get update \
    && apt-get install -y vim default-mysql-client xclip \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip poetry setuptools \
    && poetry config virtualenvs.create false --local \
    && poetry config virtualenvs.in-project false --local \
    && poetry install

CMD ["sleep", "infinity"]
