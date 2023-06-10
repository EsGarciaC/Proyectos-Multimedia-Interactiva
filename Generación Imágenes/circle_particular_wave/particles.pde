int radius = 150; //Define the sphere's radius
void drawParticles() {
  rotateY(radians(mouseX)); //rotates the Shape around Y-axis with the current horizontal coordinate of the mouse
  rotateZ(radians(mouseY)); //rotates the Shape around Z-axis with the current vertical coordinate of the mouse
  for (int i = 0; i < 40; i++){
    for (int j = 0; j < 40; j++){ //Create a nested loop for draw sphere points
      
      stroke(255);
      if(i%2==0){
        
        stroke(random(i+100),random(i+100),random(i+100));
      }else{
        stroke(random(i+100),random(i+100),random(i+100));
      };
      if(j%2==0){
   
        stroke(random(j+100),random(j+100),random(j+100));
      }else{
        stroke(random(j+100),random(j+100),random(j+100));
      };
      float cx = radius*cos(i)*sin(j); //Use spherical coordinate system for draw
      float cy = radius*cos(j);
      float cz = radius*sin(i)*sin(j); 
      
      point(cx+random(-2,2),cy+random(-2,2),cz+random(-2,2)); //Draw a point with the coordinates given before
      
    }
  }
} 
