# docker image building with binary from above step
FROM alpine:latest
RUN apk --no-cache add ca-certificates tzdata
RUN apk update && apk add bash
# Set the working directory in the new image
WORKDIR /listmonk
COPY listmonk .
# Copy the binary from the builder stage to the current stage
# COPY . .
COPY config.toml.sample config.toml
COPY config-demo.toml .
COPY entrypoint.sh /entrypoint.sh
# Make the script executable
RUN chmod +x /entrypoint.sh
# Set the script as the entrypoint
ENTRYPOINT [ "bash", "/entrypoint.sh"]

EXPOSE 9000


