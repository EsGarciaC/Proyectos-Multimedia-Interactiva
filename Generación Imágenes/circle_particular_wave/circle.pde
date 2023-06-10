float x = 0;
float y = 0;
float r = 200;
float r2 = 0;
float xoff = 0;
float yoff = 0;
float phase = 0;
float zoff = 0;
float z = 0;


void stdcircle(color col){
  stroke(col);
  strokeWeight(5);
  
  beginShape();
  
  for (float a = 0; a < TWO_PI; a+=0.01){
    float xc = r*cos(a);
    float yc = r*sin(a);
    
    //////////////Controla el color por distancia al mouse////////////////
    //NO funciona bien si el circulo rota
    color cold = color(50,50,50);
    if (TrackMouseForColor){
      cold = distColorLerp(col, xc, yc);
    }else{
      cold = col;
    }
    ///////////////Esto controla el alpha para la animación inicial/////////////////////
    if(a/TWO_PI > alphaNum+alphaOffset){
      stroke(cold, 255);
    }else if(a/TWO_PI > alphaNum && a/TWO_PI < alphaNum + alphaOffset){
      stroke(cold, a/TWO_PI*10);
    }else{
      stroke(cold, 0);
    }
    ////////////////////////////////////////////////////////////////////////////////////
    //Cambio a curveVertex para que el trazado se vea mejor
    curveVertex(xc,yc);
  }
  endShape(CLOSE);
}
/*
  circulos con ruido, input:
  col: Color del circulo
  seed: desface en los senoides del circulo, (0, 2PI).
  numSinoids: el número de senoides que tienen el circulo base.
  AmpSinoids: Amplitud de los senoides que tiene el circulo base.
*/
void noiseCircle(color col, float seed, int numSinoids, int AmpSinoids){
  
  beginShape();
  strokeWeight(4);
  /*
  r2 es el radio de el circulo
  x, y las coordenadas de los vetices de la figura
  */
  for (float a = 0; a < TWO_PI; a+=0.01){
    //Controladores de ruido
    xoff = cos(a+phase);
    yoff = sin(a+phase);
    r2 = map(noise(xoff*seed, yoff*seed), 0, 1, 200-AmpSinoids, 200+AmpSinoids);
    x = (r2 + AmpSinoids * sin(numSinoids * a + seed)) * cos (a);
    y = (r2 + AmpSinoids * cos(numSinoids * a + seed)) * sin (a);
 
    //////////////Controla el color por distancia al mouse////////////////
    //NO funciona bien si el circulo rota
    color cold = color(50,50,50);
    if (TrackMouseForColor){
      cold = distColorLerp(col, x, y);
    }else{
      cold = col;
    }
    ///////////////Esto controla el alpha para la animación inicial/////////////////////
    if(a/TWO_PI > alphaNum+alphaOffset){
      stroke(cold, 255);
    }else if(a/TWO_PI > alphaNum && a/TWO_PI < alphaNum + alphaOffset){
      stroke(cold, a/TWO_PI*10);
    }else{
      stroke(cold, 0);
    }
    ////////////////////////////////////////////////////////////////////////////////////
    //Cambio a curveVertex para que el trazado se vea mejor
    curveVertex(x,y);
  }
  endShape(CLOSE);
  phase += 0.001;
}
//////Overloads de las funciones para llamar a los noiseCircles de diferentes maneras//////
void noiseCircle(color col, float seed){
  noiseCircle(col, seed, 15, 10);
}

void noiseCircle(color col, float seed, int numSinoids){
  noiseCircle(col, seed, numSinoids, 10);
}
///////////////////////////////////////////////////////////////////////////////////////////
/*
Controla el color de un vertice dependiendo de su distancia al mouse
*/
color distColorLerp(color col, float x, float y){
  
  float distance = dist(mouseX-width/2, mouseY-height/2, x, y);
  float dist = map(distance, 0,150, 0, 1);
  color cold = lerpColor(color(0, 255, 255) , col, dist);
  
  return cold;
}
