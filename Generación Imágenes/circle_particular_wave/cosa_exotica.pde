//float x = 0;
//float y = 0;
//float r = 0;
//float xoff = 0;
//float yoff = 0;
//float phase = 0;

void cosa(color col, float seed){
  stroke(col);
  beginShape();
  
  for (float a = 0; a < TWO_PI; a+=0.1){
    xoff = map(cos(a),-1,1,0, 3);
    yoff = map(sin(a),-1,1,0, 3);
    r = 200;//map(noise(xoff*seed/random(50,60), yoff*seed/random(50,60)), 0, 1, 100, 200);
    x = (200+r*sin(phase*a))*cos(a);
    y = (200+r*sin(phase*a))*sin(a);
    //float anim = map(sin(frameCount)*0.5+0.5, 0, 1, 1, 1.1);
    vertex(x,y);
  }
  endShape(CLOSE);
  phase += 0.01;
}
