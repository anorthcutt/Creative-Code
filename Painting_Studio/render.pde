void render() {
  if (frameCount % 10 == 0) {
    artboard.save("out/" + nf(frameCount, 6) + ".png");
  }
}
