class SliderRail
{  
  float x = MARGIN_X;
  float y = SCREEN_Y - MARGIN_Y- (SLIDERRAIL_HEIGHT/2) - (SLIDERBOX_HEIGHT / 2);
  int width = SLIDERRAIL_WIDTH;
  float height = SLIDERRAIL_HEIGHT;
  color sliderRailColor = RAIL_COLOR;
  
  // the slider rail is a purely aesthetic object. it sits under the sliderbox and gives the user visual boundaries for its range of
  //movement
  SliderRail(){}
  
  float getX()
  {
   return this.x; 
  }
  
  void draw()
  {
    noStroke();
    fill(sliderRailColor);
    rect(x, y, width, height); 
    ellipse(x, (y + SLIDERRAIL_HEIGHT/2), SLIDERRAIL_HEIGHT, SLIDERRAIL_HEIGHT);
    ellipse((x + SLIDERRAIL_WIDTH), (y + SLIDERRAIL_HEIGHT/2), SLIDERRAIL_HEIGHT, SLIDERRAIL_HEIGHT); 
  }
}
