#!/bin/bash

# Pindah ke direktori script berada
cd "$(dirname "$0")"

# Update & install dependencies
echo "[+] Installing dependencies..."
sudo apt update && sudo apt install -y pkg-config libssl-dev build-essential clang make

# Install Rust via rustup
echo "[+] Installing Rust..."
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"

# Verifikasi versi Rust
rustc --version
cargo --version

# Build drosera
echo "[+] Building Drosera..."
cargo build --release

# Jalankan node
echo "[+] Menjalankan Drosera Node..."
./target/release/drosera-node
