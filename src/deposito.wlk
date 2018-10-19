import formacion.*
import trenes.*

class Deposito {
	var  formaciones
	var  locomotoras
	
	method vagonMasPesadoDeCadaFormacion() = 
		formaciones.map{ formacion => formacion.vagonMasPesado() }.asSet()
	
	method necesitaConductorExperimentado() = 
		formaciones.any{ formacion => formacion.esCompleja() }	
	
	method agregarLocomotoraAFormacion(formacion){
		if (!formacion.puedeMoverse() && self.hayLocomotoraUtilPara(formacion)) {
			formacion.agregarLocomotora(self.encontrarLocomotoraUtilPara(formacion))	
			}
	}
	
	method esLocomotoraUtilPara(locomotora,formacion) =
		locomotora.arrastreUtil() >= formacion.kilosQueFaltanParaMoverse()
	
	method hayLocomotoraUtilPara(formacion) = 
		locomotoras.any{ locomotora => self.esLocomotoraUtilPara(locomotora,formacion)}
	
	method encontrarLocomotoraUtilPara(formacion) =
		locomotoras.find{locomotora=>self.esLocomotoraUtilPara(locomotora,formacion)}
}
