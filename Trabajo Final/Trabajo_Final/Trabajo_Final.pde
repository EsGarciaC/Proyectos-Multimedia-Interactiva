/*
* Hay que descargar la librería PGS para que corra el programa:
* https://github.com/micycle1/PGS.git
*/
import java.util.Map;
import micycle.pgs.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

//Reproductor
Reproductor reproductor = null;
String[] args = {""};
PImage background, cd;
Minim minim = new Minim(this);
FFT fft;


HashMap<String, AudioPlayer> enciclopediaCanciones = new HashMap<String, AudioPlayer>();
HashMap<String,PImage> enciclopediaImagenes = new HashMap<String,PImage>();
PShape colombia;
PVector offset;
PImage currentImagen = null;
int bands = 512;
String currentDept = "";
String lastDept = "";
ArrayList<Particle> particles = new ArrayList<Particle>();

int counter = 1;
float[] spectrum = new float[bands];
float r = 180;


void setup() {
  size(1300, 1080);  
  colombia = loadShape("colo.svg");
  DesabilitarTodosLosEstilos(colombia);
  offset = new PVector(0,0);
  //fft = new FFT(this, bands);
  background = loadImage("background.jpg");
  cd = loadImage("CD.png");
}

void draw() {
  background(200);
  
  // Draw the full map
  shape(colombia, offset.x, offset.y);
  
  ResaltarDepartamento(colombia);
  
  if(currentImagen != null){
    image(currentImagen, 740, 10, currentImagen.width/1.3, currentImagen.height/1.3);
  }
  
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 20, 20);
  
}

void mousePressed(){
 
  AudioPlayer song = reproducirCancion();
  //fft.input(song);
  lastDept = currentDept;
  if(reproductor == null){
    reproductor = new Reproductor();
    PApplet.runSketch(args, reproductor);
  }
  
  currentImagen = enciclopediaImagenes.get(currentDept);
}

float clamp(float a, float b){
  if (a >= b){
    return b;
  }
  return a;
}
