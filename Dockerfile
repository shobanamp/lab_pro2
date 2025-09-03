# ---------- Base Image ----------
FROM python:3.10-bullseye

# Avoid .pyc, flush logs, and help Spark DNS in containers
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    SPARK_LOCAL_IP=127.0.0.1

# ---------- System packages: Java (for PySpark), Git, curl ----------
RUN apt-get update && apt-get install -y --no-install-recommends \
      openjdk-17-jre-headless \
      git \
      curl \
    && rm -rf /var/lib/apt/lists/*

# ---------- Workdir ----------
WORKDIR /app

# ---------- Python deps ----------
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---------- Copy the repo (respects .dockerignore) ----------
COPY . .

# ---------- MLflow tracking URI (overridable at runtime) ----------
# On Docker Desktop (Win/Mac), this reaches your host via host.docker.internal
ENV MLFLOW_TRACKING_URI=http://host.docker.internal:5000

# ---------- Expose API port ----------
EXPOSE 8000

# ---------- Default command ----------
# 1) Try fetching DVC data (if any)
# 2) Run training (logs & registers best model)
# 3) Start FastAPI server
CMD ["bash", "-c", "dvc pull || true && python lab_pro2.py && uvicorn deploy_model:app --host 0.0.0.0 --port 8000"]