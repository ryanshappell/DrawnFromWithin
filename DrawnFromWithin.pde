import processing.video.*;

//Setup
boolean initialized = false;
PFont bodoni;

//Name of person
String seed = "";

//All lines of the image
String[] images = {"bird.txt", "fish.txt", "sun.txt", "indian.txt"};
ArrayList<Line> lines;

void setup(){
  size(700, 900);
  lines = new ArrayList<Line>();
  bodoni = createFont("Bodoni.ttf", 16);
}

//Asks the user to enter their name and draws the image according to it
void draw(){
  if (!initialized) {
    background(0);
    setupScreen();
  } else {
    random(0, 4);
    for (int i = 0; i < lines.size(); i++) {
      strokeWeight(1);
      //lines.get(i).drawTest();
      lines.get(i).draw();
    }
  }
}

//The setup screen which asks for the users name and takes their picture
void setupScreen() {
  textFont(bodoni);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  strokeWeight(2);
  text("Drawn From Within", width / 2, height / 2 - 200);
  stroke(255);
  line(100, height / 2 - 195, 600, height / 2 - 195);
  textSize(20);
  text("Please Enter Your Name:", width / 2, height / 2);
  rect(width / 2 - 125, height / 2 + 10, 250, 20);
  fill(0);
  text(seed, width / 2, height / 2 + 28);
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
  } else if (keyCode == ENTER) {
    initialized = false;
    seed = "";
    lines.clear();
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

//Creates line segments from the given file
void createLines() {
  //Do prevent dumb pseudo random results
  int t = (int) random(0, 20);
  for (int i = 0; i < t; i++) {
    int rand = (int) random(0, 20);
  }
  
  String[] sets;
  sets = loadStrings(images[(int) random(0, 4));
  for (int i = 0; i < sets.length; i++) {
    String[] pieces = split(sets[i], ", ");
    for (int j = 0; j < pieces.length - 2; j += 2) {
      lines.add(new Line(Integer.parseInt(pieces[j]), Integer.parseInt(pieces[j + 1]), Integer.parseInt(pieces[j + 2]), Integer.parseInt(pieces[j + 3])));
    }
  }
}