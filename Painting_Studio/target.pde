void drawTarget() {
  target.beginDraw();

  buffer = source.get();

  if (frameCount == 1) {
    target.background(#ffffff);
  }

  sx = mouseX;
  sy = mouseY;
  sw = int(coutoutW);
  sh = int(coutoutW);

  dx = mouseX;
  dy = mouseY;
  dw = int(coutoutW);
  dh = int(coutoutW);

  if (mousePressed) {
    target.copy(buffer, sx, sy, sw, sh, dx, dy, dw, dh);
  }


  target.endDraw();
}
