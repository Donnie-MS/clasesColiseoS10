import gladiadores.*
class Grupo {
  const property nombre
  const property gladiadores = #{}
  var property cantPeleas = 0
  method aumentarPeleas() {
    self.cantPeleas(self.cantPeleas() + 1)
  }
  method combatir(otroGrupo) {
    self.aumentarPeleas()
    otroGrupo.aumentarPeleas()
    (1..3).forEach({round => self.campeon().atacarA(otroGrupo.campeon())})
  }
  method campeon() = self.miembrosQueSiguenVivos().max({gladiador => gladiador.fuerza()})
  method miembrosQueSiguenVivos() = gladiadores.filter({gladiador => gladiador.estaVivo()})
  method esMiembro(unGladiador) = gladiadores.contains(unGladiador)
  method agregarMiembro(unGladiador) {
    if (self.esMiembro(unGladiador)) {//comprobar si es de un grupo distinto
      self.error("El gladiador ya está en el grupo") 
    }
    gladiadores.add(unGladiador)
  }
  method quitarMiembro(unGladiador) {
    if (not self.esMiembro(unGladiador)) {
      self.error("El gladiador no estaba en el grupo")
    }
    gladiadores.remove(unGladiador)
  }
}