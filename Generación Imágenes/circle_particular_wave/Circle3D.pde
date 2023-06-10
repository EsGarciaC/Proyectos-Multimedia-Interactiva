void stdcircle3D(color col){
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
    curveVertex(xc, yc, 0);
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
void noiseCircle3D(color col, float seed, int numSinoids, int AmpSinoids){
  
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
    zoff = map(noise(xoff, yoff), 0, 1, -5, 5);
    r2 = map(noise(xoff*seed, yoff*seed), 0, 1, 200-AmpSinoids, 200+AmpSinoids);
    x = (r2 + AmpSinoids * sin(numSinoids * a + seed)) * cos (a);
    y = (r2 + AmpSinoids * cos(numSinoids * a + seed)) * sin (a);
    z = (AmpSinoids * sin(numSinoids * a + seed))*zoff;
    
    //////////////Controla el color por distancia al mouse////////////////
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
    
    curveVertex(x,y,z);
    
  }
  endShape(CLOSE);
  phase += 0.001; 
}
//////Overloads de las funciones para llamar a los noiseCircles de diferentes maneras//////
void noiseCircle3D(color col, float seed){
  noiseCircle3D(col, seed, 15, 10);
}

void noiseCircle3D(color col, float seed, int numSinoids){
  noiseCircle3D(col, seed, numSinoids, 10);
}
