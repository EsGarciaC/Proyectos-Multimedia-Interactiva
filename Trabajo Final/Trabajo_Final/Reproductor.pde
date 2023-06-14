//Segunda pestaña
public class Reproductor extends PApplet {
  
  public void settings() {
    size(910, 553);
  }
  
  public void draw() {
    background(background);
    translate(width/2, height/2);
    strokeWeight(4);
    fft.forward(song.mix);
    updateParticulas();
    

    for(int i = 0; i < bands*2; i++){ 
    
    // Posición inicial de la linea
    float start_x = radius*cos(PI*(i+x)/bands);
    float start_y = radius*sin(PI*(i+x)/bands);
      
    // Dibujo de la linea basado en la frecuencia del sonido
    stroke(255);
    strokeWeight(1);

    line(start_x, start_y, start_x + fft.getFreq(i)*cos(PI*(i+x)/bands), start_y + fft.getFreq(i)*sin(PI*(i+x)/bands));

 }



    imageMode(CENTER);
    if (!paused){ // Mientras no esté pausado se rota el cd
      counter+=2;
    }
    rotate(counter*TWO_PI/360);
    image(cd, 0, 0, cd.width/8, cd.height/8);
  }
  
  
  // Pausar la canción con la tecla Enter
  void keyPressed(){
    if (keyCode == ENTER && song.isPlaying()){
      song.pause();
      paused = true;
    }
    else{
      song.play();
      paused = false;
    }
  }
}

//Actualizar las posiciones de las particulas y si se encuentrá fuera de los bordes se elimina la partícula
void updateParticulas(){
    Particle part = new Particle();
    if(!paused){
      particles.add(part);
    }
    for(int i=0; i<particles.size(); i++){
      if(!particles.get(i).edges()){
        Particle p = particles.get(i);
        p.update();
        p.show();
      }else{
        particles.remove(i);
      }
    }
}
