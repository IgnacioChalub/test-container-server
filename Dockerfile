FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY pyproject.toml ./

RUN pip install --no-cache-dir uv \
    && uv pip install --system .

COPY app.py ./

ENV TEST_ENV_ONE=test_one \
    TEST_ENV_TWO=test_two

EXPOSE 8000

CMD ["uv", "run", "flask", "--app", "app:app", "run", "--host", "0.0.0.0", "--port", "8000"]
