Proyecto integrador de la unidad 1, de la asignatura Manejo y Estructura de Datos.
#  Simulador de Gestión de Memoria (MMU) en PSeInt

## Descripción General

Este proyecto consiste en el desarrollo de un simulador de la **Unidad de Administración de Memoria (MMU)** utilizando pseudocódigo en PSeInt. El objetivo principal es representar cómo un sistema operativo gestiona la memoria mediante el uso de estructuras como tablas de páginas, mapas de bits y algoritmos de reemplazo.

El simulador permite comprender el proceso de traducción de direcciones lógicas a físicas y la gestión de fallos de página en un entorno controlado.


## Repositorio:

https://github.com/Rosibel081/PROYECTO_INTEGRADOR1_UNIDAD1_MED


## Fase 1: Estructuras de Datos y Asignación de Memoria

En esta fase se implementa el módulo **Administrador de Memoria**, encargado de representar el estado de la memoria RAM.

Se modela la memoria física como un arreglo de marcos, junto con un **mapa de bits** que indica si cada marco está libre u ocupado. Además, se implementa una función que permite visualizar el estado actual de la memoria.

### Objetivos cumplidos:

* Inicialización de la memoria RAM.
* Representación de marcos mediante arreglos.
* Implementación de un mapa de bits.
* Visualización del estado de ocupación de la memoria.


## Fase 2: Traducción de Direcciones (MMU)

En esta fase se desarrolla la lógica de la **Unidad de Gestión de Memoria (MMU)**, encargada de traducir direcciones lógicas a direcciones físicas.

Se utiliza una **tabla de páginas**, representada mediante arreglos, que permite determinar si una página está cargada en memoria y en qué marco se encuentra.

La función principal implementada es `TraducirDireccion(paginaLogica, offset)`, la cual:

1. Consulta la tabla de páginas.
2. Verifica si la página está presente en memoria.
3. Detecta fallos de página en caso de que no esté cargada.
4. Calcula la dirección física mediante la fórmula:
```
dirFisica = (marco * TAM_MARCO) + offset
```

###  Objetivos cumplidos:

* Implementación de la tabla de páginas.
* Detección de fallos de página.
* Traducción correcta de direcciones lógicas a físicas.


## Fase 3: Algoritmos de Reemplazo de Páginas

En esta fase se simula una situación donde la memoria se llena y es necesario aplicar algoritmos de reemplazo de páginas.

Se trabaja con una secuencia de referencias de páginas y un número limitado de marcos disponibles, lo que obliga al sistema a decidir qué páginas reemplazar cuando ocurre un fallo.

Se implementaron dos algoritmos:

### 🔹 FIFO (First In, First Out)

Reemplaza la página que fue cargada primero en memoria.

### 🔹 OPT (Óptimo)

Selecciona la página que tardará más tiempo en volver a ser utilizada, minimizando así el número de fallos de página.

El sistema contabiliza la cantidad de fallos de página generados por cada algoritmo y permite comparar su eficiencia.

### Objetivos cumplidos:

* Detección automática de fallos de página.
* Implementación del algoritmo FIFO.
* Implementación del algoritmo Óptimo (OPT).
* Comparación de rendimiento entre algoritmos.

---

##  Conclusión

El simulador permite entender de manera práctica cómo funciona la gestión de memoria en los sistemas operativos, especialmente el papel de la MMU, la importancia de la tabla de páginas y el impacto de los algoritmos de reemplazo.

Se observa que el algoritmo Óptimo presenta un mejor rendimiento en términos de fallos de página, aunque no es aplicable en sistemas reales debido a que requiere conocer referencias futuras.

---

## ▶️ Cómo ejecutar

1. Abrir el código en PSeInt.
2. Ejecutar el programa principal.
3. Observar la simulación de:

   * Estado de memoria
   * Traducción de direcciones
   * Fallos de página
   * Resultados de algoritmos FIFO y OPT

---
## Colaboradores 
  * Carlos Alberto Narváes Moran (NM25012)
  * William Eduardo Torres Serrano (TS25003)
  * Joseline Rosibel Aldana Aldana (AA13081)
