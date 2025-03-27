# Use the custom C2 server image as the base image
FROM csocdockeruser/my-c2-server:latest

# Create a non-root user with UID 10014 (to pass Choreo checks)
RUN useradd -m -u 10014 myc2user

# Switch to the non-root user
USER myc2user

# Expose the necessary port for your custom C2 server (80 in this case, based on your app)
EXPOSE 80

# Run the custom C2 server (ensure that this is the correct entrypoint command)
CMD ["python", "app7.py"]
