object nave {
  var pasajeros = #{morfeo,trinity, neo}

  method cuantosPasajerosHay() = pasajeros.size()
  method pasajeroConMasVitalidad() = pasajeros.max( { p => p.vitalidad() } )
  method pasajeroConMenosVitalidad() = pasajeros.min( { p => p.vitalidad() } )
 
  method estaEquilibrada() { 
    return self.pasajeroConMasVitalidad().vitalidad() >= self.pasajeroConMenosVitalidad().vitalidad() * 2
  }
  method elElegidoEstaEnLaNave() = pasajeros.any( { p => p.esElegido() } ) 
  method choqueDeLaNave() {
    pasajeros.forEach( { p => p.saltar() } )
    return pasajeros.clear()
  }
  method acelerar() {
    return self.pasajerosQueNoSonElElegido().forEach( { p => p.saltar() } )
  }
  method pasajerosQueNoSonElElegido() {
    return pasajeros.filter( { p => !p.esElegido() } )  
  }
}

object neo {
  var energia = 100

  method energia() = energia
  method vitalidad() = energia * 0.1
  method esElegido() = true

  method saltar() {
    energia = 0.max(energia * 0.5)
  }  
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false

  method vitalidad() = vitalidad
  method estaCansado() = estaCansado 
  method esElegido() = false 

  method saltar() {
    vitalidad = 0.max(vitalidad - 1)
    estaCansado = !estaCansado
  }
}

object trinity  {
  method vitalidad() = 0
  method esElegido() = false
  method saltar() {}
}
