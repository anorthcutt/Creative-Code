void drawArtboard() {
  artboard.beginDraw();
  artboard.background(0);
  artboard.imageMode(CENTER);
  PImage buffer = target.get();
  artboard.image(buffer,artboard.width/2,artboard.height/2);
  artboard.endDraw();
}
