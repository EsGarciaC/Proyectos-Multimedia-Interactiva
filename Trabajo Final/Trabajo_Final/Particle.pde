class Particle{
  PVector pos, vel, acc;
  float w;
  //Definición del estado inicial y dinámica de la particula
  Particle(){
    this.pos = PVector.random2D().mult(200);
    this.vel = new PVector(0, 0);
    this.acc = pos.copy().mult(random(0.0001, 0.00001));
    this.w = random(3, 5);
  }
  // Se actualiza la posición de la particula teniendo en cuenta si está pausado o no el reproductor
  void update(){
    if (!paused){
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    }
    else{
    this.vel.add(0,0);
    this.pos.add(0,0);
    }
  }
  
  void show(){
    reproductor.noStroke();
    reproductor.fill(255);
    reproductor.ellipse(this.pos.x, this.pos.y, this.w, this.w);
  }
  //Establecer si la particula ha salido de la pestaña del reproductor
  boolean edges(){
    if(this.pos.x < -reproductor.width/2 || this.pos.x > reproductor.width/2 || this.pos.y < -reproductor.height/2 || this.pos.y > reproductor.height/2){
      return true;
    }else{
      return false;
    }
  }
}
