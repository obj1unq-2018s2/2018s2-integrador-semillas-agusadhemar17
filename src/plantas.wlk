class Planta {

	var property altura
	var property anioObtencion
	var horasDeSolToleradas
	
	method horasDeSolToleradas() {
		return horasDeSolToleradas
	}

	method esFuerte() {
		return self.horasDeSolToleradas() > 10
	}

	method daNuevasSemillas() {
		return self.esFuerte()
	}

	method espacioQueOcupa() 

	method esIdeal(parcela) 

}

class Menta inherits Planta {

	override method horasDeSolToleradas() {
		return 6
	}

	override method daNuevasSemillas() {
		return super() or self.altura() > 4
	}

	override method espacioQueOcupa() {
		return self.altura() * 3
	}

	override method esIdeal(parcela) {
		return parcela.superficie() > 6
	}

}

class Soja inherits Planta {

	override method horasDeSolToleradas() {
		if (self.esMenorAltura()) {
			return 6
		} else {
			return self.horasDeSolConAlturaMayor()
		}
	}

	method horasDeSolConAlturaMayor() {
		if (self.esAlturaMedia()) {
			return 7
		} else {
			return 9
		}
	}

	override method daNuevasSemillas() {
		return super() or (anioObtencion > 2007 and self.esAlta())
	}

	override method espacioQueOcupa() {
		return self.altura() / 2
	}

	method esMenorAltura() {
		return self.altura() < 0.5
	}

	method esAlturaMedia() {
		return self.altura().between(0.5, 1)
	}

	method esAlta() {
		return self.altura() > 1
	}

	override method esIdeal(parcela) {
		return not parcela.horasDeSolXDia() == self.horasDeSolToleradas()
	}

} 

class Quinoa inherits Planta {

	override method espacioQueOcupa() {
		return 0.5
	}

	override method daNuevasSemillas() {
		return super() or anioObtencion < 2005
	}

	override method esIdeal(parcela) {
		return not parcela.hayPlantasMayoresA(1.5)
	}

}

class SojaTransjenica inherits Soja {

	override method daNuevasSemillas() {
		return false
	}

	override method esIdeal(parcela) {
		return parcela.cantidadMaxDePlantasToleradas() == 1
	}

}

class HierbaBuena inherits Menta {

	override method espacioQueOcupa() {
		return super() * 2
	}

}

