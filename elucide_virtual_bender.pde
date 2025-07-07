import java.util.Arrays;

PImage loadedImage;
PImage header_img;
PImage image_to_save;
PImage cp_background;
PImage background;
Button testButton, loadButton, saveButton;
Button ermButton, bruhButton, blurButton, shineButton, shiftButton;
Button thresholdButton, unshiftButton;
Button redSortButton, greenSortButton, blueSortButton;
Button postButton;

class View {
  float x, y, w, h;
  
  View(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void activate() {
    pushMatrix();
    translate(x, y);
  }
  
  void deactivate() {
    popMatrix();
  }
}

View header_view, viewfinder_view, control_panel_view;

void setup()
{
  size(1080, 720);
  loadedImage = loadImage("test.JPG");
  header_img = loadImage("header.jpg");
  cp_background = loadImage("control_panel_background_final.png");
  background = loadImage("background.png");
  header_view = new View(10, 10, 720, 144);
  viewfinder_view = new View(20, 154, 680, 480);
  control_panel_view = new View(740, 20, 340, 700);
  testButton = new Button(750, 50, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "test", "this button does nothing");
                           
  loadButton = new Button(810, 50, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "load", "loads an image !");
                           
  saveButton = new Button(870, 50, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "save", "save your cool image into the computer !");
                     
  ermButton = new Button(750, 110, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "erm", "what a sigma !?!?");
                     
  bruhButton = new Button(810, 110, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "bruh", "bruuuuuuuuuuuuuuh");
                     
  blurButton = new Button(870, 110, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "blur", "simple blur");
                     
  shineButton = new Button(930, 110, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "shine", "to make it shine");
                     
  shiftButton = new Button(990, 110, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "shift", "mess with hsl !");
                     
  thresholdButton = new Button(750, 170, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "bnw", "black and white");
                     
  unshiftButton = new Button(990, 170, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "unshift", "it was not supposed to do this...");
                     
  redSortButton = new Button(810, 170, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "redsort", "sorts pixels that are not red enough");
                     
  greenSortButton = new Button(870, 170, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "greensort", "sorts pixels that are not green enough");
                     
  blueSortButton = new Button(930, 170, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "bluesort", "sorts pixels that are not blue enough");
                     
  postButton = new Button(750, 230, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "post", "posterize your image !!!");
}

void draw()
{
  background(#D6CBFF);
  image(background,0, 0);
 
  //control panel rectangle zone
  fill(#E5FFEA);
  rect(720, 10, 340, 700, 10);
  image(cp_background, 720, 10);
 
  header_view.activate();
  draw_header();
  header_view.deactivate();
  
  viewfinder_view.activate();
  draw_viewfinder();
  viewfinder_view.deactivate();
  

  testButton.display();
  loadButton.display();
  saveButton.display();
  ermButton.display();
  bruhButton.display();
  blurButton.display();
  shineButton.display();
  shiftButton.display();
  thresholdButton.display();
  unshiftButton.display();
  redSortButton.display();
  greenSortButton.display();
  blueSortButton.display();
  postButton.display();
  
 
}

void draw_header()
{
  image(header_img, 0, 0);
}

void draw_viewfinder()
{
   if (loadedImage.width <= loadedImage.height)
   {
     image(loadedImage, 340 - (loadedImage.width * 480 / loadedImage.height) / 2 , 0, loadedImage.width * 480 / loadedImage.height, 480);
   }
   else
   {
     image(loadedImage, 0, 240 - (loadedImage.height * 680 / loadedImage.width) / 2, 680, loadedImage.height * 680 / loadedImage.width);
   }
}

void mousePressed() {
  // Check if mouse is in control panel view
    control_panel_view.activate();
    if (testButton.isPressed())
    {
       loadedImage = posterize(loadedImage);
    }
    if (loadButton.isPressed())
    {
      selectInput("Select a file to process:", "fileSelected");
    }
    if (saveButton.isPressed())
    {
       saveImageWithDialog(loadedImage);
    }
    if (ermButton.isPressed())
    {
        loadedImage = erm(loadedImage);
    }
    if (bruhButton.isPressed())
    {
        loadedImage = bruh(loadedImage);
    }
    if (blurButton.isPressed())
    {
        loadedImage = blur(loadedImage);
    }
    if (shineButton.isPressed())
    {
        loadedImage = shine(loadedImage);
    }
    if (shiftButton.isPressed())
    {
        loadedImage = shift(loadedImage);
    }
    if (thresholdButton.isPressed())
    {
       loadedImage = threshold(loadedImage);
    }
    if (unshiftButton.isPressed())
    {
        loadedImage = unshift(loadedImage);
    }
    if (redSortButton.isPressed())
    {
       redsortPixelsVertically(loadedImage);
    }
    if (greenSortButton.isPressed())
    {
       greensortPixelsVertically(loadedImage);
    }
    if (blueSortButton.isPressed())
    {
       bluesortPixelsVertically(loadedImage);
    }
    if (postButton.isPressed())
    {
       loadedImage = posterize(loadedImage);
    }
    control_panel_view.deactivate();
}
