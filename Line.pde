class Line {
  float x1;
  float y1;
  float x2;
  float y2;
  int numSegments;
  float xDiff;
  float yDiff;
  ArrayList<Segment> segments;
  
  int red;
  int green;
  int blue;
  
  public Line(float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    
    numSegments = (int) random(1, 10);
    xDiff = (x2 - x1) / numSegments;
    yDiff = (y2 - y1) / numSegments;
    segments = new ArrayList<Segment>();
    createSegments();
    
    red = (int) random(1, 256);
    green = (int) random(1, 256);
    blue = (int) random(1, 256);
  }
  
  //Draws the original straight lines without randomization
  void drawTest() {
    stroke(255, 0, 0);
    line(x1, y1, x2, y2);
  }
  
  //Draws each segment of the line
  void draw() {
    stroke(red, green, blue);
    for (int i = 0; i < segments.size(); i++) {
      segments.get(i).draw();  
    }
  }
  
  //Creates segments for the line
  //Randomized the curviness of each segment according to it's length
  void createSegments() {
    float dist = (float) Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
    float lastX = x1;
    float lastY = y1;
    for (int i = 0; i < numSegments; i++) {
      int xRand = (int) random(-(dist / 8), dist / 8);
      int yRand = (int) random(-(dist / 8), dist / 8);
      segments.add(new Segment(x1, y1, lastX, lastY, x1 + (i + 1) * xDiff + xRand, y1 + (i + 1) * yDiff + yRand, x2, y2));
      lastX = x1 + (i + 1) * xDiff + xRand;
      lastY = y1 + (i + 1) * yDiff + yRand;
    }
  }
}