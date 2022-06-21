void drawResult() {

  float tileW = result.width / TILES_X;
  float tileH = result.height / TILES_Y;

  PImage buffer = target.get();

  result.beginDraw();
  result.background(#f1f1f1);

  result.noStroke();

  for (int x = 0; x < TILES_X; x++) {
    for (int y = 0; y < TILES_Y; y++) {

      int px = int(x*tileW);
      int py = int(y*tileH);
      color c = buffer.get(px, py);
      float b = brightness(c);

      if (b < threshold) {
        result.fill(0);
      } else {
        result.fill(#f1f1f1);
      }

      result.push();
      result.translate(x*tileW, y*tileH);
      result.rect(0, 0, tileW, tileH);
      result.pop();
    }
  }

  result.endDraw();
}
