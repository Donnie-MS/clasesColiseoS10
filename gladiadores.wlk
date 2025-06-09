import armas.*
import grupos.*
class Gladiador {
  var property vida = 100
  var property fuerza
  var property destreza
  var property defensa
  var property armaActual
  const property armadura = []
  method contraatacar(unGladiador) {
    self.atacarA(unGladiador)
  }
  method estaVivo() {
    var resultado = false
    if (vida >= 1) {
      resultado = true
    }
    return resultado
  }
  method poderDeAtaque() = armaActual.poder() + fuerza
  method atacarA(otroGladiador) {
    otroGladiador.recibirAtaque(self)
  }
  method recibirAtaque(unGladiador) {
    if (self.estaVivo()) {
      self.vida(vida - (unGladiador.poderDeAtaque() - defensa).max(0))
      self.contraatacar(unGladiador)
    }
  }
}

class Mirmillon inherits Gladiador{
  override method destreza() = 15

  method crearUnGrupo(otroGladiador) {
    const nuevoGrupo = new Grupo(
    gladiadores=#{self,otroGladiador},
    nombre = "mirmillolandia"
    )
    return nuevoGrupo
  }
}

class Dimachaeru inherits Gladiador{
  override method armaActual() = []
  override method defensa() = destreza / 2
  override method atacarA(otroGladiador) {
    super(otroGladiador)
    self.destreza(self.destreza() + 1)
  }
  override method poderDeAtaque() = armaActual.poder() + fuerza
  method crearUnGrupo(otroGladiador) {
    const nuevoGrupo = new Grupo(
      gladiadores=#{self,otroGladiador},
      nombre = "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque())
    )
    return nuevoGrupo   
  }
}