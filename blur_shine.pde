PImage blur(PImage img)
{  
    img.filter(BLUR, 1);
   println("when u need to clean ur glasses");
   return img; 
}

PImage shine(PImage img)
{  
    img.filter(DILATE);
   println("make it shine !");
   return img; 
}
