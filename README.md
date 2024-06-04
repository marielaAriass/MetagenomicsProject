# Reto CAMDA 2024: The Gut Microbiome based Health Index

## Introducción
El incremento de enfermedades vinculadas con la salud del microbioma, como la obesidad y la enfermedad inflamatoria intestinal (EII), sigue en aumento. Evaluar el estado de salud mediante una muestra de heces es extremadamente valioso, ya que brinda información esencial sobre el microbioma intestinal. Entre los métodos empleados para esta evaluación se encuentran la diversidad alfa y la riqueza del microbioma. Estos análisis destacan la relevancia de la microbiota, así como sus funciones e interacciones dentro del cuerpo.

En el reto CAMDA, se proporcionó un conjunto de datos compuesto por 613 muestras provenientes del Proyecto Microbioma Humano 2 y dos cohortes del Proyecto Intestino Americano. Estos datos incluían perfiles taxonómicos precalculados y predicciones de salud basadas en índices de salud preexistentes, tales como la entropía de Shannon, el Índice de Salud del Microbioma Gástrico (GMHI) y el análisis de Componentes Principales Hiperesféricos (hiPCA). 
Para el análisis específico de este proyecto, se seleccionaron 100 muestras de las mencionadas anteriormente. 

## Metodología 
Para hacer el analisis de estas muestras se ocupo el servidor BetterLab del [CCM, Morelia](https://www.matmor.unam.mx/).
Para tener acceso a las muestras, se crearon enlaces simbolicos a los archivos FASTA para así no tener que copiar directamente. Se observo que teniamos secuencias de lecturas de un solo extremo, de extremo emparejado y tambien las que tenian ambas, así que para reducir el espacio, se eliminaron las msecuencuas que tenian ambas. Las muestras limpias se encuentran en la carpeta "reads". 
Para analisar la calidad de de las lecturas de secuencia contenidas en nuestros archivos usaremos la herramienta FASTQC. Al aplicra FASTQC a nuestras secuencias, tenemos como resulatdo la calidad de cada una y tambien las que pasan o no pasan la prueba de calidad. 

![image](https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/0acc33af-49d1-4839-8e39-a134e11829cf)
