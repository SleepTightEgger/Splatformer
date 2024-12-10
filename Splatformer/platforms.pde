class platforms {
  PVector position;
  float sizeX;
  float sizeY;
  
  platforms (float x, float y, float w, float h){
    position = new PVector(x,y);
    sizeX = w;
    sizeY = h;
  }
  
  void display(){
    fill(200);
    rect(position.x, position.y, sizeX, sizeY);
  }
  
  
}
