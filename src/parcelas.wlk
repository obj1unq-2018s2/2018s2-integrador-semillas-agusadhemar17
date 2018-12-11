import plantas.*

class Parcela {

	var property ancho
	var property largo
	var plantas = #{}
	var property horasDeSolXDia

	method superficie() {
		return ancho * largo
	}

	method cantidadMaxDePlantasToleradas() {
		if (ancho > largo) {
			return self.superficie() / 5
		} else {
			return self.superficie() / 3 + largo
		}
	}

	method tieneComplicaciones() {
		return plantas.any({ planta => planta.horasDeSolToleradas() < horasDeSolXDia })
	}

	method plantar(planta) {
		if (plantas.size() >= self.cantidadMaxDePlantasToleradas() or (planta.horasDeSolToleradas() - horasDeSolXDia) >= 2) {
			self.error("Se llego al limite de plantas en esta parcela")
		} else {
			plantas.add(planta)
		}
	}

	method hayPlantasMayoresA(altura) {
		return plantas.any({ planta => planta.altura() > altura })
	}

	method cantidadPlantadas() {
		return plantas.size()
	}

	method seAsociaBien(planta)

	method porcentajeDeAsociadas() {
		return self.cantidadPlantadas() * (plantas.filter({ planta => planta.seAsociaBien(planta) }).size() / 100)
	}

}

class Ecologica inherits Parcela {

	override method seAsociaBien(planta) {
		return not self.tieneComplicaciones() and planta.esIdeal(self)
	}

}

class Industrial inherits Parcela {

	override method seAsociaBien(planta) {
		return self.cantidadPlantadas() == 2 and planta.esFuerte()
	}

}

object inta {

	const parcelas = #{}
	
	method agregarParcela(parcela){
		parcelas.add(parcela)
	}

	method promedioDePlantasXParcela() {
		return parcelas.sum({ parcela => parcela.cantidadPlantadas() }) / parcelas.size()
	}

	method masAutosustentable() {
		return self.mayorA4Plantadas().max({ parcela => parcela.porcentajeAsociadas() })
	}

	method mayorA4Plantadas() {
		return parcelas.filter({ parcela => parcela.cantidadPlantadas() > 4 })
	}

}

