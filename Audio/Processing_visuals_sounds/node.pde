class Node {
  //GLOBAL VARS
  PVector loc;
  PVector velocity = new PVector(random(-2, 2), random(-2, 2));
  float size = 10;
  
  //CONSTUCTOR
  Node(float x, float y){
    this.loc = new PVector(x, y);
  }
  
  //FUNCTIONS
  
  //Runs all necessary funcitions
  void run(boolean is_playing){
    this.display();
    this.move(is_playing);
    this.bounce();
  }
  
  //Displays node
  void display(){
    point(loc.x, loc.y);
  }
  
  //Moves node according to velocity
  void move(boolean is_playing){
    if(is_playing){
      this.loc.add(velocity);
    } else{
      this.loc.add(new PVector(0,0));
    }
  }
  
  //Checks whether the node has reached a wall and if so node "bounces" off
  void bounce(){
    if ((this.loc.x > width) || (this.loc.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((this.loc.y > height) || (this.loc.y < 0)) {
      velocity.y = velocity.y * -1;
    }    
   }
   
}
