class SliderPlusButton extends SliderButton
{  
  int value = PLUS_BUTTON_VALUE;
  int x = MARGIN_X + SLIDERRAIL_WIDTH + MARGIN_BT_RAIL_AND_SLIDER;
  float inRect1Width = SYMBOL_DIMENSION_1;
  float inRect1Height = SYMBOL_DIMENSION_2;
  float inRect2Width = SYMBOL_DIMENSION_2;
  float inRect2Height = SYMBOL_DIMENSION_1;
  float inX1, inY1, inX2, inY2;
  
  SliderPlusButton()
  {
    this.inX1 = x + (BUTTON_WIDTH/2) - (inRect1Width/2);
    this.inY1 = y + ((BUTTON_HEIGHT - inRect1Height)/2);
    this.inX2 = x + (BUTTON_WIDTH/2) - (inRect2Width/2);
    this.inY2 = y + ((BUTTON_HEIGHT - inRect2Height)/2);
  }
  
  void draw()
  {   
   fill(colors.getSelectedScheme().getBoxColor2());
   rect(x, y, width, height, 10);
   fill(RAIL_COLOR);
   rect(inX1, inY1, inRect1Width, inRect1Height);
   rect(inX2, inY2, inRect2Width, inRect2Height);
  }
  
  //Increments the sliders position once pressed.
  void pressed(SliderBox boxIn)
  {
    if(mousePressed &&
       mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height) &&
       boxIn.getX() <= SCREEN_X - MARGIN_X - SLIDERBOX_WIDTH-(SLIDERRAIL_WIDTH/numberOfDays))
    {
      boxIn.slideSetX(boxIn.getX() + value*(SLIDERRAIL_WIDTH/numberOfDays), value);   
    } 
    if(mousePressed &&
       mouseX >= x &&
       mouseX <= (x + width) &&
       mouseY >= y &&
       mouseY <= (y + height) &&
       boxIn.getX() > SCREEN_X - MARGIN_X - SLIDERBOX_WIDTH-(SLIDERRAIL_WIDTH/numberOfDays))
    {
      boxIn.slideSetX(SCREEN_X - MARGIN_X - SLIDERBOX_WIDTH, value);   
    } 
  }  
}
