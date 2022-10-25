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

FROM gcr.io/distroless/cc@sha256:3827818d6d0c62a2b03fbced0a0ccd4ffdf98095f4a536fb878d5fc2d8bfb049
COPY --from=builder /build/target/release/main /
ENTRYPOINT ["/main"]
