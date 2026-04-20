Algoritmo SimuladorReemplazoPaginas
	
	Definir CANT_MARCOS_USUARIO Como Entero
	CANT_MARCOS_USUARIO <- 3
	
	Dimension Referencias[12]
	
	Referencias[1] <- 1
	Referencias[2] <- 2
	Referencias[3] <- 3
	Referencias[4] <- 4
	Referencias[5] <- 1
	Referencias[6] <- 2
	Referencias[7] <- 5
	Referencias[8] <- 1
	Referencias[9] <- 2
	Referencias[10] <- 3
	Referencias[11] <- 4
	Referencias[12] <- 5
	
	Dimension Marcos[3]
	Dimension Ocupado[3]
	
	Definir fallosFIFO, fallosOPT Como Entero
	
	fallosFIFO <- SimularFIFO(Marcos, Ocupado, Referencias, CANT_MARCOS_USUARIO)
	fallosOPT <- SimularOPT(Marcos, Ocupado, Referencias, CANT_MARCOS_USUARIO)
	
	Escribir "Fallos de página FIFO: ", fallosFIFO
	Escribir "Fallos de página OPT: ", fallosOPT

	
FinAlgoritmo

// -------------------------------------------
SubProceso InicializarMarcos(Marcos Por Referencia, Ocupado Por Referencia, n)
	Definir i Como Entero
	Para i <- 1 Hasta n
		Ocupado[i] <- 0
		Marcos[i] <- -1
	FinPara
FinSubProceso

// -------------------------------------------
Funcion idx <- BuscarPagina(pag, Marcos, Ocupado, n)
	Definir i Como Entero
	idx <- -1
	Para i <- 1 Hasta n
		Si Ocupado[i] = 1 Y Marcos[i] = pag Entonces
			idx <- i
		FinSi
	FinPara
FinFuncion

// -------------------------------------------
Funcion fallos <- SimularFIFO(Marcos Por Referencia, Ocupado Por Referencia, Referencias, n)
	Definir t, pag, i, libre, punteroFIFO Como Entero
	
	InicializarMarcos(Marcos, Ocupado, n)
	fallos <- 0
	punteroFIFO <- 1
	
	Para t <- 1 Hasta 12
		pag <- Referencias[t]
		
		Si BuscarPagina(pag, Marcos, Ocupado, n) = -1 Entonces
			fallos <- fallos + 1
			
			libre <- -1
			Para i <- 1 Hasta n
				Si Ocupado[i] = 0 Entonces
					libre <- i
				FinSi
			FinPara
			
			Si libre <> -1 Entonces
				Ocupado[libre] <- 1
				Marcos[libre] <- pag
			Sino
				Marcos[punteroFIFO] <- pag
				punteroFIFO <- (punteroFIFO MOD n) + 1
			FinSi
		FinSi
	FinPara
	
	
FinFuncion

Funcion victima <- ElegirVictimaOPT(tActual, Marcos, Referencias, n)
	Definir i, k, pag, dist, mayorDist, mejorMarco Como Entero
	Definir encontrado Como Logico
	
	mayorDist <- -1
	mejorMarco <- 1
	
	Para i <- 1 Hasta n
		pag <- Marcos[i]
		dist <- 99999
		encontrado <- Falso
		
		Para k <- tActual + 1 Hasta 12
			Si Referencias[k] = pag Entonces
				dist <- k - tActual
				encontrado <- Verdadero
			FinSi
		FinPara
		
		// Si nunca se vuelve a usar, es el mejor candidato
		Si encontrado = Falso Entonces
			dist <- 99999
		FinSi
		
		Si dist > mayorDist Entonces
			mayorDist <- dist
			mejorMarco <- i
		FinSi
	FinPara
	
	victima <- mejorMarco
	
FinFuncion


// -------------------------------------------
Funcion fallos <- SimularOPT(Marcos Por Referencia, Ocupado Por Referencia, Referencias, n)
	Definir t, pag, i, libre, v Como Entero
	
	
	InicializarMarcos(Marcos, Ocupado, n)
	fallos <- 0
	
	Para t <- 1 Hasta 12
		pag <- Referencias[t]
		
		Si BuscarPagina(pag, Marcos, Ocupado, n) = -1 Entonces
			fallos <- fallos + 1
			
			libre <- -1
			Para i <- 1 Hasta n
				Si Ocupado[i] = 0 Entonces
					libre <- i
				FinSi
			FinPara
			
			Si libre <> -1 Entonces
				Ocupado[libre] <- 1
				Marcos[libre] <- pag
			Sino
				v <- ElegirVictimaOPT(t, Marcos, Referencias, n)
				Marcos[v] <- pag
			FinSi
		FinSi
	FinPara
	
	
FinFuncion
