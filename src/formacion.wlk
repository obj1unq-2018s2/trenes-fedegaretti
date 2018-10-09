import trenes.*

class Formacion {

	var property vagones
	var property locomotoras

	method cantVagonesLivianos() = vagones.count{ vagon => vagon.pesoMax() < 2500 }

	method velocidadMax() = locomotoras.min{ locomotora => locomotora.velocidadMax() }
	
	method esEficiente() = 
		locomotoras.all{ locomotora => locomotora.pesoMaxArrastre() > locomotora.peso()*5 }
	
	method pesoTotalVagones() = vagones.sum{ vagon => vagon.pesoMax() }
	
	method arrastreTotalLocomotoras() = 
		locomotoras.sum{ locomotora => locomotora.pesoMaxArrastre() }
	
	method puedeMoverse() = self.arrastreTotalLocomotoras() >= self.pesoTotalVagones()
	
	method KilosQueFaltanParaMoverse(){
		if (self.puedeMoverse()){
			return 0
		}
	}
	
	}

