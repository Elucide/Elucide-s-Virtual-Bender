
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  }
  else
  {
    println("User selected " + selection.getAbsolutePath());
    load_image_from_button(selection.getAbsolutePath());
  }
}

void load_image_from_button(String path)
{
   loadedImage = loadImage(path);
}

void saveImageWithDialog(PImage img) {
  image_to_save = img;
  selectOutput("Select a location to save the image:", "fileSelected_save");
}

void fileSelected_save(File selection) {
  if (selection != null) {
    String path = selection.getAbsolutePath();

    // 🔒 Ensure valid file extension
    if (!(path.toLowerCase().endsWith(".png") || path.toLowerCase().endsWith(".jpg"))) {
      path += ".png"; // Default to PNG
    }

    println("Saving to: " + path);

    // ✅ Save using correct path
    boolean success = image_to_save.save(path);

    if (success) {
      println("Image saved successfully.");
    } else {
      println("Failed to save the image.");
    }

  } else {
    println("Save canceled.");
  }
}
