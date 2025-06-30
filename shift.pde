PImage shift(PImage img)
{
     for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];

    float h = hue(c);
    float s = saturation(c);
    float b = brightness(c);

    h = (h + 60) % 360;  // Shift hue by 60 degrees

    img.pixels[i] = color(h, s - 100, b);  // Store modified color
  } 
   img.updatePixels();
   return (img);
}

PImage unshift(PImage img)
{
     for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];

    float h = hue(c);
    float s = saturation(c);
    float b = brightness(c);

    h = (h - 60 + 360) % 360;  // Shift hue by 60 degrees

    img.pixels[i] = color(h, s + 100, b);  // Store modified color
  } 
   img.updatePixels();
   return (img);
}
