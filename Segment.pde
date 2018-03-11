class Segment {
  float cx1;
  float cy1;
  float x1;
  float y1;
  float x2;
  float y2;
  float cx2;
  float cy2;
  float weight;
  int fillR;
  int fillG;
  int fillB;
  
  public Segment(float cx1, float cy1, float x1, float y1, float x2, float y2, float cx2, float cy2) {
    this.cx1 = cx1;
    this.cy1 = cy1;
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.cx2 = cx2;
    this.cy2 = cy2;
    
    weight = random(0, 5);
    fillR = (int) random(1, 256);
    fillG = (int) random(1, 256);
    fillB = (int) random(1, 256);
  }
  
  //Draws the segment
  void draw() {
    strokeWeight(weight);
    fill(fillR, fillG, fillB);
    curve(cx1, cy1, x1, y1, x2, y2, cx2, cy2);
  }
}