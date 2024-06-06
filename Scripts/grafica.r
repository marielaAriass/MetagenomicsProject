# Verificar e instalar las librerías necesarias
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

if (!requireNamespace("phyloseq", quietly = TRUE))
  BiocManager::install("phyloseq")

# Cargar librerías
library("phyloseq")

# Establecer el directorio donde está tu archivo BIOM
setwd("~/camda2024/taxonomy/report")

# Crear el objeto phyloseq a partir del archivo BIOM
merged_metagenomes <- import_biom("camda.biom")


# Verificar si el objeto se ha creado correctamente
if (!is.null(merged_metagenomes)) {
  # Transformar las cuentas a abundancias relativas
  percentages <- transform_sample_counts(merged_metagenomes, function(x) x * 100 / sum(x))
  
  # Calcular la ordenación NMDS
  meta_ord <- ordinate(physeq = percentages, method = "NMDS", distance = "bray")
  
  # Graficar la ordenación NMDS
  plot_ordination(physeq = percentages, ordination = meta_ord)
} else {
  print("El archivo BIOM no se ha cargado correctamente.")
}
