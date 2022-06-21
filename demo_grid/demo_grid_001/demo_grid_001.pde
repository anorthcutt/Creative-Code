color BG = #000000;
color FG = #F1F1F1;
color ACCENT = #00FF00;

PImage img1, img2, img3, img4;

int tilesX = 3;
int tilesY = 4;

float tileW, tileH;

int[][] state;

int mouseOverX, mouseOverY;

void setup() {
  size(1080, 1920);

  img1 = loadImage("../data/1.jpg");
  img1.resize(width, height);
  img1.filter(GRAY);

  img2 = loadImage("../data/2.jpg");
  img2.resize(width, height);
  img2.filter(GRAY);

  img3 = loadImage("../data/3.jpg");
  img3.resize(width, height);
  img3.filter(GRAY);

  img4 = loadImage("../data/4.jpg");
  img4.resize(width, height);
  img4.filter(GRAY);

  tileW = width/tilesX;
  tileH = height/tilesY;

  frameRate(30);

  state = new int[tilesX][tilesY];
}

void draw() {
  background(BG);
  fill(ACCENT);

  mouseOverX = int(map(mouseX, 0, width, 0, tilesX));
  mouseOverY = int(map(mouseY, 0, height, 0, tilesY));

  noStroke();

  if (frameCount == 1) {

    for (int x = 0; x < tilesX; x++) {
      for (int y = 0; y < tilesY; y++) {
        state[x][y] = int(random(0, 4));
      }
    }
  }

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {

      float posX = x * tileW;
      float posY = y * tileH;

      // SOURCE
      int sx = int(posX);
      int sy = int(posY);
      int sw = int(tileW);
      int sh = int(tileH);

      // DESTINATION
      int dx = int(posX);
      int dy = int(posY);
      int dw = int(tileW);
      int dh = int(tileH);

      int selector = state[x][y];

      if (selector == 0) {
        copy(img1, sx, sy, sw, sh, dx, dy, dw, dh);
      } else if (selector == 1) {
        copy(img2, sx, sy, sw, sh, dx, dy, dw, dh);
      } else if (selector == 2) {
        copy(img3, sx, sy, sw, sh, dx, dy, dw, dh);
      } else if (selector == 3) {
        copy(img4, sx, sy, sw, sh, dx, dy, dw, dh);
      }
    }
  }

  for (int x = 1; x < tilesX; x++) {
    rect(x*tileW,0,1,height);
  }
  
    for (int y = 1; y < tilesY; y++) {
    rect(0,y*tileH,width,1);
  }
}

void mouseReleased() {

  int val = state[mouseOverX][mouseOverY];

  if (val < 3) {
    val++;
  } else {
    val = 0;
  }

  state[mouseOverX][mouseOverY] = val;

  println(val);
}
