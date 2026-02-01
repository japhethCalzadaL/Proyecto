# FastAPI Project

This is a basic FastAPI project with Docker support.

## Project Structure

- `app/`: Contains the application code.
- `tests/`: Contains the tests.
- `requirements.txt`: Python dependencies.
- `Dockerfile`: Docker configuration.
- `docker-compose.yml`: Docker Compose configuration.

## Running Locally

1.  Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```

2.  Run the application:
    ```bash
    uvicorn app.main:app --reload
    ```

3.  Run tests:
    ```bash
    pytest
    ```

## Running with Docker

1.  Build and run with Docker Compose:
    ```bash
    ./run_docker.sh
    ```
    Or manually:
    ```bash
    docker compose up --build
    ```

    The API will be available at `http://localhost:8000`.

## Verifying Docker Setup

To verify that the Docker image builds and runs correctly, use the provided script:

```bash
./verify_docker.sh
```
