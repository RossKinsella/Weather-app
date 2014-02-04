class ColorScreenSwitch{
 // a button that when pressed brings up the colorScreen
  int x;
  int y;
  int width = BUTTON_WIDTH*6;
  int height = BUTTON_WIDTH;
  PFont font = createFont("Raleway-Light.ttf", 15);
  boolean pressed = false;
  boolean boarderVisible = false;
  //an x and  value are taken in the parameters of the constructor and are used to define the position of the box
 ColorScreenSwitch(int xIn, int yIn){
   x = xIn;
   y = yIn;
 }
 
 void draw(){
   hover();
   noStroke();
   if(boarderVisible == true){
     fill(colors.getSelectedScheme().getHighlightedNode());
     rect(x - 5, y - 5, width + 10, height + 10, 10);
   }
   fill(100);
   rect(x, y, width, height, 10);
   fill(255);
   textFont(font);
   text("Change Color", x + 10, y + 15);
 }
  // a method that cahnges the value of the colorScreens visibility. When the method is called, it is necessary that the mouse be over the
  //button
   void select()
  {
    if(mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height))
    {
      colorScreen.changeVisibility();
    }
  }
  // a method taht returns the value of the boolean oressed
  boolean getPressed(){
    return pressed;
  }
  // a method that determines whether or not the mouse is hovering over the button, if it is the buttons boarder is drawn
  void hover(){
    
    if(mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height))
    {
     boarderVisible = true;
    }
    else{
     boarderVisible = false;
    } 
   }
  
}
