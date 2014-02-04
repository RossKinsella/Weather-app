class MasterAltDisplay
{  
  int x = MAP_WIDTH + ALT_DISPLAY_MARGIN;
  int y = ALT_DISPLAY_MARGIN;
  int width = SCREEN_X -(MAP_WIDTH + (ALT_DISPLAY_MARGIN*2));
  int height =(MAP_HEIGHT + MAP_MAP_SLIDER_BOUNDARY_MARGIN - (ALT_DISPLAY_MARGIN*2));
  AltDisplays[] displays;
  Graph graph;
  public InfoPanel moreInfo;

  //this class acts as a container for the rest of the displays. These are the graph and the more info box

  MasterAltDisplay(ArrayList<Location> locations, VariableButtons buttons, Slider slider)
  {
    displays = new AltDisplays[2];
    graph = new Graph(this, locations, buttons, slider);  
    moreInfo = new InfoPanel(); 
    displays[0] = graph;
    displays[1] = moreInfo;
  }

  void draw()
  {
    if(infoButton.getPressed() == false) noStroke();
    else stroke(255);
    stroke(255); 
    strokeWeight(3);
    rect(x, y, width, height, 20);
    if(infoButton.getPressed() == false)
      displays[0].draw();
    else
      displays[1].draw();
  }
  // a method to return the x value of the box to the user
  int getX()
  {
    return this.x;
  }
  // a mthod to return the y value of the box to the user
  int getY()
  {
    return this.y;
  }
  // a method to return th width of the MasterAltDisplay to the user
  int getWidth()
  {
    return this.width;
  }
  //A method to return the height of the master alt display to the user
  int getHeight()
  {
    return this.height;
  }
  
   int getXTwo()
  {
    int result = 1325;
    return result;
  }

  int getY2()
  {
    int result = 39;
    return result;
  }
  
  int getWidthOfBox()
  {
    int result = getXTwo() - getX();
    return result;
  }
  InfoPanel getMoreInfo()
  {
    return moreInfo;
  }
}
