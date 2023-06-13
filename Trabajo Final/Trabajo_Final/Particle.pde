class Particle{
  PVector pos, vel, acc;
  float w;
  Particle(){
    this.pos = PVector.random2D().mult(200);
    this.vel = new PVector(0, 0);
    this.acc = pos.copy().mult(random(0.0001, 0.00001));
    this.w = random(3, 5);
  }
  
  void update(){
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }
  
  void show(){
    reproductor.noStroke();
    reproductor.fill(255);
    reproductor.ellipse(this.pos.x, this.pos.y, this.w, this.w);
  }
  
  boolean edges(){
    if(this.pos.x < -reproductor.width/2 || this.pos.x > reproductor.width/2 || this.pos.y < -reproductor.height/2 || this.pos.y > reproductor.height/2){
      return true;
    }else{
      return false;
    }
  }
}
