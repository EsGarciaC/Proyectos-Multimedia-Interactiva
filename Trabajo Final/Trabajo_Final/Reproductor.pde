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
    
    // Starting positions of line
    float start_x = radius*cos(PI*(i+x)/bands);
    float start_y = radius*sin(PI*(i+x)/bands);
      
    // Draw line based on sound
    stroke(252,255,51);
    strokeWeight(1);

    line(start_x, start_y, start_x + fft.getFreq(i)*cos(PI*(i+x)/bands), start_y + fft.getFreq(i)*sin(PI*(i+x)/bands));

 }



    imageMode(CENTER);
    if (!paused){
      counter+=2;
    }
    rotate(counter*TWO_PI/360);
    image(cd, 0, 0, cd.width/8, cd.height/8);
  }
  
  
  
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
