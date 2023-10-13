#!/bin/bash

yourName="vlad"  # Замініть на ваше ім'я
numFiles=25       # Кількість файлів для створення

# Знайдіть останній файл у поточному каталозі з іменем у відповідному форматі
last_file_number=$(ls -1 | grep "^$yourName[0-9]\+$" | sed "s/$yourName//" | sort -n | tail -n 1)

# Визначимо номер останнього файлу або встановимо 0, якщо файлів не знайдено
if [ -n "$last_file_number" ]; then
    last_number=$((last_file_number))
else
    last_number=0
fi

# Створюємо 25 файлів з зростаючим номером
for ((i = last_number + 1; i <= last_number + numFiles; i++)); do
    filename="${yourName}${i}"
    touch "$filename"
done