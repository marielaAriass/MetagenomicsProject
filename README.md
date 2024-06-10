# Reto CAMDA 2024: The Gut Microbiome based Health Index

## Introducción
El incremento de enfermedades vinculadas con la salud del microbioma, como la obesidad y la enfermedad inflamatoria intestinal (EII), sigue en aumento. Evaluar el estado de salud mediante una muestra de heces es extremadamente valioso, ya que brinda información esencial sobre el microbioma intestinal. Entre los métodos empleados para esta evaluación se encuentran la alfa diversidad  y la riqueza del microbioma. Estos análisis destacan la relevancia de la microbiota, así como sus funciones e interacciones dentro del cuerpo.

En el reto [CAMDA](https://bipress.boku.ac.at/camda-play/the-camda-contest-challenges/), se proporcionó un conjunto de datos compuesto por 613 muestras provenientes del Proyecto Microbioma Humano 2 y dos cohortes del Proyecto Intestino Americano. Estos datos incluían perfiles taxonómicos precalculados y predicciones de salud basadas en índices de salud preexistentes, tales como la entropía de Shannon, el Índice de Salud del Microbioma Gástrico (GMHI) y el análisis de Componentes Principales Hiperesféricos (hiPCA). 
Para el análisis específico de este proyecto, se seleccionaron **100 muestras** de las mencionadas anteriormente. 

## Metodología 
Para hacer el análisis de estas muestras se utilizó el servidor BetterLab del [CCM, Morelia](https://www.matmor.unam.mx/). Para tener acceso a las muestras, se crearon enlaces simbólicos a los archivos FASTA para así no tener que copiarlos directamente. Se observó que teníamos secuencias de lecturas de un solo extremo, de extremo emparejado y también aquellas que tenían ambos tipos. Para reducir el espacio, se eliminaron las secuencias que tenían ambos tipos. Las muestras limpias se encuentran en la carpeta "reads".

### FASTQC
Queremos evaluar la calidad de las lecturas de secuencia contenidas en nuestros archivos, por lo que usaremos la herramienta FASTQC. Al aplicar FASTQC a nuestras secuencias, obtenemos como resultado la calidad de cada una y también cuáles pasan o no pasan la prueba de calidad. También podemos visualizar los resultados en gráficos, donde se puede observar si la calidad es buena o mala. En las siguientes imágenes podemos ver un ejemplo de cada una.
En el archivo fastqc_summaries.txt se encuentra documentado que muestras pasan y cuales no pasan la prueba. 

<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/0acc33af-49d1-4839-8e39-a134e11829cf" alt="Grafica con mala calidad" width="600"/>
  <p><em>Grafica con mala calidad.</em></p>
</div>  

<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/3e113f49-84df-4874-86a0-73c38cede785" alt="Grafica con buena calidad. Secuencia ERR209071_1" width="600"/>
  <p><em>Grafica con buena calidad. Secuencia ERR209071_1.</em></p>
</div>  

### Trimmomatic
Después de evaluar la calidad, vamos a limpiar nuestras muestras y así su calidad mejore. Para lograrlo, vamos a recortarlas usando la herramienta Trimmomatic, y despues de esto, podemos evaluar la calidad de nuestras secuencias otra vez con FASTQC. 

<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/752620d1-6a93-4737-883a-7491eb402799" alt="Grafica con buena calidad. Secuencia recortada ERR209071_1" width="600"/>
  <p><em>Grafica con buena calidad. Secuencia recortada ERR209071_1.</em></p>
</div>  

### Ensamblar 
Para ensamblar nuestras secuencias usamos metaSPAdes. El scrips "esamblar.sh" muestra el proceso. 

### Asignación taxonómica
Se hizo asignación taxonómica a las secuencias de nuestras muestras. Usamos kraken2 y para cada muestra se obtuvo un archivo .report
<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/968a1371-eefb-4f1e-bbfd-6fa3c3c8455c" alt="Archivo report de la secuencia ERR209071" width="600"/>
  <p><em>Archivo report de la secuencia ERR209071.</em></p>
</div>  

### Exploración de taxonomía
Kraken-biom es un programa que crea tablas BIOM a partir de la salida de Kraken. Usamos los archivos .report para crear archivo .biom, con este archivo podemos crear una tabla en R y así vizualizar las etiquetas taxonómicas. 
<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/6dddfcf6-f126-42b7-8585-fbf7a9e8c6eb)" alt="Tabla del archivo biom" width="600"/>
  <p><em>Tabla del archivo biom.</em></p>
</div>  
Al explorar nuestros datos en R, podemos notar que hay 41 filos. 
En la siguiente grafica se pueden observar los diferentes filos que hay y su abundancia; el filo más abundante es Bacteroidota. 
<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/1ed9c110-5190-41d1-8f9a-35ac3f02a61e" alt="Abundancia de filos" width="600"/>
  <p><em>Abundancia de filos.</em></p>
</div>

La beta biodiversidad se refiere a la variación en la composición de especies entre diferentes comunidades ecológicas. El gráfico NMDS que has mostrado es una herramienta para visualizar la biodiversidad beta, ya que muestra cómo las diferentes muestras se agrupan o se separan en función de su composición de especies.
Podemos observar que se forman grupos, lo que quiere decir que las muestras son parecidas entre sí. 
<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/7da94ab3-1b63-4ca2-b923-d2327c22179e" alt="Abundancia de filos" width="600"/>
  <p><em>Similitud entre las muestras</em></p>
</div>

La alfa diversidad se refiere a la diversidad dentro de una comunidad ecológica particular o muestra, y es una medida de la riqueza de especies y su abundancia relativa en una muestra dada.
tTenemos la siguiente grafica: 
<div align="center">
  <img src="https://github.com/marielaAriass/MetagenomicsProject/assets/100146837/b849b9e2-a89d-45a4-a8b2-412de1c97818" alt="Abundancia de filos" width="600"/>
  <p><em></em></p>
</div>
*El gráfico Observed muestra el número total de especies observadas en cada muestra. Las muestras con un mayor número de especies observadas tienen una mayor riqueza de especies. Un número alto de especies observadas sugiere una mayor diversidad en esa muestra específica. La mayoría de las muestras tienen entre 4000 y 8000 especies observadas, con algunas variaciones entre ellas.
*El gráfico Chao1 es un estimador de la riqueza de especies que trata de corregir el sesgo de no haber muestreado todas las especies presentes. Se basa en la abundancia de las especies raras.
Los valores de Chao1 generalmente son mayores o iguales a los valores observados, ya que estiman las especies no observadas. En nuestro gráfico, los valores de Chao1 son bastante similares a los valores observados, lo que sugiere que el muestreo ha sido bastante completo, aunque hay algunas muestras con estimaciones de riqueza significativamente más altas, indicando la posible presencia de especies raras no observadas.
*El índice de Shannon es una medida de diversidad que considera tanto la riqueza de especies como la equitatividad (cómo se distribuyen las especies en términos de abundancia). Un valor más alto del índice de Shannon indica una mayor diversidad, considerando tanto el número de especies como la uniformidad de sus abundancias. En el gráfico, los valores del índice de Shannon varían entre aproximadamente 1.5 y 4.5. Las muestras con valores más altos tienen una mayor diversidad, tanto en términos de número de especies como en la equitatividad de sus abundancias.
