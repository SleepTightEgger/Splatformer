class marks {
  PVector position;
  float size;
  color paintColor;
  
  // marks constructor, taking in x and y positions, a colour, and a size
  marks(float x, float y, color c, float s) {
    // set position vector based on what was passed into the argument
    position = new PVector(x, y);
    // set size based on what was passed into the argument
    size = s;
    // set colour based on what was passed into the argument
    paintColor = c;
  }
  
  // display function
  void display() {
    // set an ellipse based on what was passed into constructor functions
    fill(paintColor);
    noStroke();
    ellipse(position.x, position.y, size, size);
  }
}
