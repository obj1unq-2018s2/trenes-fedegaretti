import trenes.*

class Formacion {

	var property vagones
	var property locomotoras

	method cantVagonesLivianos() = vagones.count{ vagon => vagon.pesoMax() < 2500 }

	method velocidadMax() = locomotoras.min{ locomotora => locomotora.velocidadMax() }
	
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
	
}

