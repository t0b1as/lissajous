PFont font;
float t = 0.0;
float theta = 90.0;
float phi = 30.0;
float x = 0.0;
float y = 0.0;
float r = 0.0;
float z = 0.0;
boolean locked = false;
String strAngle = "";

void setup(){
  size(1024, 1024, P3D);
  r = height/3;
  font = loadFont("Oxygen-Sans-Book-24.vlw"); 
  textFont(font, 24);
}

void draw(){
  background(0);
  noStroke();
  lights();
  pushMatrix();
  fill(0, 102, 153);
  strAngle = "theta = " + nf(theta,3,3) + " phi = " + nf(phi,3,3);
  text(strAngle, width/2-textWidth(strAngle)/2, 60);
  strAngle = "theta = " + nf(360*((float)mouseX/width),3,3) + " phi = " + nf(360*((float)mouseY/width),3,3);
  text(strAngle, width/2-textWidth(strAngle)/2, 30);
  popMatrix();
  translate(width/2, height/2);
  fill(255);
if(!locked){
  rotateY(map(mouseY, 0, width, 0, PI));
  rotateZ(map(mouseX, 0, height, 0, -PI));
  rotateX(frameCount * PI/60);
}
  stroke(255,0,0);
  line(-100,0,0,100,0,0);
  text("x",100,0,0);
  line(0,-100,0,0,100,0);
  text("y",0,100,0);
  line(0,0,-100,0,0,100);
  text("z",0,0,100);
  noStroke();

for (float t = 0; t < 1.0*PI; t+=0.001){
  pushMatrix();
  x = r*sin(theta*t)*cos(phi*t);
  y = r*sin(theta*t)*sin(phi*t);
  z = r*cos(theta*t);
  translate(x, y, z);
  box(1,1,1);
  popMatrix();
  }
}

void mousePressed() {
    locked = true;
    theta = 360*((float)mouseX/height);
    phi = 360*((float)mouseY/width);
}

void mouseDragged() {
  if(locked) {
    theta = 360*((float)mouseY/height);
    phi = 360*((float)mouseX/width);
  }
}

void mouseReleased() {
  locked = false;
}
