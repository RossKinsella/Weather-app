class SliderBox
{
  //  The sliderbox allows the user to use a scroll at the bottom of the screen
  
  int x, y, x1, y1, slideX, slideValue;
  int width = SLIDERBOX_WIDTH;
  int height = SLIDERBOX_HEIGHT;
  int widthIn = SLIDERBOX_WIDTH - (MARGIN_BT_BOXES_IN_SLIDER_BOX*2);
  int heightIn = SLIDERBOX_HEIGHT - (MARGIN_BT_BOXES_IN_SLIDER_BOX*2); 
  color insideBoxColor = RAIL_COLOR;  
  boolean pressed = false;
  boolean slide=false;
  SliderBox(ColorGroup colors)
  {  
    this.x = SLIDERRAIL_WIDTH + MARGIN_X - SLIDERBOX_WIDTH;
    this.y = SCREEN_Y - (MARGIN_Y + SLIDERBOX_HEIGHT);
    this.x1 = x + MARGIN_BT_BOXES_IN_SLIDER_BOX;
    this.y1 = y + MARGIN_BT_BOXES_IN_SLIDER_BOX;
    this.slideX=SLIDE_X_NULL;
    this.slideValue=0;

  }
  
  void draw()
  {
    if (slide) slide();
    this.x1 = x + MARGIN_BT_BOXES_IN_SLIDER_BOX;    
    if(pressed == true){
     noStroke();
    fill(colors.getSelectedScheme().getHighlightedNode());
    rect(x, y, width, height, 10);
    }
    else if(pressed == false){
    noStroke();
    fill(colors.getSelectedScheme().getDefaultNode());
    rect(x, y, width, height, 10);
    }
    fill(insideBoxColor);
    rect(x1, y1, widthIn, heightIn, 10); 
  }
  
  int getX()
  {
   return this.x; 
  }
  
  void setX(int x)
  {
    this.x = x; 
  } 
  
  void slideSetX(int slideX, int slideValue)
  {
    if (this.slideX==SLIDE_X_NULL)
    {
      this.slideX = slideX; 
      this.slideValue=slideValue;
      slide=true;
    }
  } 
  
  void slide()
  {
    if ((this.slideX!=SLIDE_X_NULL)&&(this.slide))
    {
      if (slideValue==-1)
      {
        if (this.x>slideX)
        {
          this.x+=slideValue*2;
        }
        else
        {
          slideValue=0;
          slide=false;
          slideX=SLIDE_X_NULL;
        }
      }
      else if (slideValue==1)
      {
        if (this.x<slideX)
        {
          this.x+=slideValue*2;
        }
        else
        {
          slideValue=0;
          slide=false;
          slideX=SLIDE_X_NULL;
        }
      }
    }
  }
  
  void move()
  {
    // Check to see if slider has been selected
    // boolean pressed is set to true if this is
    // the case
   if(pressed == false &&
      mousePressed &&   
      mouseX >= x &&
      mouseX <= (x + SLIDERBOX_WIDTH) &&
      mouseY >= y &&
      mouseY <= (y + SLIDERBOX_HEIGHT) &&
      mouseX <= SCREEN_X - MARGIN_X - SLIDERBOX_WIDTH + (SLIDERBOX_WIDTH/2) &&
      mouseX >= MARGIN_X + (SLIDERBOX_WIDTH/2))
   {
     pressed = true;        
   }
   // If the user holds down the mouse button
   // they can manipulate the slider without 
   // being over it
   else if( pressed == true &&
      mousePressed &&
      mouseX <= SCREEN_X - MARGIN_X - SLIDERBOX_WIDTH + (SLIDERBOX_WIDTH/2) &&
      mouseX >= MARGIN_X + (SLIDERBOX_WIDTH/2)&&
      mouseY > MAP_HEIGHT + MAP_MAP_SLIDER_BOUNDARY_MARGIN)
   {
     this.x = mouseX - (SLIDERBOX_WIDTH/2);
   }
   // Once the mouse button is released, pressed reverts
   // to false and the user ceases to be able to move the
   // slider.
   else
   {
     pressed = false;
   }
  }    
}
