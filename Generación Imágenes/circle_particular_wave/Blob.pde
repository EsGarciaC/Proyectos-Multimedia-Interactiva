// Burbujas del centro
class Blob {
  PVector pos;
  float r;
  PVector vel;
  
  Blob(float x, float y,float z){
    pos = new PVector(x,y,z);  // Vector con la posicion
    vel = PVector.random3D();  //Velocidad
    vel.mult(random(1,4));
    r = 70;    //Radio de la burbuja
  }
  
  void update(){
    pos.add(vel);
  //Si se pasa de los limites impuestos cambia de direccion
    if (pos.x > 330 || pos.x < 260){
      vel.x *= -1;
    }
    if (pos.y > 330 || pos.y < 260){
      vel.y *= -1;
    }
  }
}
