#!/bin/bash

# Masuk ke direktori proyek
cd ~/workspaces/Drosera-Network || exit

# Build node
echo "Building Drosera node..."
cargo build --release

# Cek apakah build berhasil
if [ $? -ne 0 ]; then
  echo "Build gagal. Periksa error di atas."
  exit 1
fi

# Buat folder log jika belum ada
mkdir -p logs

# Buat nama file log berdasarkan tanggal dan waktu
LOG_FILE="logs/drosera-$(date '+%Y-%m-%d_%H-%M-%S').log"

# Jalankan node dan simpan log
echo "Menjalankan Drosera node... Log disimpan di $LOG_FILE"
./target/release/drosera-node --chain testnet | tee "$LOG_FILE"
