FROM python:3.13-slim

# Install uv.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set the working directory.
WORKDIR /app

# Copy dependency files and install dependencies.
COPY app/pyproject.toml app/uv.lock /app/
RUN uv sync --frozen --no-cache

# Copy the application code.
COPY . /app

# Expose the application port.
EXPOSE 8090

# Run the application.
CMD ["/app/.venv/bin/uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8090"]