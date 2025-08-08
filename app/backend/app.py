from flask import Flask
from flask import Response
from prometheus_client import generate_latest, CONTENT_TYPE_LATEST, Counter
import os


app = Flask(__name__)

REQUESTS = Counter("flask_app_requests_total", "Total HTTP requests")

@app.route("/")
def hello():
    REQUESTS.inc()
    return "Hello, World!"

@app.route("/health")
def health():
    return "OK", 200

@app.route("/version")
def version():
    REQUESTS.inc()
    environment = os.getenv("ENVIRONMENT", "production")
    return {
        "version": "1.0.2",
        "environment": environment,
        "feature": "Version endpoint updated for demo",
        "build": "production-ready"
    }

@app.route("/metrics")
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)