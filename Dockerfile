# Use node as builder
FROM node:20.11.1
WORKDIR /app

# Set environment variables
ENV CONTAINER_NAME=auto-renew-1und1

# Install cron
RUN apt-get update && apt-get install -y cron && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install dependencies
RUN npm install
RUN npx playwright install
RUN npx playwright install-deps

# Make sure screenshots directory exists
RUN mkdir -p ./screenshots

# Copy the cronjob definition file
COPY crontab /etc/cron.d/auto-renew-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/auto-renew-cron

# Apply cron job
RUN crontab /etc/cron.d/auto-renew-cron

# Create the script to be run by cron
COPY run-test.sh /usr/local/bin/run-test.sh
RUN chmod +x /usr/local/bin/run-test.sh

# Start cron in the foreground
CMD ["cron", "-f"]