FROM python:3.10-slim
LABEL authors="aisaev"
ENV POETRY_VERSION=1.4.1
RUN pip install "poetry==$POETRY_VERSION"

WORKDIR opt/
COPY poetry.lock pyproject.toml ./
RUN poetry config virtualenvs.create false\
    && poetry install --without dev --no-root

COPY . .
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
