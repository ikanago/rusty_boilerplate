FROM rust:1.56 AS chef
RUN cargo install cargo-chef \
    && rm -rf "${CARGO_HOME}/registry"

FROM chef AS planner
WORKDIR /plan
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder
WORKDIR /build
COPY --from=planner /plan/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json
COPY . .
RUN cargo build --release

FROM gcr.io/distroless/base@sha256:4f25af540d54d0f43cd6bc1114b7709f35338ae97d29db2f9a06012e3e82aba8
COPY --from=builder /build/target/release/main /
ENTRYPOINT ["./main"]
