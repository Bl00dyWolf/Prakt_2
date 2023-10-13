#!/bin/bash

# Перевірка наявності необхідних аргументів
if [ "$#" -ne 3 ]; then
    echo "Потрібно вказати каталог, оригінальне розширення та нове розширення."
    exit 1
fi

directory="$1"
original_ext="$2"
new_ext="$3"

# Перевірка, чи каталог існує
if [ ! -d "$directory" ]; then
    echo "Каталог '$directory' не існує."
    exit 1
fi

# Перейдемо до каталогу
cd "$directory" || exit 1

# Знайдемо файли з оригінальним розширенням та перейменуємо їх
for file in *.$original_ext; do
    # Створюємо нове ім'я файлу
    new_name="${file%.$original_ext}.$new_ext"
    # Виводимо повідомлення про перейменування
    echo "Перейменовую $file на $new_name"
    # Перейменовуємо файл
    mv "$file" "$new_name"
done