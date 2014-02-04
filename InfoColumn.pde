// @Author: Ross Kinsella
// An object which retrieves data on the opened location and prints it onto the screen
// three are opened at any one time for the current day +- 1.

// should the data be unavailable at a station, or the day is out of the data set's range, "Unavailable" will be printed


class InfoColumn
{
  int dateOffset;
  int offSet;
  String column;
  int mCurrentNode;
  int tempX,tempY;
  
  InfoColumn(String column)
  {
    tempX = 600;
    tempY = 209;
    this.column = column;
    mCurrentNode = -1;
    if(column == "Left")
    { 
      dateOffset = -1;
      offSet = 0;
    }
    else if (column == "Center") 
    {
      dateOffset = 0;
      offSet = 249;
    }
    else if (column == "Right") 
    {
      dateOffset = 1;
      offSet = 497;
    }
  }
    
  void draw()
  {
   // the day:
   text(getDayOfTheWeek(), getDayXPos(column, getDayOfTheWeek()) , displayBox.getY() + 135 );
   drawTemperatureDetails(); 
   drawWindDetails();
   drawPressureDetails();
   drawCondition();
   //println(getWindDirection());
  }
  
  void drawTemperatureDetails()
  {
    //Temperature details
   text("Temperature:", tempX + offSet , tempY  );
   text("Min:", tempX  +offSet + 10, tempY +20 );
   text("Max:", tempX + offSet + 10 , tempY + 40 );
   text("Mean:", tempX  + offSet + 10,tempY + 60 );
   try
   {  
     text(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMinTemp(), tempX + offSet + 90 , tempY + 20 );
     text(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMaxTemp(), tempX + offSet + 90 , tempY + 40 );
     text(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMeanTemp(), tempX + offSet + 90 , tempY + 60 );
   }
   catch (Exception e)
   {
     text("Unavailable", tempX + offSet + 90  , tempY + 20 );
     text("Unavailable", tempX + offSet + 90  , tempY + 40 );
     text("Unavailable", tempX + offSet + 90  , tempY + 60 );
   }
  }
  
  void drawWindDetails()
  {
    //wind details
   text("Wind:", tempX + offSet , tempY+120  );
   text("Direction:", tempX  +offSet + 10, tempY +140 );
   text("Max speed:", tempX + offSet + 10 , tempY + 160 );
   text("Mean speed:", tempX  + offSet + 10,tempY + 180 );
   try
   {  
     if(!locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMaxWindSpeed().equals("0"))
     {
       text(getWindDirection(), tempX + offSet + 130 , tempY + 140 );
       text(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMaxWindSpeed(), tempX + offSet + 130 , tempY + 160 );
       text(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMeanWindSpeed(), tempX + offSet + 130 , tempY + 180 );
     }
     else
     {
       text("Unavailable", tempX + offSet + 130  , tempY + 140 );
       text("Unavailable", tempX + offSet + 130  , tempY + 160 );
       text("Unavailable", tempX + offSet + 130  , tempY + 180 );      
     }
   }
   catch (Exception e)
   {
     text("Unavailable", tempX + offSet + 130  , tempY + 140 );
     text("Unavailable", tempX + offSet + 130  , tempY + 160 );
     text("Unavailable", tempX + offSet + 130  , tempY + 180 );
   }
  }
  
  void drawPressureDetails()
  {
   //Pressure details
   text("Pressure:", tempX + offSet , tempY+240  );
   text("Min:", tempX  +offSet + 10, tempY +260 );
   text("Max:", tempX + offSet + 10 , tempY + 280 );
   text("Mean:", tempX  + offSet + 10,tempY + 300 );
   try
   {  
     text(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMinPressure(), tempX + offSet + 130 , tempY + 260 );
     text(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMaxPressure(), tempX + offSet + 130 , tempY + 280 );
     if(!locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMeanPressure().equals(" - ")) 
       text(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getMeanPressure(), tempX + offSet + 130 , tempY + 300 );
     else 
       text("Unavailable", tempX + offSet + 130  , tempY + 300 );
   }
   catch (Exception e)
   {
     text("Unavailable", tempX + offSet + 130  , tempY + 260 );
     text("Unavailable", tempX + offSet + 130  , tempY + 280 );
     text("Unavailable", tempX + offSet + 130  , tempY + 300 );
   }  
  }
  
  private String getWindDirection()
  {
    // gets the wind direction in degrees and assigns an appropriate string to it.
    String result = "";
    float windDirectionInDegrees;
    try
    {
      windDirectionInDegrees = Float.parseFloat(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getWindDirection());
      if(windDirectionInDegrees >= 337.5 && windDirectionInDegrees < 22.5) result = "North";
      else if(windDirectionInDegrees >= 22.5 && windDirectionInDegrees < 67.5) result = "North-East";
      else if(windDirectionInDegrees >= 67.5 && windDirectionInDegrees < 112.5) result = "East";
      else if(windDirectionInDegrees >= 112.5 && windDirectionInDegrees < 157.5) result = "South-East";
      else if(windDirectionInDegrees >= 157.5 && windDirectionInDegrees < 202.5) result = "South";
      else if(windDirectionInDegrees >= 202.5 && windDirectionInDegrees < 247.5) result = "South-West";
      else if(windDirectionInDegrees >= 247.5 && windDirectionInDegrees < 292.5) result = "West";
      else if(windDirectionInDegrees >= 292.5 && windDirectionInDegrees < 337.5) result = "North-West";
      else result = "Unavailable"; // error handling.
    }
    catch(Exception e)
    {
      result = "Unavailable";
    }  
    return result;
  }
  
  void drawCondition()
  {
    // checks if there is a condition at the node and draws an image to represent it. 
    // if there is no cloud cover at the node, the method will 'cheat' a little and see what dublin is doing.   
    try
    {
      if(locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getPrecipitation() == 0)
      {
        if (locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()).getCloudCover() == -1)
        {
          // if the node has no cloudCover, do what dublin does.
          if (locations.get(0).getDataPoint(slider.getBoxLocation()+dateOffset).getCloudCover() <5 
            && locations.get(0).getDataPoint(slider.getBoxLocation()+dateOffset).getCloudCover() >1)
              image(theMap.XLsunCloudIcon,tempX+ offSet+50,tempY+350);
          else if (locations.get(0).getDataPoint(slider.getBoxLocation()+dateOffset).getCloudCover() >= 5 )
            image(theMap.XLovercastIcon,tempX+ offSet+50,tempY+350);
          else
            image(theMap.XLsunIcon,tempX+ offSet +50,tempY+350);
        }
        else
        {
          if (locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getCloudCover() <5 
            && locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getCloudCover() >1)
              image(theMap.XLsunCloudIcon,tempX+ offSet+50,tempY+350);
          else if (locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getCloudCover() >= 5 )
            image(theMap.XLovercastIcon,tempX+ offSet+50,tempY+350);
          else
            image(theMap.XLsunIcon,tempX+ offSet +50,tempY+350);
        }
                
      }
      else if (locations.get(mCurrentNode).getDataPoint(slider.getBoxLocation()+dateOffset).getPrecipitation() < 1)
        image(theMap.xlDrizzle,tempX+ offSet+50,tempY+350);
      else image(theMap.XLrainIcon,tempX+ offSet+50,tempY+350);
    }
    catch (Exception e)
    {
     text("Info unavailable", tempX+ offSet+40,tempY+400);
    }
 }
    
 void updateCurrentNode(int newNode)
 {
   // gets ran when a new node is opened.
   mCurrentNode = newNode;
 }

 String getDayOfTheWeek()
 {
   // thsi method is needed for representing days +- 1 of the current day
   String day =dateDisplay.dayOfTheWeek();
   
   if(column == "Left")
   {
     if(day == "Sunday") day = "Saturday";
     else if(day == "Monday") day = "Sunday";
     else if(day == "Tuesday") day = "Monday";
     else if(day == "Wednesday") day = "Tuesday";
     else if(day == "Thursday") day = "Wednesday";
     else if(day == "Friday") day = "Thursday";
     else if(day == "Saturday") day = "Friday";
   }
   
   else if(column == "Right")
   {
     if(day == "Sunday") day = "Monday";
     else if(day == "Monday") day = "Tueday";
     else if(day == "Tuesday") day = "Wednesday";
     else if(day == "Wednesday") day = "Thursday";
     else if(day == "Thursday") day = "Friday";
     else if(day == "Friday") day = "Saturday";
     else if(day == "Saturday") day = "Sunday";
   }  
   return day;
 }
 
 private int getDayXPos(String column, String day)
 {
   // a method for centering the text.
   int x = 0;
   if(column == "Left")
   {
     if(day == "Sunday") x = displayBox.getXTwo() -displayBox.getX() - 65;
     else if (day == "Monday") x= displayBox.getXTwo() -displayBox.getX() - 65;
     else if (day == "Tuesday" )x =  displayBox.getXTwo() -displayBox.getX() - 65;
     else if(day == "Wednesday" ) x =  displayBox.getXTwo() -displayBox.getX() - 80;
     else if(day == "Thursday") x = displayBox.getXTwo() -displayBox.getX() - 70;
     else if(day == "Friday") x = displayBox.getXTwo() -displayBox.getX() - 60;
     else x =  displayBox.getXTwo() -displayBox.getX() - 70;
   }
   
   if(column == "Center")
   {
     if(day == "Sunday") x = displayBox.getXTwo() -displayBox.getX() + 180;
     else if (day == "Monday") x = displayBox.getXTwo() -displayBox.getX() + 180;
     else if (day == "Tuesday" )x =  displayBox.getXTwo() -displayBox.getX() + 175;
     else if(day == "Wednesday" ) x = displayBox.getXTwo() -displayBox.getX() + 170; 
     else if(day == "Thursday") x = displayBox.getXTwo() -displayBox.getX() + 175;
     else if(day == "Friday") x = displayBox.getXTwo() -displayBox.getX() + 190;
     else x = displayBox.getXTwo() -displayBox.getX() + 175;
   }
   
   if(column == "Right")
   {
     if(day == "Sunday") x = displayBox.getXTwo() -displayBox.getX() + 425;
     else if (day == "Monday") x = displayBox.getXTwo() -displayBox.getX() + 425;
     else if (day == "Tuesday" )x =  displayBox.getXTwo() -displayBox.getX() + 415;
     else if(day == "Wednesday" ) x = displayBox.getXTwo() -displayBox.getX() + 410;
     else if(day == "Thursday") x = displayBox.getXTwo() -displayBox.getX() + 425;
     else if(day == "Friday") x = displayBox.getXTwo() -displayBox.getX() + 430;
     else x = displayBox.getXTwo() -displayBox.getX() + 425;
   }
   return x;
 }
 

}
