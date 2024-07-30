# Build CLI tool
FROM rust:1-alpine3.20 as builder
RUN apk --no-cache add musl-dev perl make libconfig-dev openssl-dev yarn wasm-pack binaryen
WORKDIR /landscape
COPY crates crates
COPY ui ui
COPY Cargo.* ./
WORKDIR /landscape/crates/cli
RUN cargo build --release

# Final stage
FROM alpine:3.20.1
RUN addgroup -S landscape && adduser -S landscape -G landscape
RUN apk --no-cache add bash chromium font-ubuntu
USER landscape
WORKDIR /home/landscape
COPY --from=builder /landscape/target/release/landscape /usr/local/bin
COPY scripts/landscape-validate.sh /
