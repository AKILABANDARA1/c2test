FROM csocdockeruser/sliver-gold:latest

# Create a non-root user with UID 10014 (to pass Choreo checks)
RUN useradd -m -u 10014 sliveruser

# Switch to the non-root user
USER sliveruser

# Expose the necessary port (ensure this is the correct port for Sliver C2)
EXPOSE 8080

# Run the Sliver server
CMD ["sliver-server"]
