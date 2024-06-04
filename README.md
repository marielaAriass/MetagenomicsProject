# Reto CAMDA 2024: The Gut Microbiome based Health Index

## Introducción
El incremento de enfermedades vinculadas con la salud del microbioma, como la obesidad y la enfermedad inflamatoria intestinal (EII), sigue en aumento. Evaluar el estado de salud mediante una muestra de heces es extremadamente valioso, ya que brinda información esencial sobre el microbioma intestinal. Entre los métodos empleados para esta evaluación se encuentran la diversidad alfa y la riqueza del microbioma. Estos análisis destacan la relevancia de la microbiota, así como sus funciones e interacciones dentro del cuerpo.

En el reto CAMDA, se proporcionó un conjunto de datos compuesto por 613 muestras provenientes del Proyecto Microbioma Humano 2 y dos cohortes del Proyecto Intestino Americano. Estos datos incluían perfiles taxonómicos precalculados y predicciones de salud basadas en índices de salud preexistentes, tales como la entropía de Shannon, el Índice de Salud del Microbioma Gástrico (GMHI) y el análisis de Componentes Principales Hiperesféricos (hiPCA). 
Para el análisis específico de este proyecto, se seleccionaron 100 muestras de las mencionadas anteriormente. 

## Metodología 
Para hacer el analisis de estas muestras se ocupo el servidor BetterLab del [CCM, Morelia](https://www.matmor.unam.mx/).
Para tener acceso a las muestras, se crearon enlaces simbolicos a los archivos FASTA para así no tener que copiar directamente. Se observo que teniamos secuencias de lecturas de un solo extremo, de extremo emparejado y tambien las que tenian ambas, así que para reducir el espacio, se eliminaron las msecuencuas que tenian ambas. Las muestras limpias se encuentran en la carpeta "reads". 
Para analisar la calidad de de las lecturas de secuencia contenidas en nuestros archivos usaremos la herramienta FASTQC. Al aplicar FASTQC a nuestras secuencias, tenemos como resulatdo la calidad de cada una y tambien las que pasan o no pasan la prueba de calidad. También podemos visualizar las pruebas en graficas, donde puede observar una buena o mala calidad. En las siguientes imagenes podemos ver un ejemplo de cada una. 

<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/0acc33af-49d1-4839-8e39-a134e11829cf" alt="Grafica con mala calidad" width="600"/>
  <p><em>Grafica con mala calidad.</em></p>
</div>  

<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/3e113f49-84df-4874-86a0-73c38cede785" alt="Grafica con buena calidad. Secuencia ERR209071_1" width="600"/>
  <p><em>Grafica con buena calidad. Secuencia ERR209071_1.</em></p>
</div>  
![image]()


Para limpiar nuestras muestras y que su calidad mejore, vamos a recortarlas usando la herramienta Trimmomatic y despues de esto podemos evaluar la calidad de nuestras secuencias otra vez con FASTQC. 

<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/752620d1-6a93-4737-883a-7491eb402799" alt="Grafica con buena calidad. Secuencia recortada ERR209071_1" width="600"/>
  <p><em>Grafica con buena calidad. Secuencia recortada ERR209071_1.</em></p>
</div>  

