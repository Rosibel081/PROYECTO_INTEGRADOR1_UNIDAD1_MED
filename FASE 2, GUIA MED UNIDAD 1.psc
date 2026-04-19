Proceso TraduccionDireccion
		//Definicion de variables 
		Definir TAM_MARCO Como Entero
		Definir paginaLogica, offset, dirFisica Como Entero
		Dimension Presente[10]
		Dimension MarcoDePagina[10]
		//Tamaño de marco
		TAM_MARCO <- 4096
		
		//Datos predeterminasos, sujetos a cambio 
		//Arreglos iniciados en cero
		Presente[0] <- 1
		Presente[1] <- 1
		Presente[2] <- 0
		Presente[3] <- 1
		
		MarcoDePagina[0] <- 4
		MarcoDePagina[1] <- 7
		MarcoDePagina[3] <- 2
		
		//Solicitud de paginas logicas al usuario
		//Implementacion del offset o avance 
		Escribir "Ingrese la pagina logica:"
		Leer paginaLogica
		Escribir "Ingrese el offset:" 
		Leer offset
		
		dirFisica <- TraducirDireccion(paginaLogica, offset, Presente, MarcoDePagina, TAM_MARCO)
		
		Si dirFisica <> -1 Entonces
			Escribir "La direccion fisica es: ", dirFisica
		FinSi
		
FinProceso

//Direccion fisica  donde se ubica el marco de pagina a partir del tamaño del marco, fijado al inicio

Funcion dirFisica <- TraducirDireccion(paginaLogica, offset, Presente, MarcoDePagina, TAM_MARCO)
	
    Si Presente[paginaLogica] = 0 Entonces
        Escribir "Fallo de pagina: la pagina no esta cargada en memoria."
        dirFisica <- -1
    SiNo
        marco <- MarcoDePagina[paginaLogica]
        dirFisica <- (marco * TAM_MARCO) + offset
    FinSi
FinFuncion
