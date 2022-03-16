FROM lukemathwalker/cargo-chef:0.1.33-rust-1.56.1-bullseye AS chef

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

FROM gcr.io/distroless/cc@sha256:a9e2593c4ebca5435d8b23ef4316323842fc36b0410bf9a5d3f472ab5b52d0f0
COPY --from=builder /build/target/release/main /
ENTRYPOINT ["/main"]
