# Use the official Python image as a base image
FROM docker.io/library/python:3.11-slim

RUN apt-get update --fix-missing && apt-get install -y --fix-missing build-essential
# Set the working directory in the container
WORKDIR /app
# Copy the requirements file into the container at /app
COPY requirements.txt /app/
# Install any dependencies specified in requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt
# Copy the entire current directory into the container at /app
COPY . /app/
# Expose port 80 to the outside world
EXPOSE 8000

# Command to run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# CMD uvicorn main:app --host 0.0.0.0 --port 8000 & uvicorn main_wx:app --host 0.0.0.0 --port 8001