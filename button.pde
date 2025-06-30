class Button {
  float x, y;
  float w, h;
  color baseColor;
  color hoverColor;
  color textColor;
  String label;
  String description;  // New field for tooltip text
  boolean isHovering = false;
  
  Button(float x, float y, float w, float h, 
         color baseColor, color hoverColor, 
         color textColor, String label, String description) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.baseColor = baseColor;
    this.hoverColor = hoverColor;
    this.textColor = textColor;
    this.label = label;
    this.description = description;
  }
  
  void display() {
    isHovering = isMouseOver();
    
    // Draw button
    fill(isHovering ? hoverColor : baseColor);
    rect(x, y, w, h);
    
    // Draw text
    fill(textColor);
    textAlign(CENTER, CENTER);
    text(label, x + w/2, y + h/2);
    
    // Draw tooltip if hovering
    if (isHovering) {
      drawTooltip();
    }
  }
  void drawTooltip() {
    // Calculate tooltip position
    float tooltipX = x + w/2;
    float tooltipY = y - 10;
    
    // Draw tooltip background
    fill(255, 255, 255, 200);  // Semi-transparent white
    noStroke();
    //rect(tooltipX - 100, tooltipY - 60, 200, 20);
    
    // Draw tooltip text
    fill(0);
    textAlign(CENTER, CENTER);
    text(description, tooltipX, tooltipY);
  }

  boolean isMouseOver() {
    return (mouseX >= x && mouseX <= x + w &&
            mouseY >= y && mouseY <= y + h);
  }
  
  boolean isPressed() {
    return isMouseOver() && mousePressed;
  }
}
