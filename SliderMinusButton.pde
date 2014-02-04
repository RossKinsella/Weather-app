class SliderMinusButton extends SliderButton
{ 
  int value = MINUS_BUTTON_VALUE;
  int x = MARGIN_X - MARGIN_BT_RAIL_AND_SLIDER - BUTTON_WIDTH;
  float inRect1Width = SYMBOL_DIMENSION_2;
  float inRect1Height = SYMBOL_DIMENSION_1;
  float inX1, inY1;
  
  SliderMinusButton()
  {
    this.inX1 = x + (BUTTON_WIDTH/2) - (inRect1Width/2);
    this.inY1 = y + ((BUTTON_HEIGHT - inRect1Height)/2);    
  }
  
  void draw()
  { 
    fill(colors.getSelectedScheme().getBoxColor2());
    rect(x, y, width, height, 10);
    fill(RAIL_COLOR);
    rect(inX1, inY1, inRect1Width, inRect1Height); 
  }
  
  
  //Decrements the sliders position when pressed.
  void pressed(SliderBox boxIn)
  {
    if(mousePressed &&
       mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height) &&
       boxIn.getX() >= MARGIN_X+(SLIDERRAIL_WIDTH/numberOfDays))
    {
      boxIn.slideSetX(boxIn.getX() + (value*(SLIDERRAIL_WIDTH/numberOfDays)), value); 
    }
    
    if(mousePressed &&
       mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height) &&
       boxIn.getX() < MARGIN_X+(SLIDERRAIL_WIDTH/numberOfDays))
    {
      boxIn.slideSetX(MARGIN_X, value); 
    }
    
  }  
}
