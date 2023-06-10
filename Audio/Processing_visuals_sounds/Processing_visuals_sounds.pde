//GITHUB FROM CREATOR
//https://github.com/JackLusenhop/Music-Visualizations

import ddf.minim.*;
import ddf.minim.analysis.*;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
Minim m1;
Minim m2;
Minim m3;
Minim m4;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
FFT ftt1;
FFT ftt2;
FFT ftt3;
FFT ftt4;
float lastFreq;
float freq;
Node[] nodes = new Node[1200];
Nota nota;


void setup() {
  fullScreen();
  smooth();
  oscP5 = new OscP5(this, 3003);
  //Initialize Nodes
  for(int i = 0; i < nodes.length; i++){
    nodes[i] = new Node(random(width), random(height));
  }

  m1 = new Minim(this);
  m2 = new Minim(this);
  m3 = new Minim(this);
  m4 = new Minim(this);
  player1 = m3.loadFile("hit-hat.wav", 1024);
  player2 = m3.loadFile("clap.wav", 1024);
  player3 = m3.loadFile("bongo.wav", 1024);
  player4 = m3.loadFile("snare.wav", 1024);
  ftt1 = new FFT(player1.bufferSize(), player1.sampleRate());
  ftt2 = new FFT(player2.bufferSize(), player2.sampleRate());
  ftt3 = new FFT(player3.bufferSize(), player3.sampleRate());
  ftt4 = new FFT(player4.bufferSize(), player4.sampleRate());
  player1.setGain(-25);
  player2.setGain(-20);

  nota = new Nota();
}

void mouseMoved(){
  noCursor();
  nota.x = mouseX;
  nota.y = mouseY;
}

void draw() {
  noStroke();
  //noCursor();
  background(20);
  // Play Music
  ftt1.forward(player1.mix);
  ftt2.forward(player2.left);
  ftt3.forward(player3.right);
  ftt4.forward(player4.mix);
  
  updateNodes();
  nota.draw();

}

void oscEvent(OscMessage theOscMessage){
  println("### received an osc message.");
  println("addrpattern: " + theOscMessage.addrPattern());
  println("typetag: " + theOscMessage.typetag());
  
  
  theOscMessage.print();
  if (mouseX <=width/2 && mouseY<=height/2){ 
    if (theOscMessage.checkAddrPattern("/Snap")){
      player4.rewind();
      player4.play();
    }
  }else if(mouseX >width/2 && mouseY<=height/2){
    if (theOscMessage.checkAddrPattern("/Snap")){
      player4.rewind();
      player4.play();
  }else if (theOscMessage.checkAddrPattern("/Clap")){
 
    player2.rewind();
    player2.play();
  }
}else if (mouseX <=width/2 && mouseY>height/2){
  if (theOscMessage.checkAddrPattern("/Snap")){
    player4.rewind();
    player4.play();
  }else if (theOscMessage.checkAddrPattern("/Clap")){
 
    player2.rewind();
    player2.play();
  }else if (theOscMessage.checkAddrPattern("/Bongo")){
 
    player3.rewind();
    player3.play();
  }
}else{
  if (theOscMessage.checkAddrPattern("/HitHat")){
  
    player1.rewind();
    player1.play();
  }else if (theOscMessage.checkAddrPattern("/Clap")){
 
    player2.rewind();
    player2.play();
  }else if (theOscMessage.checkAddrPattern("/Bongo")){
    
    player3.rewind();
    player3.play();
  }else if (theOscMessage.checkAddrPattern("/Snap")){
   
    player4.rewind();
    player4.play();
  }
}
}


void updateNodes(){
    for(int i = 0; i < nodes.length; i++){
      freq = 0;
      freq += ftt1.getFreq(dist(nodes[i].loc.x, nodes[i].loc.y, width/2, height/2))*0.2; // Multiplier = 2.2 higher to show more frequencies
      freq += ftt2.getFreq(dist(nodes[i].loc.x, nodes[i].loc.y, width/2, height/2)*20); // Multiplier = 2.2 higher to show more frequencies
      freq += ftt3.getFreq(dist(nodes[i].loc.x, nodes[i].loc.y, width/2, height/2)*2); // Multiplier = 2.2 higher to show more frequencies
      freq += ftt4.getFreq(dist(nodes[i].loc.x, nodes[i].loc.y, width/2, height/2)); // Multiplier = 2.2 higher to show more frequencies
      
      //Draw Lines
      strokeWeight(freq/3);
      stroke((1-nodes[i].loc.y/800)*255, 0, (nodes[i].loc.y/800)*255);
      for(int j = i + 1; j < nodes.length; j++){
        Node other = nodes[j];
        float dist = nodes[i].loc.dist(other.loc);
        if (dist > 0 && dist < 45){
          line(nodes[i].loc.x, nodes[i].loc.y, other.loc.x, other.loc.y);
        }
        
      }
      stroke(255);
      nodes[i].run(player3.isPlaying());
    }
}
