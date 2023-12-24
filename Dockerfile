# Use a minimal base image
FROM python:alpine3.7

# Set the working directory inside the container
WORKDIR /app

# Copy only the necessary files
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 80

COPY myFlaskApp/ .

# Command to run the application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "app:app"]

