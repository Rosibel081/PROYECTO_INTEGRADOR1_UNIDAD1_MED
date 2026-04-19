// FASE 1

SubProceso InicializarRAM(MarcoOcupado Por Referencia, MarcoPagina Por Referencia)
	Definir i Como Entero;
	Para i <- 0 Hasta 3 Hacer
		MarcoOcupado[i] <- 0;
		MarcoPagina[i] <- -1;
	FinPara
FinSubProceso

SubProceso MostrarMapaBits(MarcoOcupado Por Referencia)
	Definir i Como Entero;
	Escribir "Mapa de bits (M0..M3): ", Sin Saltar;
	Para i <- 0 Hasta 3 Hacer
		Escribir MarcoOcupado[i], " ", Sin Saltar;
	FinPara
	Escribir "";
FinSubProceso 


// ========
// FASE 2
// ========

SubProceso EjecutarFase2
	//Definicion de variables 
	Definir TAM_MARCO Como Entero;
	Definir paginaLogica, offset, dirFisica Como Entero;
	Dimension Presente[10];
	Dimension MarcoDePagina[10];
	
	// Tamaño de marco
	TAM_MARCO <- 4096;
	
	// Datos predeterminados
	Presente[0] <- 1;
	Presente[1] <- 1;
	Presente[2] <- 0;
	Presente[3] <- 1;
	
	MarcoDePagina[0] <- 4;
	MarcoDePagina[1] <- 7;
	MarcoDePagina[3] <- 2;
	
	Escribir "";
	Escribir "--- FASE 2: ---";
	Escribir "Ingrese la pagina logica:";
	Leer paginaLogica;
	Escribir "Ingrese el offset:"; 
	Leer offset;
	
	dirFisica <- TraducirDireccion(paginaLogica, offset, Presente, MarcoDePagina, TAM_MARCO);
	
	Si dirFisica <> -1 Entonces
		Escribir "La direccion fisica es: ", dirFisica;
	FinSi
FinSubProceso

//Direccion fisica  donde se ubica el marco de pagina a partir del tamaño del marco, fijado al inicio

Funcion dirFisica <- TraducirDireccion(paginaLogica, offset, Presente Por Referencia, MarcoDePagina Por Referencia, TAM_MARCO)
	Definir marco Como Entero;
	
	Si Presente[paginaLogica] = 0 Entonces
		Escribir "Fallo de pagina: la pagina no esta cargada en memoria."
		dirFisica <- -1
	SiNo
		marco <- MarcoDePagina[paginaLogica]
		dirFisica <- (marco * TAM_MARCO) + offset
	FinSi
FinFuncion

// ==================
// PROCESO PRINCIPAL
// ==================
Proceso SimuladorMMU
	
	// 1. Variables y Arreglos
	Definir MarcoOcupado, MarcoPagina Como Entero;
	Dimension MarcoOcupado[4];
	Dimension MarcoPagina[4]; // -1 si no hay página cargada
	
	Escribir "Iniciando Simulador MMU...";
	
	// 2. Ejecución Fase 1
	InicializarRAM(MarcoOcupado, MarcoPagina);
	MostrarMapaBits(MarcoOcupado);
	
	// 3. Ejecución Fase 2
	EjecutarFase2
	
FinProceso
