/**
  This processing sketch replaces green screen in with picture of paris
*/
import processing.video.*;

Movie mov;
PImage paris;

void setup() {
  size(640, 360);
  noStroke();
  mov = new Movie(this, "./data/bee.mp4");
  paris = loadImage("./data/paris.jpg");
  mov.loop();
}

// Display values from movie
void draw() {
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
    for(int i = 0; i<mov.width; i++){
      for(int j = 0; j<mov.height; j++){
        color pixel = mov.pixels[i*mov.height + j];
        if(green(pixel) >= 150 && red(pixel) <100 && blue(pixel) <100){
          mov.pixels[i*mov.height + j] = paris.pixels[i*mov.height + j];
        }
      }
    }
    //mov.loadPixels();
    image(mov,0,0);
  }
}