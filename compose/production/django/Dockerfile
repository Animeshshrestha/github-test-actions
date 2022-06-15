FROM python:3.9-slim-buster
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install --no-install-recommends -y \
  # magic dependency
  libmagic1 \
  # dependencies for building Python packages
  build-essential \
  # psycopg2 dependencies
  libpq-dev
RUN apt-get update && apt-get install --no-install-recommends -y \
  # magic dependency
  libmagic1 \
  # psycopg2 dependencies
  libpq-dev \
  # Translations dependencies
  gettext \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/