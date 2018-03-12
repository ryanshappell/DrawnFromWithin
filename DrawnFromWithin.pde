import processing.video.*;

//Setup
boolean initialized = false;
PFont bodoni;

//Name of person
String seed = "";

//All line segments of the image
ArrayList<Line> lines;

//Video capture
Capture cap;
PImage test;

void setup(){
  size(700, 900);
  cap = new Capture(this, 800, 600);
  cap.start();
  lines = new ArrayList<Line>();
  bodoni = createFont("Bodoni.ttf", 16);
}

//THINGS TO VARY
//BACKGROUND COLOR (based on camera?)
//X FILL COLOR (currently by segment)
//X STROKE COLOR (currently by line)
//X STROKE WEIGHT (currently by segment)
void draw(){
  if (!initialized) {
    background(0);
    setupScreen();
  } else {
    if (cap.available()) {
    cap.read();
    }
    test = cap;
    
    for (int i = 0; i < lines.size(); i++) {
      strokeWeight(1);
      //lines.get(i).drawTest();
      lines.get(i).draw();
    }
  }
}

//The setup screen which asks for the users name and takes their picture
//FIXXXXXXXXX
void setupScreen() {
  textFont(bodoni);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("Drawn From Within", width / 2, height / 2 - 200);
  stroke(255);
  line(100, height / 2 - 195, 600, height / 2 - 195);
  textSize(20);
  text("Please Enter Your Name:", width / 2, height / 2);
  rect(width / 2 - 125, height / 2 + 10, 250, 20);
  fill(0);
  text(seed, width / 2, height / 2 + 20);
  println(seed);
}

//User input for name
void keyReleased() {
  if (!initialized) {
    if (key != ENTER) {
      if (keyCode != SHIFT) {
        if (keyCode == BACKSPACE) {
          seed = seed.substring(0, seed.length() - 1);
        } else {
           seed += key + "";
        }
      }      
    } else {
      initialized = true;
      background(0);
      randomSeed(convertSeed(seed));
      createLines();
    }
  }
}

//Creates line segments from the given file
void createLines() {
  String[] sets;
  sets = loadStrings("indian.txt");
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