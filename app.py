import os
from flask import Flask, jsonify

app = Flask(__name__)


@app.get("/")
def env():
    """Return two test env vars as JSON."""
    return jsonify(
        {
            "TEST_ENV_ONE": os.getenv("TEST_ENV_ONE"),
            "TEST_ENV_TWO": os.getenv("TEST_ENV_TWO"),
        }
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
