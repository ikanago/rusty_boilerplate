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

FROM gcr.io/distroless/cc@sha256:2510b5f6a5ca842b863b298ef6b1e423b7b0f1a5343db5e94ffc1943d0e70098
COPY --from=builder /build/target/release/main /
ENTRYPOINT ["/main"]
