class VariableRadioButton
{  
  String name; 
  int x = TEXT_MARGIN_FROM_BOX;
  int y;
  int width = BUTTON_WIDTH;
  int height = BUTTON_HEIGHT;
  color outerColor = BOX_COLOR_2;
  color innerColor = RAIL_COLOR;
  PFont font = createFont("Raleway-Light.ttf", 15);
  boolean selected = false;
  int margin = TEXT_MARGIN_FROM_BOX;
  
  int dataType;
  
  VariableRadioButton(String nameIn, int yIn, int dataType)
  {  
    this.name = nameIn;
    this.y = yIn;
    this.dataType = dataType;
  }
  
  void draw()
  {
    fill(WHITE);
    textFont(font);
    text(name,(x - margin + MARGIN_BT_SCREENEDGE_AND_TEXT) , (y + TEXT_POSITION_TOP_OF_BOX));
    stroke(colors.getSelectedScheme().getBoxColor2());
    fill(RAIL_COLOR);
    rect(x, y, width, height);
    
    if(selected == true)
    {
      noStroke();
      fill(WHITE);
      ellipse((x + (width/2)), (y +(height/2)), SELECTION_CIRCLE_RADIUS, SELECTION_CIRCLE_RADIUS);      
    }  
  }
  //Sets a button to be selected
  void select()
  {
    this.selected = true; 
  }    
  //Checks to see if a new selection has been made.
  boolean selectionMade()
  {
    if(mousePressed &&
       mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height))
    {
      return true; 
    }
    else
    {
      return false;
    }
  }
  // Gets Datatype
  int getDataType()
  {
    return this.dataType;
  }
  //Deselects a button
  void deselect()
  {
    this.selected = false; 
  }
  
  //Returns the selection status of the current button.
  boolean isSelected()
  {
    return selected; 
  } 
  
  void setX(int xIn){
   x = xIn; 
  }
}
