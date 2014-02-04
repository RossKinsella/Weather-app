class ExitButton{
 //A class of button that when pressed exits the program
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
 ExitButton(int xIn, int yIn, String textIn){
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
  //when the mouse is over the button and this ethod is called. The program will terminate.
   void select()
  {
    if(mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height))
    {
      exit();
    }
  }
  
  boolean getPressed(){
    return pressed;
  }
  //a method determining whether or not the mouse is overing over the button. If it is th buttons boarder will becpme visible.
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
