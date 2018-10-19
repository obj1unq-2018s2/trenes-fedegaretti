import trenes.*

class Formacion {

	var  vagones = #{}
	var  locomotoras = #{}
	
	method agregarLocomotora(locomotora) {
		locomotoras.add(locomotora)
	}
	
	method agregarVagon(vagon){
		vagones.add(vagon)
	}
	
	method cantVagonesLivianos() = vagones.count{ vagon => vagon.pesoMax() < 2500 }
	
	method esEficiente() = 
		locomotoras.all{ locomotora => locomotora.pesoMaxArrastre() > locomotora.peso()*5 }
	
	method pesoTotalVagones() = vagones.sum{ vagon => vagon.pesoMax() }
	
	method pesoTotalLocomotoras() = locomotoras.sum{ locomotora => locomotora.peso()}
	
	method arrastreUtilTotalLocomotoras() = 
		locomotoras.sum{ locomotora => locomotora.arrastreUtil() }
	
	method puedeMoverse() = self.arrastreUtilTotalLocomotoras() >= self.pesoTotalVagones()
	
	method kilosQueFaltanParaMoverse()= if (self.puedeMoverse()) 0 
		else self.pesoTotalVagones() - self.arrastreUtilTotalLocomotoras()
	
	method vagonMasPesado() = vagones.max{ vagon => vagon.pesoMax() }
		
	method esCompleja() = (vagones.size() + locomotoras.size())>20 ||
		(self.pesoTotalVagones() + self.pesoTotalLocomotoras())> 10000
	
	method cantDePasajeros() = vagones.sum{ vagon => vagon.cantMaxDePasajeros() }
	
	method cantDeBanios() = vagones.sum{ vagon => vagon.banios() }
	
	method limiteDeVelocidad()
	
	method velocidadMax() {
		if (locomotoras.min{ locomotora => locomotora.velocidadMax() }.velocidadMax() > self.limiteDeVelocidad()) {
			return self.limiteDeVelocidad()
		} else {
	 		return locomotoras.min{ locomotora => locomotora.velocidadMax() }.velocidadMax()
	}
	}
	method estaBienArmada() = self.puedeMoverse()
}
class FormacionDeCortaDistancia inherits Formacion  {
	
	override method limiteDeVelocidad() = 60

	override method estaBienArmada() = super() && !self.esCompleja()
}

class FormacionDeLargaDistancia inherits Formacion {

	var cantCiudades //  

	override method limiteDeVelocidad() = if (cantCiudades == 2) 200 else 150 

	method tieneBaniosSuficientes() = self.cantDeBanios() >= self.cantDePasajeros() / 50

	override method estaBienArmada() = super() && self.tieneBaniosSuficientes()
}

class FormacionDeAltaVelocidad inherits FormacionDeLargaDistancia {
	
	method vagonesLivianos() = vagones.all{ vagon => vagon.esLiviano() }
	
	override method limiteDeVelocidad() = 400

	override method estaBienArmada() = super() && self.velocidadMax() > 250 && self.vagonesLivianos()
}


