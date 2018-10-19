class Vagon {

	method pesoMax()

	method esLiviano() = self.pesoMax() < 2500

}

class VagonDePasajeros inherits Vagon {

	var largo
	var ancho
	var banios

	method cantMaxDePasajeros() {
		if (ancho <= 2.5) {
			return largo * 8
		} else {
			return largo * 10
		}
	}

	override method pesoMax() = self.cantMaxDePasajeros() * 80

	method banios() = banios

}

class VagonDeCarga inherits Vagon {

	var property cargaMax

	override method pesoMax() = cargaMax + 160

	method cantMaxDePasajeros() = 0
	
	method banios()= 0
	
}

class Locomotora {

	var peso
	var property velocidadMax
	var pesoMaxArrastre

	method peso() = peso

	method pesoMaxArrastre() = pesoMaxArrastre

	method arrastreUtil() = pesoMaxArrastre - peso
}

