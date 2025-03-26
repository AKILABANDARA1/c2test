FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y git python3 python3-pip

# Clone Pupy repository
RUN git clone https://github.com/n1nj4sec/pupy /opt/pupy

# Set working directory
WORKDIR /opt/pupy

# Make install script executable and run it
RUN chmod +x install.sh && ./install.sh

# Expose the port for the C2 server
EXPOSE 31337

RUN useradd -m -s /bin/bash -u 10001 pupyuser

RUN chown -R 10001:10001 /opt/pupy

USER pupyuser
