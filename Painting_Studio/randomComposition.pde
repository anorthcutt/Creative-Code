void randomComposition() {
  
  int padding = 50;
  
  comp.beginDraw();
  comp.background(255);

  float diameter = random(300);

  comp.fill(0);
  comp.noStroke();
  comp.ellipse(random(padding,POSTER_W-padding), random(padding,POSTER_H-padding), diameter, diameter);
  comp.stroke(0);
  comp.strokeWeight(8);
  comp.strokeCap(RECT);
  comp.line(random(padding,POSTER_W-padding), random(padding,POSTER_H-padding), random(padding,POSTER_W-padding), random(padding,POSTER_H-padding));
  comp.endDraw();
}
