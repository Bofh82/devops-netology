#!/bin/bash

# Папка, где распакован OCI-архив (содержит blobs/, index.json и т.д.)
OCI_DIR="${1:-$HOME/terraform-image}"

# Куда распаковывать слои и сохранить terraform
WORK_DIR="$HOME/terraform-oci"
TMP_DIR="$WORK_DIR/tmp"
OUT_PATH="$HOME/terraform"

echo "🔍 Ищем terraform в OCI-образе: $OCI_DIR"

mkdir -p "$TMP_DIR"

cd "$OCI_DIR/blobs/sha256" || {
  echo "❌ Не найдена папка blobs/sha256"
  exit 1
}

FOUND=0
for blob in *; do
  echo "📦 Проверка слоя: $blob"
  tar -xf "$blob" -C "$TMP_DIR" 2>/dev/null

  if [ -f "$TMP_DIR/bin/terraform" ]; then
    echo "✅ Найден terraform в слое: $blob"
    cp "$TMP_DIR/bin/terraform" "$OUT_PATH"
    chmod +x "$OUT_PATH"
    FOUND=1
    break
  fi

  rm -rf "$TMP_DIR"/*
done

if [ "$FOUND" -eq 1 ]; then
  echo "🚀 terraform скопирован в: $OUT_PATH"
  "$OUT_PATH" version
else
  echo "❌ terraform не найден в слоях"
  exit 2
fi

# Очистка временных файлов
rm -rf "$WORK_DIR"
