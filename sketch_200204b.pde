import fisica.*;

color black = #000000;
color green = color(34, 177, 76);

PImage map;
int x = 0;
int y = 0;
int gridsize = 50;
FWorld world;

void setup() {
  size(800, 600, P2D);
  Fisica.init(this);
  world = new FWorld();
  map = loadImage("map.png");

  while (y < map.height) {
    color c = map.get(x, y);

    if (c == black){
      FBox b = new FBox(gridsize, gridsize);
      b.setFillColor(black);
      b.setPosition(x*gridsize, y*gridsize);
      b.setStatic(true);
      world.add(b);
    }

      println(c);
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
}
void draw(){
  background(255);
  
  world.step();
  world.draw();
}
