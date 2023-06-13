public class Reproductor extends PApplet {
  
  public void settings() {
    size(910, 553);
  }
  
  public void draw() {
    background(background);
    translate(width/2, height/2);
    strokeWeight(4);
    //fft.analyze(spectrum);
    updateParticulas();
    
    // float r2;
    // for (int i = 0; i < 360; i += 6){
    //   r2 = r + 10 + clamp(spectrum[i] * 1000, 100);
    //   stroke(252,255,51);
    //   line(r * cos(radians(i)), r * sin(radians(i)), r2 * cos(radians(i)), r2 * sin(radians(i)));
    // }

    imageMode(CENTER);
    counter+=2;
    rotate(counter*TWO_PI/360);
    image(cd, 0, 0, cd.width/8, cd.height/8);
  }
}

void updateParticulas(){
    Particle part = new Particle();
    particles.add(part);
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
