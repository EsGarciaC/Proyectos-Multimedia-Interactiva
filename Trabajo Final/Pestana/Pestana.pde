import java.util.Map;


int departamento_seleccionado = 0; // Variable con la cual cambiaré de tabla

HashMap<String,PImage> hm = new HashMap<String,PImage>(); // 


void setup() {
  size(300, 300);

  String[] args = {""};
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);
  
 for (int i = 1; i< 2;i++){
    PImage img = loadImage(i+".jpg");
    hm.put(i+"",img);
  }
  PImage img2 = loadImage("Bolivar.jpg");
  hm.put("Bolivar",img2);
}

void draw() {
  background(255);
  ellipse(50, 50, 10, 10);
}  

//Este es de prueba para saber a la hora de presionar si me cambie de imágenes
void mousePressed() {
  if (mouseX <=width/2) {
    departamento_seleccionado = 1;
}else{
  departamento_seleccionado = 0;
}
}



 public class SecondApplet extends PApplet {

  public void settings() {
    size(600, 400);
  }
  public void draw() {
    background(255,0,255);
    fill(0);
    if (departamento_seleccionado == 0){
    image(hm.get("1"),0,0,width,height);
  }else{
    image(hm.get("Bolivar"),0,0,width,height);
  }
}
}

 public class ThirdApplet extends PApplet {

  public void settings() {
    size(600, 400);
  }
  public void draw() {
    background(255,0,255);

}
}
