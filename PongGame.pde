Jugador jugador1, jugador2;
Pelota pelota;
boolean ganador;
int puntajeMaximo;

void setup() {
  size(600,400);
  
  jugador1 = new Jugador(1); //se crea jugador 1
  jugador2 = new Jugador(2); //se crea jugador 2
  
  pelota = new Pelota(1); //se crea la pelota
  ganador = false; //al inicio no hay ningun ganador
  
  puntajeMaximo = 3; //el puntaje que los jugadores deben de alcanzar para ganar
}

void draw() {
  background(0);
  
  //se pone  en pantalla los puntajes de cada jugador
  textSize(30);
  text(jugador1.getPuntos(), width/2 - 60, 40);
  text(jugador2.getPuntos(), width/2 + 30, 40);
  
  //Si aun no hay ganador, entonces se seguirá dibujando
  //el escenario
  if(ganador == false) {
    strokeWeight(2);
    stroke(255);
    
    for(int y = 0; y < height; y+= 10) {
      line(width/2,y,width/2,y+5);
    }
    
    pelota.mostrar();
    pelota.mover();
  }
  
  jugador1.mostrar();
  jugador1.mover();
  pelota.validarReboteJugador1(jugador1.getPosicion());
  
  jugador2.mostrar();
  jugador2.mover();
  pelota.validarReboteJugador2(jugador2.getPosicion());
  
  pelota.validarReboteParedes();
  validarPuntos();
  validarGanador();
}

void validarPuntos() {
  PVector posicionPelota = pelota.getPosicion();
  
  //Si la pelota sobrepasa el borde derecho
  //el jugador 1 gana un punto
  if(posicionPelota.x > width && jugador1.getPuntos() <= puntajeMaximo) {
    jugador1.setPuntos(1);
    //Cada que se marca un punto, la pelota
    //vuelve a iniciar en el centro y con direccion contraria
    pelota = new Pelota(-1);
  } 
  //Si la pelota sobrepasa el borde izquierdo
  //el jugador 2 gana un punto
  else if(posicionPelota.x < 0 && jugador2.getPuntos() <= puntajeMaximo) { 
    jugador2.setPuntos(1);
    //Cada que se marca un punto, la pelota
    //vuelve a iniciar en el centro y con direccion contraria
    pelota = new Pelota(1);
  }
  //Cuando se anuncia el ganador el juego se detiene
  //y si el usuario preciona cualquier tecla el juego 
  //se reinicia
  else if (keyPressed && ganador == true) {
    setup();
  }
}

void validarGanador() {
  //Al alcanzar el puntaje maximo el jugador gana
  if(jugador1.getPuntos() == puntajeMaximo) {
    text("Jugador 1 ha ganado la partida", 80, height/2);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", 95, height/2 + 30);
    ganador = true;
  } else if(jugador2.getPuntos() == puntajeMaximo) {
    text("Jugador 2 ha ganado la partida", 80, height/2);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", 95, height/2 + 30);
    ganador = true;
  }
}
