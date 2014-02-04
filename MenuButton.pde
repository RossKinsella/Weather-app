class MenuButton{
  //A class of button that when pressed brings up the menu screen

  int x;
  int y;
  int width = BUTTON_WIDTH*6;
  int height = BUTTON_WIDTH;
  PFont font = createFont("Raleway-Light.ttf", 15);
  boolean pressed = false;
  boolean boarderVisible = false;
  String text;

  //the constructor for this object takes in a x coordinate and a y coordinate and a String that is displayed as
  //the button text
 MenuButton(int xIn, int yIn, String textIn){
   x = xIn;
   y = yIn;
   text = textIn;
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
   text(text, x + 10, y + 15);
 }
  //a method that changes the visibiliy of the menu when the mouse is over the button if the method is called
   void select()
  {
    if(mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height))
    {
      menu.setVisibility();
    }
  }
  //a method that returns whether or not the button is pressed
  boolean getPressed(){
    return pressed;
  }
  //a method that detects when the cursor is over the box and draws a boarder round it if so
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
