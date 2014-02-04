class MoreInfoSwitch{
 // a button that brings up the more info box when pressed
  int x = SCREEN_X - 300;
  int y = MAP_HEIGHT - 25;
  int width = BUTTON_WIDTH*6;
  int height = BUTTON_WIDTH;
  PFont font = createFont("Raleway-Light.ttf", 15);
  boolean pressed = false;
  boolean boarderVisible = false;
  //
 MoreInfoSwitch(){
   
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
   if(!pressed){
   text("More Info", x + 10, y + 15);
   }
   else{
   text("Graph", x + 10, y + 15);
   }
 }
  // a method that detects when the cursor is over the button and if so, when the method is called the default more info panel appears
  // the method also deflates all the nodes as, the user selects a node once the panel is open
   void select()
  {
    if(mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height))
    {
      if(pressed == false){
       pressed = true;
       //close all opened nodes:
       for(int i = 0; i < theNodes.length ; i++)
         theNodes[i].setInflating(false);
      }
      else{
       pressed = false; 
      }
    }
  }
  //a method that returns a boolean declaring the button either pressed or not pressed
  boolean getPressed(){
    return pressed;
  }
  // a method that detects when the cursor is over the button, when it is a boarder is drawn around the button
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
