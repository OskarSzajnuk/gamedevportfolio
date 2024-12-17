// Oskar Szajnuk | Shape Game | 3 Sept 2024
SoundFile collide; SoundFile death;
int x, y, score, tx, ty, tw, speed, shapeDist;
PImage bg1, user1, pibble1;

import processing.sound.*;
SoundFile file;

void setup() { // setup runs once at start
  size(600, 338);
  background(184, 184, 184);
  collide = new SoundFile(this, "(short) Yippee sound effect!!.wav");
  death = new SoundFile(this, "Car Crash - Sound Effect.wav");
  bg1 = loadImage("bg1.jpg");
  user1 = loadImage("Big_Poo.jpeg");
  pibble1 = loadImage("pibble.jpeg");
  x = 100;
  y = 100;
  score = 0;
  tx=width/2;
  ty=height/2;
  tw=50;
  speed=0;
  shapeDist=0;
}


void draw() { // draw runs on a 30fps loop

  shapeDist= int(dist(x, y, tx, ty));
  println(shapeDist);
  frameRate=speed+200;
  background(bg1);
  score();
  target();
  fill(200, 150, 255);
  stroke(100);
  // ellipse(x, y, 20, 20);
  user1.resize(50, 50);
  imageMode(CENTER);
  image(user1, x, y);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y = y - 10;
    } else if (key == 's' || key == 'S') {
      y = y + 10;
    } else if (key == 'a' || key == 'A') {
      x = x - 10;
    } else if (key == 'd' || key == 'D') {
      x = x + 10;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y = y - 10;
    } else if (keyCode == DOWN) {
      y = y + 10;
    } else if (keyCode == LEFT) {
      x = x - 10;
    } else if (keyCode == RIGHT) {
      x = x + 10;
    }
  }
}

void score() {
  rectMode(CENTER);
  fill(128, 128);
  rect(width/2, 20, width, 40);
  fill(0);
  textSize(30);
  text("Score" + score, 20, 30);
  if (dist(x, y, tx, ty)<10+tw/2) {
    collide.play();
    tx=int(random(width));
    ty=int(random(height));
    score=score+10;
    tw=tw+40;
    speed=speed+2;
  }
}
void target() {

  image(pibble1, tx, ty, tw, tw);
  tw=tw-1;
  if (tw==0) {
    gameOver();
  }
}

void gameOver() {
  death.play();
  background(0);
  fill(255);
  text("big poo is dead", width/2, height, 2);
  noLoop();
}
