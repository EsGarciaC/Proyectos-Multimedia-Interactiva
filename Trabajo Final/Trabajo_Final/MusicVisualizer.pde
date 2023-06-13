//import ddf.minim.*;
//import ddf.minim.analysis.*;

//PImage img1, img2; 
//int counter = 1;
//ArrayList<Particle> particles = new ArrayList<Particle>();
//Minim m;
//AudioPlayer player;
//FFT fft;
////int bands = 512;
////float[] spectrum = new float[bands];
//int x;
//int radius = 180;

///*float clamp(float a, float b){
// if (a >= b){
//   return b;
// }
// return a;
//}*/

//void setup() {
// size(910, 553);
// img1 = loadImage("CD.png");
// img2 = loadImage("background.jpg");
// /*background(img2);
// fft = new FFT(this, bands);
// in = new SoundFile(this, "Amazonas.mp3");
// in.rate(1);
// in.play();
// fft.input(in);*/
// m = new Minim(this);
    
// // Load music
// player = m.loadFile("Amazonas.mp3", 1024);
// player.play();
  
// // Initialize audio analyzer
// fft = new FFT(player.bufferSize(), player.sampleRate());
// x=0;
//}

//void draw() {
// clear();
// background(img2);
// translate(width/2, height/2);
// strokeWeight(4);
// //fft.analyze(spectrum);

// counter+=3;
  
// Particle part = new Particle();
// particles.add(part);
// for(int i=0; i<particles.size(); i++){
//   if(!particles.get(i).edges()){
//     Particle p = particles.get(i);
//     p.update();
//     p.show();
//   }else{
//     particles.remove(i);
//   }
// }
  
// fft.forward(player.mix);
// float bands = fft.specSize();
  
// for(int i = 0; i < bands*2; i++){ 
    
//   // Starting positions of line
//   float start_x = radius*cos(PI*(i+x)/bands);
//   float start_y = radius*sin(PI*(i+x)/bands);
    
//   // Draw line based on sound
//   stroke(252,255,51);
//   strokeWeight(1);
//   /*if (i < bands){
//     // Line based on band length
//     line(start_x, start_y, start_x + fft.getBand(i)*7*cos(PI*(i+x)/bands), start_y + fft.getBand(i)*7*sin(PI*(i+x)/bands));
//   } else {*/
//     // Line based on frequency
//     line(start_x, start_y, start_x + fft.getFreq(i)*cos(PI*(i+x)/bands), start_y + fft.getFreq(i)*sin(PI*(i+x)/bands));
//   //}
// }
  
// /*float r2;
// for (int i = 0; i < 360; i += 6){
//   r2 = r + 10 + clamp(spectrum[i] * 1000, 100);
//   stroke(252,255,51);
//   line(r * cos(radians(i)), r * sin(radians(i)), r2 * cos(radians(i)), r2 * sin(radians(i)));
// }*/
  
// imageMode(CENTER);
// rotate(counter*TWO_PI/360);
// image(img1, 0, 0, img1.width/8, img1.height/8);
//}
