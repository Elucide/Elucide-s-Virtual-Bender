import java.util.Arrays;

PImage header_img;
PImage image_to_save;
PImage cp_background;
PImage background;

//ArrayList<PImage> history = new ArrayList<PImage>();
History history;

int historyindex;
Button backButton;

Button testButton, loadButton, saveButton;
Button ermButton, bruhButton, blurButton, shineButton, shiftButton;
Button thresholdButton, unshiftButton;
Button redSortButton, greenSortButton, blueSortButton;
Button postButton;

class History
{
    ArrayList<PImage> history;
    History()
    {
        this.history = new ArrayList<PImage>();
    }
    
    void add(PImage img)
    {
        PImage newImg = createImage(img.width, img.height, ARGB);
        img.loadPixels();
        newImg.loadPixels();
        arrayCopy(img.pixels, newImg.pixels);
        newImg.updatePixels();
        this.history.add(newImg);
    }
    
    PImage get(int index)
    {
       return (this.history.get(index));
    }
    int size()
    {
       return (this.history.size()); 
    }
    void remove(int index)
    {
       this.history.remove(index); 
    }
}

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
  //history.add(loadImage("test.JPG"));
  history = new History();
  history.add(loadImage("test.JPG"));
  header_img = loadImage("header.jpg");
  cp_background = loadImage("control_panel_background_final.png");
  background = loadImage("background.png");
  header_view = new View(10, 10, 720, 144);
  viewfinder_view = new View(20, 154, 680, 480);
  control_panel_view = new View(740, 20, 340, 700);
  backButton = new Button(990, 50, 30, 30, 
                           color(100, 200, 255), 
                           color(150, 220, 255), 
                           color(0), "back", "oops");
                           
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
  

  backButton.display();
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
//   println("length in history is ", history.size());
   PImage img = history.get(history.size() - 1);
   img.updatePixels();
   if (img.width <= img.height)
   {
     image(img, 340 - (img.width * 480 / img.height) / 2 , 0, img.width * 480 / img.height, 480);
   }
   else
   {
     image(img, 0, 240 - (img.height * 680 / img.width) / 2, 680, img.height * 680 / img.width);
   }
}


PImage back()
{
    println("length is ", history.size());
    PImage img;
    if (history.size() > 1)
    {
        println("Im removing last image !");
        history.remove(history.size() - 1);
    }
    println("new length is ", history.size());
    img = history.get(history.size() - 1);
    return img;
}

void mousePressed() {
  // Check if mouse is in control panel view
    control_panel_view.activate();
    
    if (backButton.isPressed())
    {
       back();
    }
    if (testButton.isPressed())
    {
    }
    if (loadButton.isPressed())
    {
      selectInput("Select a file to process:", "fileSelected");
    }
    if (saveButton.isPressed())
    {
       saveImageWithDialog(history.get(history.size() - 1));
    }
    if (ermButton.isPressed())
    {
        history.add(erm(history.get(history.size() - 1)));
    }
    if (bruhButton.isPressed())
    {
        history.add(bruh(history.get(history.size() - 1)));
    }
    if (blurButton.isPressed())
    {
        history.add(blur(history.get(history.size() - 1)));
    }
    if (shineButton.isPressed())
    {
        history.add(shine(history.get(history.size() - 1)));
    }
    if (shiftButton.isPressed())
    {
        history.add(shift(history.get(history.size() - 1)));
    }
    if (thresholdButton.isPressed())
    {
       history.add(threshold(history.get(history.size() - 1)));
    }
    if (unshiftButton.isPressed())
    {
        history.add(unshift(history.get(history.size() - 1)));
    }
    if (redSortButton.isPressed())
    {
       history.add(redsortPixelsVertically(history.get(history.size() - 1)));
    }
    if (greenSortButton.isPressed())
    {
       history.add(greensortPixelsVertically(history.get(history.size() - 1)));
    }
    if (blueSortButton.isPressed())
    {
       history.add(bluesortPixelsVertically(history.get(history.size() - 1)));
    }
    if (postButton.isPressed())
    {
       history.add(posterize(history.get(history.size() - 1)));
    }
    control_panel_view.deactivate();
}
