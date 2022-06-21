void keyReleased() {
  if (key == '1') {
    currImage=images[0];
  }
  if (key == '2') {
    currImage=images[1];
  }
  if (key == '3') {
    currImage=images[2];
  }
  if (key == '4') {
    currImage=images[3];
  }
  if (key == '5') {
    currImage=images[4];
  }
  if (key == '6') {
    currImage=images[5];
  }
  if (key == '7') {
    currImage=images[6];
  }
  if (key == '8') {
    currImage=images[7];
  }
  if (key == '9') {
    currImage=images[8];
  }

  if (key == 'r') {
    scalar = random(1, 5);
    offsetX = random(-800, 800);
    offsetY = random(-800, 800);
  }

  if (key == 't') {
    randomComposition();
    currImage = comp.get();
  }
  if (key == 'e') {
    scalar = 1;
    offsetX = 0;
    offsetY = 0;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  coutoutW += e*10;
}
