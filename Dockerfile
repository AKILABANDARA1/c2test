#FROM ubuntu:latest

# Install dependencies
#RUN apt-get update && apt-get install -y git python3 python3-pip

# Create a non-root user with UID 10001
#RUN useradd -m -s /bin/bash -u 10001 pupyuser

# Clone Pupy repository
#RUN git clone https://github.com/n1nj4sec/pupy /opt/pupy

# Change ownership of Pupy files to the non-root user
#RUN chown -R 10001:10001 /opt/pupy

# Set working directory
#WORKDIR /opt/pupy

# Make install script executable and run it
#RUN chmod +x install.sh && ./install.sh

# Switch to the new user (set explicitly using UID)
#USER 10001

# Expose the port for the C2 server
#EXPOSE 31337

# Start Pupy C2 server
#CMD ["python3", "pupysh.py"]

FROM bishopfox/sliver:latest

# Create a non-root user with UID 10014 (to pass Choreo checks)
RUN useradd -m -u 10014 sliveruser

# Switch to the non-root user
USER 10014

EXPOSE 8080

CMD ["sliver-server"]



