import processing.sound.*;

PImage img1, img2; 
int counter = 1;
ArrayList<Particle> particles = new ArrayList<Particle>();
FFT fft;
SoundFile in;
int bands = 512;
float[] spectrum = new float[bands];
float r = 180;

float clamp(float a, float b){
  if (a >= b){
    return b;
  }
  return a;
}

void setup() {
  size(910, 553);
  img1 = loadImage("CD.png");
  img2 = loadImage("background.jpg");
  //background(img2);
  fft = new FFT(this, bands);
  in = new SoundFile(this, "Amazonas.mp3");
  in.rate(1);
  in.play();
  fft.input(in);
}

void draw() {
  clear();
  background(img2);
  translate(width/2, height/2);
  strokeWeight(4);
  fft.analyze(spectrum);

  counter+=3;
  
  Particle part = new Particle();
  particles.add(part);
  for(int i=0; i<particles.size(); i++){
    if(!particles.get(i).edges()){
      Particle p = particles.get(i);
      p.update();
      p.show();
    }else{
      particles.remove(i);
    }
  }
  
  float r2;
  for (int i = 0; i < 360; i += 6){
    r2 = r + 10 + clamp(spectrum[i] * 1000, 100);
    stroke(252,255,51);
    line(r * cos(radians(i)), r * sin(radians(i)), r2 * cos(radians(i)), r2 * sin(radians(i)));
  }
  
  imageMode(CENTER);
  rotate(counter*TWO_PI/360);
  image(img1, 0, 0, img1.width/8, img1.height/8);
}
