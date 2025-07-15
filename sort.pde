PImage redsortPixelsVertically(PImage img) {
  img.loadPixels();

  int w = img.width;
  int h = img.height;

  for (int x = 0; x < w; x++) {
    int y = 0;
    while (y < h) {
      int index = y * w + x;

      if ((red(img.pixels[y * w + x]) >= green(img.pixels[y * w + x]) && red(img.pixels[y * w + x]) >= blue(img.pixels[y * w + x]))) {
        int yStart = y;

        while (y < h && (red(img.pixels[y * w + x]) >= green(img.pixels[y * w + x]) && red(img.pixels[y * w + x]) >= blue(img.pixels[y * w + x]))) {
          y++;
        }

        int yEnd = y;
        int len = yEnd - yStart;

        int[] segment = new int[len];
        for (int i = 0; i < len; i++) {
          segment[i] = img.pixels[(yStart + i) * w + x];
        }

        for (int i = 0; i < len - 1; i++)
        {
          for (int j = 0; j < len - i - 1; j++)
          {
            if (brightness(segment[j]) > brightness(segment[j + 1]))
            {
              int temp = segment[j];
              segment[j] = segment[j + 1];
              segment[j + 1] = temp;
            }
          }
        }

        for (int i = 0; i < len; i++)
        {
          img.pixels[(yStart + i) * w + x] = segment[i];
        }

      }
      else
      {
        y++;
      }
    }
  }
  img.updatePixels();
  return img;
}

PImage greensortPixelsVertically(PImage img) {
  img.loadPixels();
  //bw.loadPixels();

  int w = img.width;
  int h = img.height;

  for (int x = 0; x < w; x++) {
    int y = 0;
    while (y < h) {
      int index = y * w + x;

      if ((green(img.pixels[y * w + x]) >= blue(img.pixels[y * w + x]) && green(img.pixels[y * w + x]) >= red(img.pixels[y * w + x]))) {
        int yStart = y;

        while (y < h && (green(img.pixels[y * w + x]) >= blue(img.pixels[y * w + x]) && green(img.pixels[y * w + x]) >= red(img.pixels[y * w + x]))) {
          y++;
        }

        int yEnd = y;
        int len = yEnd - yStart;

        int[] segment = new int[len];
        for (int i = 0; i < len; i++) {
          segment[i] = img.pixels[(yStart + i) * w + x];
        }

        for (int i = 0; i < len - 1; i++) {
          for (int j = 0; j < len - i - 1; j++) {
            if (brightness(segment[j]) > brightness(segment[j + 1])) {
              int temp = segment[j];
              segment[j] = segment[j + 1];
              segment[j + 1] = temp;
            }
          }
        }

        // Put sorted pixels back
        for (int i = 0; i < len; i++) {
          img.pixels[(yStart + i) * w + x] = segment[i];
        }

      } else {
        y++;
      }
    }
  }
  img.updatePixels();
  return img;
}
PImage bluesortPixelsVertically(PImage img) {
  img.loadPixels();
  //bw.loadPixels();

  int w = img.width;
  int h = img.height;

  for (int x = 0; x < w; x++) {
    int y = 0;
    while (y < h) {
      int index = y * w + x;

      // Start of a black segment
      if ((blue(img.pixels[y * w + x]) >= green(img.pixels[y * w + x]) && blue(img.pixels[y * w + x]) >= red(img.pixels[y * w + x]))) {
        int yStart = y;

        // Find the end of the black vertical segment
        while (y < h && (blue(img.pixels[y * w + x]) >= green(img.pixels[y * w + x]) && blue(img.pixels[y * w + x]) >= red(img.pixels[y * w + x]))) {
          y++;
        }

        int yEnd = y;
        int len = yEnd - yStart;

        // Grab the pixels from original image
        int[] segment = new int[len];
        for (int i = 0; i < len; i++) {
          segment[i] = img.pixels[(yStart + i) * w + x];
        }

        // Manual sort by brightness (bubble sort)
        for (int i = 0; i < len - 1; i++) {
          for (int j = 0; j < len - i - 1; j++) {
            if (brightness(segment[j]) > brightness(segment[j + 1])) {
              int temp = segment[j];
              segment[j] = segment[j + 1];
              segment[j + 1] = temp;
            }
          }
        }

        // Put sorted pixels back
        for (int i = 0; i < len; i++) {
          img.pixels[(yStart + i) * w + x] = segment[i];
        }

      } else {
        y++;
      }
    }
  }
  img.updatePixels();
  return img;
}
