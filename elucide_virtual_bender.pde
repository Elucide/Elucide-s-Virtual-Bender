PImage loadedImage;
PImage header_img;
PImage image_to_save;
Button testButton, loadButton, ermButton, bruhButton, blurButton, saveButton;

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
}

void draw()
{
  background(#D6CBFF);
  
  //viwer rectangle zone
  fill(#FFFAE0);
  rect(10, 144, 700, 500, 10);

  //control panel rectangle zone
  fill(#E5FFEA);
  rect(720, 10, 340, 700, 10);
 
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



PImage blur(PImage img)
{  
    img.filter(BLUR, 1);
   println("what a sigma");
   return img; 
}

void mousePressed() {
  // Check if mouse is in control panel view
    control_panel_view.activate();
    if (testButton.isPressed())
    {
       saveImageWithDialog(loadedImage);
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
    control_panel_view.deactivate();
}
