FROM debian:stable-slim

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

WORKDIR /app/blog
COPY . .

# Install dependencies
RUN apt update && apt upgrade -y && \
    apt install libpq-dev curl gcc -y && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
RUN rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy

# Install application and diesel
RUN cargo install --path . && \
    cp $CARGO_HOME/bin/blog . && \
    cargo install diesel_cli --no-default-features --features postgres
