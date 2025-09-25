# Dockerfile for wisecow bash server
FROM debian:12-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      netcat-openbsd fortune-mod cowsay bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]
