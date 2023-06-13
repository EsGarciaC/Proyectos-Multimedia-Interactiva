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
PImage background, cd, fondoPrincipal;
Minim minim = new Minim(this);
AudioPlayer song = null;
FFT fft;
float bands = 0;
boolean paused = false;
int x = 0;
int radius = 180;

//Enciclopedias
HashMap<String, AudioPlayer> enciclopediaCanciones = new HashMap<String, AudioPlayer>();
HashMap<String,PImage> enciclopediaImagenes = new HashMap<String,PImage>();

//SVG
PShape colombia;
PVector offset;

//Variables de lógica
PImage currentImagen = null;
String currentDept = "";
String lastDept = "";
ArrayList<Particle> particles = new ArrayList<Particle>();

int counter = 1;
float r = 180;


void setup() {
  size(1300, 1080);  
  colombia = loadShape("colo.svg");
  DesabilitarTodosLosEstilos(colombia);
  offset = new PVector(0,0);

  background = loadImage("background.jpg");
  cd = loadImage("CD.png");
  fondoPrincipal = loadImage("fondos/cañoCristales.png");
}

void draw() {
  image(fondoPrincipal, 0, 0);
  
  // Draw the full map
  shape(colombia, offset.x, offset.y);
  
  ResaltarDepartamento(colombia);
  
  if(currentImagen != null){
    image(currentImagen, 740, 10, currentImagen.width/1.2, currentImagen.height/1.2);
  }
  
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 20, 20);
  
}

void mousePressed(){
 
  song = reproducirCancion();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  bands = fft.specSize();
  lastDept = currentDept;
  if(reproductor == null){
    reproductor = new Reproductor();
    PApplet.runSketch(args, reproductor);
  }
  
  currentImagen = enciclopediaImagenes.get(currentDept);
}
