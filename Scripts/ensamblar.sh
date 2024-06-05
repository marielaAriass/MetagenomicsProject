#!/bin/bash

# Cambiar al directorio donde se encuentran los archivos
cd ~/camda2024/trimmed_fastq

# Construir lista de archivos a ensamblar excluyendo los que contienen "_1un.trim.fastq.gz" y "_2un.trim.fastq.gz"
files_to_assemble=$(find . -type f -name "*.trim.fastq.gz" ! -name "*_1un.trim.fastq.gz" ! -name "*_2un.trim.fastq.gz")

# Verificar si los archivos son pareados o no
first_file=$(echo "$files_to_assemble" | head -n 1)
second_file=$(echo "$files_to_assemble" | sed -n 2p)

# Definir las opciones del comando SPAdes
if [ -n "$second_file" ]; then
    spades_options="-1 $first_file -2 $second_file"
else
    spades_options="-s $first_file"
fi

# Ejecutar metaspades.py con las opciones adecuadas
metaspades.py $spades_options -o ../../results/assembly

