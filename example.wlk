/*
Construido en el siglo I y ubicado en el centro de la Ciudad de Roma,
 es actualmente una de las siete maravillas del mundo moderno pero en sus inicios era un anfiteatro
  ideal para presenciar peleas de gladiadores y otros espectáculos públicos.

En el coliseo podemos presenciar a distintos gladiadores peleando con una gran variedad de armas
 y equipos pero empecemos de a poco.

Arranquemos por las armas. Entre las armas más comunes que se usaban estaban las armas de filo como espadas,
 dagas o hachas. Las armas de filo aportan un valor de ataque equivalente al filo del arma multiplicado por su longitud.
  (La longitud de las armas de filo se mide en centímetros y su filo es un número entre 0 y 1.) 
  Una alternativa para estas armas eran las llamadas contundentes, como por ejemplo mazas y martillos, 
  que eran las preferidas de los gladiadores más brutos.
   Las armas contundente aportan un poder de ataque igual al peso del arma.
    Los gladiadores pueden cambiar sus armas

Como de estas peleas no siempre salían todos los que entraban a la arena,
 muchos gladiadores no se valían solo de sus habilidades de pelea sino que llevaban algo de armadura.
  Por lo general usaban cascos y escudos para intentar parar los ataques del enemigo o no sufrir una herida letal 
  (al menos no tan rápido). Los cascos les brindan 10 puntos de armadura a su portador,
   los escudos por su parte suman 5 más el 10% de la destreza del luchador.
*/
/* 
Los Gladiadores.
Finalmente llegamos a los protagonistas de esta historia

Para poder entrar a combatir un gladiador debe saber atacar y defenderse para no ser una presa fácil. 
A modo de simplificación diremos que todos los gladiadores tienen 100 unidades de vida inicialmente.
 En esta oportunidad contamos con dos tipos de gladiadores:

Los mirmillones. Su estilo es uno de los más clásicos dado que salían a combatir con un arma de mano,
 en general una espada o gladius, más un escudo rectangular o un casco con cresta. 
 La fuerza promedio de este tipo de gladiadores es variable y su destreza es siempre 15. 
 Un gladiador puede cambiar su armadura.
Los dimachaerus. Estos gladiadores peleaban con varias armas. No usaban armadura porque eran tipos duros. 
Los dimachaerus eran gladiadores que se valían mucho de sus habilidades, 
tienen una fuerza de 10 y una destreza en particular que puede ser diferente para cada gladiador.
*/
/*
Pelea
Cuando un gladiador se pelea con otro lo que hace es atacarlo.
 Luego de sufrir los efectos correspondientes, el gladiador atacado realiza un contraataque,
  mediante su propia forma de atacar.
*/
object Coliseo {
  
}
class Gladiador {
  var property vida = 100
  var property fuerza
  var property destreza
  var property defensa
  var property sabeAtacar
  var property sabeDefenderse  
  var property armaActual
  var property ultimoAtacante
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
}

class Dimachaeru inherits Gladiador{
  override method armaActual() = []
  override method defensa() = destreza / 2
  override method atacarA(otroGladiador) {
    super(otroGladiador)
    self.destreza(self.destreza() + 1)
  }
  override method poderDeAtaque() = armaActual.poder() + fuerza
}

//armadura
object casco {
  method armadura() = 10
}

object escudo {
  method armadura() = 5 + destrezaDeLuchador()
}

class ArmaDeFilo {
  
  method ataque() = filo * longitud
  var property poder
}
//armas de filo
object espada {

}
object daga {

}
object hacha {

}
//armas contundentes
class ArmaContundete {
  var property poder
}

object maza {

}

object martillo {
  method ataque() = peso
}