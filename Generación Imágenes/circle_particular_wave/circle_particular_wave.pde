//Valores principales que controlan la animación de "aparecer" inicial de los circulos, MUY sensibles//
float alphaNum = 1.1;
float alphaOffset = 0.02;
float rotation = random(-0.1, 0.1);

//Se crean las burbujas de acuerdo al numero dentro de los corchetes 
//Blob b;
int num_blob = int(random(3,6)); //Cantidad aleatoria de las burbujas   
Blob[] blobs = new Blob[num_blob];

//Activar color por distancia de mouse///
boolean TrackMouseForColor = true;
color[] colors = {color(15, 97, 67), color(58, 42, 143), color(255, 0, 130), color(42, 210, 110), color(100, 150, 255)};

void setup(){
  /*
  Cambiar de P2D a P3D, esto cambia los motores de renderizado para 2D y 3D.
  Si no se pone ninguno de los 2, Processing cambia a un motor de render en donde NO FUNCIONA NINGUNA ANIMACIÒN
  */
  size(600,600, P3D); 
  for (int i = 0; i < blobs.length; i++){
    blobs[i] = new Blob(width/2,height/2,width/2);
  }
  background(0);
  
  hint(ENABLE_STROKE_PERSPECTIVE); //ACTIVAR SOLO EN 3D
}

void draw(){

  background(0);
  noFill();
  translate(width/2, height/2);
  
/// Aca sucede las acciones de las burbujas
  
      loadPixels(); 
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      int index = x + y * width;
      float total = 0;
      for (Blob b: blobs){
        float d = dist(x,y, b.pos.x, b.pos.y);
        total += 30*b.r / d;
      
        pixels[index] = color(0,total-100,constrain(total,0,250)-50); // Modificar el color de las burbujas
      }
    }
  }
  
  updatePixels();
  for (Blob b : blobs){
    b.update();
    
  }
//////////ACTIVAR PARA 3D////////
  
  rotateY(rotation);
  
  stdcircle3D(colors[0]);
  noiseCircle3D(colors[1], 1, 5, 20);
  noiseCircle3D(colors[2], QUARTER_PI, 12);
  noiseCircle3D(colors[3], PI);
  noiseCircle3D(colors[4], TWO_PI);
  rotation-=0.01;

  ///////ACTIVAR PARA 2D////////
  /*
  stdcircle(colors[0]);
  noiseCircle(colors[1], 1, 5, 20);
  noiseCircle(colors[2], QUARTER_PI, 12);
  noiseCircle(colors[3], PI);
  noiseCircle(colors[4], TWO_PI);
  */
  ///////////////////////////////////

  if (alphaNum < 0.000001){
    alphaNum = 0.000001;
    alphaOffset = 0.0000001;
  }else{
   alphaOffset -= 0.000001;
   alphaNum -= 0.003;
  }
  drawParticles();
}
