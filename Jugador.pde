class Jugador {
  PVector posicion, velocidad;
  int ancho, alto, numeroJugador, puntos;
  
  Jugador(int numeroJugador_) {
    numeroJugador = numeroJugador_;
    ancho = 20; //ancho del rectangulo del jugador
    alto = 100; //alto del rectangulo del jugador
    puntos = 0; //puntos del jugador
    
    //Si el jugador es el numero 1 la posicion de su rectangulo
    //se ajustará de acuerdo a la diferencia del ancho

    if(numeroJugador == 1) {
      posicion = new PVector(ancho/2, height/2);
    } else if(numeroJugador == 2) {
      posicion = new PVector(width - ancho/2, height/2);
    }
    
    //se asigna la velocidad por defecto de los jugadores
    velocidad = new PVector(0,3);
  }
  
  //este metodo permite a los jugadores moverse
  void mover() {
    //Si el jugador 1 presiona la tecla w entonces...
    if(numeroJugador == 1 && key == 'w') {
      //Se moverá hacia arriba
      posicion.sub(velocidad);
    } 
    //Si el jugador 1 presiona la tecla s entonces...
    else if(numeroJugador == 1 && key == 's') {
      //se moverá hacia abajo
      posicion.add(velocidad);
    }
    
    //Si el jugador 2 presiona la tecla UP entonces...
    if(numeroJugador == 2 && keyCode == UP) {
      //Se moverá hacia arriba
      posicion.sub(velocidad);
    } 
    //Si el jugador 2 presiona la tecla DOWN entonces...
    else if(numeroJugador == 2 && keyCode == DOWN) {
      //Se moverá hacia abajo
      posicion.add(velocidad);
    }
    
    //restriccion para las coordenadas Y de los jugadores
    //solo pueden estar tan arriba en y = alto/2 (segundo argumento)
    //pero solo tan abajo en y = el alto de la pantalla - alto/2 (tercer argumento)
    posicion.y = constrain(posicion.y,alto/2,height - alto/2);
  }
  
  //se dibuja el rectangulo del jugador
  void mostrar() {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(posicion.x, posicion.y, ancho, alto);
  }
  
  PVector getPosicion() {
    return posicion;
  }
  
  //contador de puntos
  void setPuntos(int puntos_) {
    puntos += puntos_;
  }
  
  int getPuntos() {
    return puntos;
  }
}
