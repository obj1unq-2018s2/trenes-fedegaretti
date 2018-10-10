import formacion.*
import trenes.*

class Deposito {
	var property formaciones
	var property locomotoras
	
	method vagonMasPesadoDeCadaFormacion() = 
		formaciones.filter{ formacion => formacion.vagonMasPesado() }
	method necesitaConductorExperimentado() = 
		formaciones.any{ formacion => formacion.esCompleja() }	
	method agregarLocomotoraAFormacion(){
		
	}
}
