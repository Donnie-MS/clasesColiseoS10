import gladiadores.*
//armadura
object casco {
  method defensa(unGladiador) = 10
}

object escudo {
  method defensa(unGladiador) = 5 + (unGladiador.destreza()* 0.1)
}
//armas
class ArmaDeFilo {
  var property filo
  var property longitud 
  method poderDeAtaque() = filo * longitud

}
class ArmaContundete {
  var property peso
  method poderDeAtaque() = peso
}