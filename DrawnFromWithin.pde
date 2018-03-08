import processing.video.*;

//All line segments of the image
ArrayList<Line> lines;

//Name of person
String seed = "Ryan Shappell";

//Video capture
Capture cap;

void setup(){
  size(700, 900);
  randomSeed(convertSeed(seed));
  //cap = new Capture(this, width, height);
  //cap.start();
  lines = new ArrayList<Line>();
  createLines();
}

//THINGS TO VARY
//FILL COLOR
//LINE COLOR
//BACKGROUND COLOR
void draw(){
  background(255);
  fill(100, 0, 100);
  for (int i = 0; i < lines.size(); i++) {
    //lines.get(i).drawTest();
    lines.get(i).draw();
  }
}

//Creates line segments from the given file
void createLines() {
  String[] sets;
  sets = loadStrings("fish.txt");
  for (int i = 0; i < sets.length; i++) {
    String[] pieces = split(sets[i], ", ");
    for (int j = 0; j < pieces.length - 2; j += 2) {
      lines.add(new Line(Integer.parseInt(pieces[j]), Integer.parseInt(pieces[j + 1]), Integer.parseInt(pieces[j + 2]), Integer.parseInt(pieces[j + 3])));
    }
    //lines.add(new Line(Integer.parseInt(pieces[pieces.length - 2]), Integer.parseInt(pieces[pieces.length - 1]), Integer.parseInt(pieces[0]), Integer.parseInt(pieces[1])));
  }
}
  
//Converts the string seed to a number seed
long convertSeed(String seed) {
  long convertedSeed = 0;
  for (int i = 0; i < seed.length(); i++) {
    convertedSeed += seed.charAt(i);
  }
  return convertedSeed;
}