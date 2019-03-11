import processing.video.*;
float threshold = 100; 
 color pixelColor1= color(70,130,250);
 color pixelColor2= color(209,166,245);

Capture camera; 

void setup() {
  size(displayWidth, displayHeight); 
//fullscreen(); 

String[] cameras = Capture.list();

println(cameras);

camera= new Capture(this, width, height); 
camera.start(); 
}
void keyPressed() {
  if (key=='b') {
  pixelColor1=color(255);
  pixelColor2=color(0);
  }
  else if (key=='r'){
  pixelColor1=color(255,0,0);
  pixelColor2=color(255);
}
else if (key=='p'){
  pixelColor1=color(70,130,250);
  pixelColor2=color(209,166,245);
}
}
void draw() {
  if( camera.available()) {
    camera.read(); 
    image(camera, 0,0);
 //color pixelColor1= color(70,130,250);
 //color pixelColor2= color(209,166,245);
 


    
  loadPixels();
  for (int i=0; i<pixels.length; i++) {
    
    
    float r = pixels[i] >> 16 & 0xFF;
    
    
    if (r < threshold) {
      pixels[i] =  pixelColor1;
    }
    else {
     
      pixels[i] = pixelColor2;
    }    
  }
  updatePixels();
}
}
