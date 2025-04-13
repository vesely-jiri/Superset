FROM python:3.9-slim

WORKDIR /app

# Instalace potřebných balíčků, včetně postgresql-client
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    libldap2-dev \
    curl \
    unzip \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Instalace Python balíčků
RUN pip install \
    apache-superset \
    Pillow \
    psycopg2 \
    pandas \
    openpyxl \
    xlrd \
    pyarrow

COPY . /app

ENV SUPERSET_HOME=/app/superset_home

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 8088

ENTRYPOINT ["/app/entrypoint.sh"]
