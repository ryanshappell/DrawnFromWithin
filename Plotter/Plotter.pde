boolean drawing;
String currentLines;
ArrayList<String> lineSets;
int lastX;
int lastY;

void setup() {
  size(700, 900);
  drawing = false;
  currentLines = "";
  lineSets = new ArrayList<String>();
  lastX = -1;
  lastY = -1;
}

void draw() {
  println(currentLines);
}

void keyReleased() {
  if (key == 'z') {
    drawing = !drawing;
    if (!drawing) {
      lineSets.add(currentLines);
      currentLines = "";
      lastX = -1;
      lastY = -1;
    }
  }
  if (key == 'v') {
    if (drawing) {
      currentLines = "";
      lastX = -1;
      lastY = -1;
    }
  }
  if (key == 't') {
    if (!drawing) {
      String[] file = new String[lineSets.size()];
      for (int i = 0; i < lineSets.size(); i++) {
        file[i] = lineSets.get(i);
      }
      saveStrings("test.txt", file);
    }
  }
}

void mouseClicked() {
  if (drawing) {
    ellipse(mouseX, mouseY, 2, 2);
    if (lastX != -1 && lastY != -1) {
      line(lastX, lastY, mouseX, mouseY);
    }
    lastX = mouseX;
    lastY = mouseY;
    if (currentLines.equals("")) {
      currentLines += mouseX + ", " + mouseY;
    } else {
      currentLines += ", " + mouseX + ", " + mouseY;
    }
  }
}