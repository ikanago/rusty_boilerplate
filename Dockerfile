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

FROM gcr.io/distroless/cc@sha256:15bc3c6acbe16bf3dc37db543dfa632dabf3869ccd123257e9bee965989c976e
COPY --from=builder /build/target/release/main /
ENTRYPOINT ["/main"]
