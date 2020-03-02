PShape svg;

void setup() {
  size(640, 360, P2D);
  svg = loadShape("star.svg");
}

void draw() {
  background(255);
  shape(svg);
}
