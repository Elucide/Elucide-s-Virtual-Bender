PImage erm(PImage img)
{
  int index;
  color img_color;
  float alpha;
  
   for (int x = 0; x < img.width; x++)
   {
      for (int y = 0; y < img.height; y++)
      {
        index = x + y * img.width;
        img_color = img.pixels[index];
        alpha = alpha(img_color);
        img_color /= 2;
        img.pixels[index] = color(red(img_color), green(img_color), blue(img_color), alpha);
      }
   }
   img.updatePixels();  // ← This pushes the changes to the screen
   println("what a sigma");
   return img; 
}


PImage bruh(PImage img)
{
  int index;
  color img_color;
  
   for (int x = 0; x < img.width; x++)
   {
      for (int y = 0; y < img.height; y++)
      {
        index = x + y * img.width;
        img_color = img.pixels[index];
        img_color *= 2;
        img.pixels[index] = img_color;
      }
   }
   img.updatePixels();  // ← This pushes the changes to the screen
   println("bruh");
   return img; 
}
