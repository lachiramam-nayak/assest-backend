# 1. Use the official Python image matching your pyproject.toml
FROM python:3.12-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the requirements file into the container
COPY requirements.txt .

# 4. Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
# (This includes server.py, asset_metadata.json, etc.)
COPY . .

# 6. Expose the port Uvicorn will run on
EXPOSE 8000

# 7. Start the FastAPI server using Uvicorn
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]