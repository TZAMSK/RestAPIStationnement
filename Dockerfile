# Créer
FROM rust:1.70-buster as builder

WORKDIR /app

ARG DATABASE_URL

ENV DATABASE_URL=$DATABASE_URL

# Copier tous du répértoire du projet
COPY . .

RUN cargo build --release

# Production
FROM debian:buster-slim

WORKDIR /usr/local/bin

COPY --from=builder /app/target/release/APIStationnement .

CMD ["./APIStationnement"]
