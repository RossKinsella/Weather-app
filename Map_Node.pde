// @Author: Ross Kinsella
// an interactive GUI element.
// Each node reperesents a weather station and has two display settings; Inflated and deflated.
// by clicking on a node when it is highlighted by the mouse, it will either inflate or deflate
// when deflated the node shwos an image of the current condition
// when inflated the node showsthe name of the location and basic weather data.


class Map_Node
{
  private int mXPos,mYPos, mIndex;
  private float mCurrentRadius;
  private String mName;
  private color mCurrentColor;
  PFont nodeFont;
  
  private boolean mInflating, mInflated;
  
  Map_Node(String name,int x, int y, int index)
  {
    ellipseMode(CENTER);
    nodeFont = createFont("Raleway-Light.ttf", 15);
    mXPos = x;
    mYPos = y;
    mName = name;
    mIndex = index;
    mCurrentRadius = MAP_NODE_MIN_RADIUS;
    
  }
  public void draw()
  { 
    // checks booleans to see what methods are appropriate
    ellipseMode(CENTER);
    textFont(nodeFont);
    if(mCurrentRadius == MAP_NODE_MIN_RADIUS || mCurrentRadius == MAP_NODE_MAX_RADIUS ) setColor();
    if(!mInflated && !mInflating) deflatedDraw();
    else if(mInflated && mInflating) inflatedDraw();
    else basicDraw();
    if(mInflating) inflate();
    else deflate();
    //testingRectDraw();
  }
  
  void setColor()
  {
    if (mouseOver() == true ) mCurrentColor = colors.getSelectedScheme().getHighlightedNode() ;
    else mCurrentColor =  colors.getSelectedScheme().getDefaultNode();
  }
  
  void basicDraw()
  {
    strokeWeight(5);
    stroke(mCurrentColor);
    fill(254);
    ellipse(mXPos, mYPos, mCurrentRadius, mCurrentRadius); 
    noFill();   
  }
  
  void deflatedDraw()
  {  
    // if the nodes are not inflated/inflating;
    // they will have an icon describing the conditinos
    // the icon selected is based on events, precipition in mm and cloud cover.  
    basicDraw();
    if(locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getPrecipitation() == 0)
    {
      if (locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getCloudCover() == -1)
      {
        // if there is no cloudCover info, look at what dublin is doing
        if (locations.get(0).getDataPoint(slider.getBoxLocation()).getCloudCover() < 5
          && locations.get(0).getDataPoint(slider.getBoxLocation()).getCloudCover() > 1)
          image(theMap.sunCloudIcon,(mXPos-(mCurrentRadius-10)/2)-2,(mYPos-(mCurrentRadius-10)/2)+2);
        else if(locations.get(0).getDataPoint(slider.getBoxLocation()).getCloudCover() >= 5)
          image(theMap.overcastIcon,(mXPos-(mCurrentRadius-10)/2)-2,(mYPos-(mCurrentRadius-10)/2)-1);
        else 
          image(theMap.sunIcon,(mXPos-(mCurrentRadius-10)/2)-2,(mYPos-(mCurrentRadius-10)/2)-1);
    }
    else if (locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getCloudCover() <5
       && locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getCloudCover() > 1) 
      image(theMap.sunCloudIcon,(mXPos-(mCurrentRadius-10)/2)-2,(mYPos-(mCurrentRadius-10)/2)+1);
    else if (locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getCloudCover() >= 5 )
      image(theMap.overcastIcon,(mXPos-(mCurrentRadius-10)/2)-2,(mYPos-(mCurrentRadius-10)/2)-2);
    else
      image(theMap.sunIcon,(mXPos-(mCurrentRadius-10)/2)-2,(mYPos-(mCurrentRadius-10)/2)-1);
    }
    else image(theMap.rainIcon,(mXPos-(mCurrentRadius-10)/2)+2,(mYPos-(mCurrentRadius-10)/2)-1);
  }
  
  void inflatedDraw()
  {
   strokeWeight(5);
   noStroke();
   fill(130,230);
   ellipse(mXPos, mYPos, mCurrentRadius, mCurrentRadius); 
   
   
   fill(0);
   drawNamePlate();
   drawTemperatureDetails();
   
   noFill();
   stroke(mCurrentColor);
   ellipse(mXPos, mYPos, mCurrentRadius, mCurrentRadius); 
   
  }
  
  void writeName()
  {
   // for centering text
    fill(255);
   if(mName.length() == 6)text(mName + ":", (mXPos-mCurrentRadius/6), (mYPos-mCurrentRadius/2) +30);
   if(mName.length() == 4)text(mName + ":", (mXPos-mCurrentRadius/7.5), (mYPos-mCurrentRadius/2) +30);
   if(mName.length() == 11)text(mName + ":", (mXPos-mCurrentRadius/4), (mYPos-mCurrentRadius/2) +30);
   if(mName.length() == 9)text(mName + ":", (mXPos-mCurrentRadius/4.5), (mYPos-mCurrentRadius/2) +30);
   if(mName.length() == 7)text(mName + ":", (mXPos-mCurrentRadius/5), (mYPos-mCurrentRadius/2) +30);
   if(mName.length() == 13)text(mName + ":", (mXPos-mCurrentRadius/3.5), (mYPos-mCurrentRadius/2) +30);
   if(mName.length() == 8)text(mName + ":", (mXPos-mCurrentRadius/5.5), (mYPos-mCurrentRadius/2) +30);
  }
  
  private boolean mouseOver()
  {
    boolean mouseIsOver = false; 
    if (Math.sqrt(Math.pow(abs(mouseX - mXPos), 2) + Math.pow(abs(mouseY - mYPos), 2)) <= mCurrentRadius/2)
              mouseIsOver = true;
    return mouseIsOver;
  }
  
  void drawNamePlate()
  {
   curve(mXPos, 15+mYPos+mCurrentRadius*1.5,
     (mXPos-mCurrentRadius/2)+13.5,mYPos-mCurrentRadius/4,
     (mXPos+mCurrentRadius/2)-13.5,mYPos-mCurrentRadius/4,
      mXPos,  15+mYPos+mCurrentRadius*1.5 );
      
   writeName();    
  }
  
  void drawTemperatureDetails()
  {
    fill(0);
    text("Mean temp: " + locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getMeanTemp()+"°C", 
      (mXPos-mCurrentRadius/3)-15, mYPos-mCurrentRadius/8);
    text("Precipitation: " + locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getPrecipitation()
      + "mm",(mXPos-mCurrentRadius/3)-15, (mYPos-mCurrentRadius/8)+25);
     
     // if the station has no wind speeed recording, it is not displayed
    if(!locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getMeanWindSpeed().equals("0"))
      text("Wind speed: " + locations.get(mIndex).getDataPoint(slider.getBoxLocation()).getMeanWindSpeed()
        + "kmh",(mXPos-mCurrentRadius/3)-15, (mYPos-mCurrentRadius/8)+50);
  }
  
  public void eventCheck()
  {
     if (Math.sqrt(Math.pow(abs(mouseX - mXPos), 2) + Math.pow(abs(mouseY - mYPos), 2)) <= mCurrentRadius/2)
     {
      // if we are in detailed info view on the right hand side, only one node at a time may be open: 
       if(infoButton.getPressed() == true)
       {
         for(int i = 0; i < theNodes.length ; i++)
           theNodes[i].setInflating(false);
         displayBox.moreInfo.setOpenedNode(mIndex);
         for(int i=0 ; i < columns.length;i++)
         {
            columns[i].updateCurrentNode(mIndex);
         } 
         displayBox.moreInfo.updateData();
       }
        mInflating = !mInflating;
        if(mInflating == false) 
          if(displayBox.moreInfo.getCurrentNode() == mIndex) 
          {
            displayBox.moreInfo.setOpenedNode(-1);
 
          }
      }     
  }
  
  void inflate()
  {
    if (mCurrentRadius < MAP_NODE_MAX_RADIUS) mCurrentRadius+=10;
    else
    {
      mInflated = true;
      mCurrentRadius = MAP_NODE_MAX_RADIUS;
    }
  }
  
  void deflate()
  {
    if (mCurrentRadius > MAP_NODE_MIN_RADIUS) mCurrentRadius-=8;
    else mInflated = false;
  }
  
  public void setInflating(boolean newStatus)
  {
    mInflating = newStatus;
  }
  
  public String getName()
  {
    return mName;
  }
}
