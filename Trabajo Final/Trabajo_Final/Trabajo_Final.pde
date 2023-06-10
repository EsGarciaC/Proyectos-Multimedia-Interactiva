/*
* Hay que descargar la librería PGS para que corra el programa:
* https://github.com/micycle1/PGS.git
*/
import micycle.pgs.*;

PShape colombia;
PVector offset;


void setup() {
  size(1080, 1080);  
  colombia = loadShape("colo.svg");
  DesabilitarTodosLosEstilos(colombia);
  offset = new PVector(0,0);;
}

void draw() {
  background(200);
  
  // Draw the full map
  shape(colombia, offset.x, offset.y);


  
  
  ResaltarDepartamento(colombia);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 20, 20);
  
}
