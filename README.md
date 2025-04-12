# 🦸 Superset Stack (Docker)

This project provides a ready-to-use Docker stack for running [Apache Superset](https://superset.apache.org/) with PostgreSQL and Redis. It's suitable for both local development and production deployment.

---

## Features

- **Superset** (Frontend and Backend)
- **PostgreSQL** (Relational database for storing Superset metadata)
- **Redis** (Asynchronous task queue for Superset)

---

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## Getting Started

### 1. Copy the `.env.example` file to `.env`:

   ```bash
   cp .env.example .env
   ```

### 2. (Optional) Update `.env`
```bash
SUPERSET_ADMIN_USER=admin
SUPERSET_ADMIN_PASSWORD=changeme
SUPERSET_ADMIN_EMAIL=admin@example.com
```

### 3. Build and start the stack
```bash
docker-compose up --build
```

### 4. Access Superset via your web browser
```bash
http://localhost:8088
```