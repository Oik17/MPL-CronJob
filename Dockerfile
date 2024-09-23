FROM alpine:latest

# Install curl, bash, and cron
RUN apk --no-cache add curl bash

# Copy the script into the container
COPY cron-script.sh /cron-script.sh

# Set permissions for the script
RUN chmod +x /cron-script.sh

# Create a shell script to run both cron and our script
RUN echo '#!/bin/sh' > /run.sh && \
    echo 'while true; do' >> /run.sh && \
    echo '    /cron-script.sh' >> /run.sh && \
    echo '    sleep 420' >> /run.sh && \
    echo 'done' >> /run.sh && \
    chmod +x /run.sh

# Run the shell script
CMD ["/run.sh"]