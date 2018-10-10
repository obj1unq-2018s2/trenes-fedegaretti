class VagonDePasajeros {

	var property largo
	var property ancho

	method cantidadDePasajeros() {
		if (ancho <= 2.5) {
			return largo * 8
		} else {
			return largo * 10
		}
	}

	method pesoMax() = self.cantidadDePasajeros() * 80

}

class VagonDeCarga {

	var property cargaMax

	method pesoMax() = cargaMax + 160

	method cantidadDePasajeros() = 0

}

class Locomotora {

	var property peso
	var property velocidadMax
	var property pesoMaxArrastre

	method arrastreUtil() = pesoMaxArrastre - peso

}

