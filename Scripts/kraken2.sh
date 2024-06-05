#!/bin/bash

# Directorio de los archivos de entrada
input_dir="/home/alumno17/camda2024/trimmed_fastq"
# Directorio de salida para los resultados
output_dir="~/camda2024/taxonomy/TAXONOMY_READS"

# Crear el directorio de salida si no existe
mkdir -p $output_dir

# Base de datos de Kraken 2
db_dir="/files/db_kraken2"

# Encuentra todos los archivos _R1.trim.fastq.gz en el directorio de entrada
for r1_file in "$input_dir"/*_R1.trim.fastq.gz; do
  # Generar el nombre del archivo R2 correspondiente
  r2_file="${r1_file/_R1.trim.fastq.gz/_R2.trim.fastq.gz}"

  # Verificar si el archivo R2 correspondiente existe
  if [[ -f "$r2_file" ]]; then
    # Generar el nombre de salida basado en el nombre del archivo sin extensión
    base_name=$(basename "$r1_file" _R1.trim.fastq.gz)
    output_prefix="$output_dir/$base_name"
    report_file="$output_dir/$base_name.report"

    # Ejecutar Kraken 2
    kraken2 --db "$db_dir" --threads 8 --paired "$r1_file" "$r2_file" --output "$output_prefix" --report "$report_file"
  else
    echo "Archivo R2 no encontrado para $r1_file, omitiendo..."
  fi
done
