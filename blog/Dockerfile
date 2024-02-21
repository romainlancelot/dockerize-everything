FROM debian:bookworm-slim AS builder

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
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
    rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy

# Install application and diesel
RUN cargo install --path . && \
    cp $CARGO_HOME/bin/blog . && \
    cargo install diesel_cli --no-default-features --features postgres

FROM busybox:1.36.1

WORKDIR /app/blog

COPY . .
COPY --from=builder /app/blog/blog .
COPY --from=builder /usr/local/cargo/bin/diesel /usr/local/bin/diesel
COPY --from=builder /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
