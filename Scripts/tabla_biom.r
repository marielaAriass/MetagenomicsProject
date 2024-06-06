# Cargar librerías
library("phyloseq")
library("ggplot2")
library("RColorBrewer")
library("patchwork")

# Establecer el directorio donde está tu archivo BIOM
setwd("~/camda2024/taxonomy/report")

# Crear el objeto phyloseq a partir del archivo BIOM
merged_metagenomes <- import_biom("camda.biom")

# Verificar si el objeto se ha creado correctamente
if (!is.null(merged_metagenomes)) {
  # Verificar la clase del objeto
  print(class(merged_metagenomes))
  
  # Ver qué hay dentro de tax_table
  View(tax_table(merged_metagenomes))
  
  # Acomodar la tabla y cambiar nombre de columnas
  tax_table(merged_metagenomes) <- substring(tax_table(merged_metagenomes), 4)
  colnames(tax_table(merged_metagenomes)) <- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species")
  View(tax_table(merged_metagenomes))
  
  # Usar unique para ver cuántos filos hay
  unique_taxa <- unique(tax_table(merged_metagenomes)[,"Phylum"])
  print(unique_taxa)
  
  # ¿Cuántas de nuestras OTU han sido asignadas al filo Firmicutes?
  firmicutes_count <- sum(tax_table(merged_metagenomes)[,"Phylum"] == "Firmicutes")
  print(paste("Número de OTUs asignadas al filo Firmicutes:", firmicutes_count))
  
  # Para ese filo, cuántos taxones hay en un cierto rango
  firmicutes_classes <- unique(tax_table(merged_metagenomes)[tax_table(merged_metagenomes)[,"Phylum"] == "Firmicutes", "Class"])
  print("Clases en el filo Firmicutes:")
  print(firmicutes_classes)
  
  # Otro ejemplo:
  proteobacteria_count <- sum(tax_table(merged_metagenomes)[,"Phylum"] == "Proteobacteria")
  print(paste("Número de OTUs asignadas al filo Proteobacteria:", proteobacteria_count))
  print("Géneros en el filo Proteobacteria:")
  proteobacteria_genera <- unique(tax_table(merged_metagenomes)[tax_table(merged_metagenomes)[,"Phylum"] == "Proteobacteria", "Genus"])
  print(proteobacteria_genera)
  
} else {
  print("El archivo BIOM no se ha cargado correctamente.")
}
