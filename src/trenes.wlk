class VagonDePasajeros {

	const property largo
	const property ancho

	constructor(_largo, _ancho) {
		largo = _largo
		ancho = _ancho
	}

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

	const property cargaMax

	constructor(_cargaMax) {
		cargaMax = _cargaMax
	}

	method pesoMax() = cargaMax + 160

	method cantidadDePasajeros() = 0

}

class Locomotora {

	const property peso
	const property velocidadMax
	var property pesoVagones

	constructor(_peso, _velocidadMax) {
		peso = _peso
		velocidadMax = _velocidadMax
	}

	method pesoMaxArrastre() = pesoVagones - peso

}

