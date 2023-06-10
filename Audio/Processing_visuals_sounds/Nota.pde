class Nota{
  int x,y;
  int w,h;
  PImage img;
  
  Nota(){
  img = loadImage("sol.png");
  
  // Size
  w = 50;
  h = 50; 
  
  x = width/2 - w/2;
  y = height/2;
  }
  void draw(){
     image(img, x, y,w,h); 
  }
  
}
