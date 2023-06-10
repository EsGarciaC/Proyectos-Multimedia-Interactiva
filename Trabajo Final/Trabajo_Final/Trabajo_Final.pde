/**
 * Get Child. 
 * 
 * SVG files can be made of many individual shapes. 
 * Each of these shapes (called a "child") has its own name 
 * that can be used to extract it from the "parent" file.
 * This example loads a map of the United States and creates
 * two new PShape objects by extracting the data from two states.
 */
import micycle.pgs.*;

PShape colombia;
PShape choco;
PShape antioquia;
PVector offset;
// PShape ohio;


void setup() {
  size(1080, 1080);  
  colombia = loadShape("colo.svg");
  //colombia.scale(2.0);
  DesabilitarTodosLosEstilos(colombia);
  offset = new PVector(0,0);
  //choco = colombia.getChild("COL1415");
  //antioquia.disableStyle();
}

void draw() {
  background(200);
  
  // Draw the full map
  shapeMode(CORNER);
  shape(colombia, offset.x, offset.y);
  //shape(colombia, offset.x, offset.y, 1000, 1200);
  //shape(choco, offset.x, offset.y);
  
 // println(isInside(choco));
  
  
  // Set our own coloring
  //fill(255, 0, 0);
  //noStroke();
  // Draw a single state
  //shape(narino, 0, 0); // Wolverines!
  
  
  // Disable the colors found in the SVG file
    // Buckeyes!
  
  ResaltarDepartamento(colombia);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 20, 20);
  
}
