class marks {
  PVector position;
  float size;
  color paintColor;

  marks(float x, float y, color c, float s) {
    position = new PVector(x, y);
    size = s;
    paintColor = c;
  }

  void display() {
    fill(paintColor);
    noStroke();
    ellipse(position.x, position.y, size, size);
  }
}
