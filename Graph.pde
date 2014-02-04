class Graph extends AltDisplays{
  
  final static int DASH_THICKNESS = 1;
  final static int DASH_LENGTH = 6;
  final static int NUMBER_OF_Y_DASHES = 10;
  final static int AXIS_LENGTH = 550;
  // Where two axes meet 
  float originX;
  float originY;
  // Font used for graph
  PFont font = createFont("Raleway-Light.ttf", 15);
  // Array contains all locations
  ArrayList<Location> locations;
  String date;
  // Type of data read by graph - determined by radial buttons
  int dataType;
  int numberOfDays;
  float minY;
  float maxY;
  float rangeY; // Greatest value - Smallest value
  color pointColor = WHITE;
  int numberOfLocations;
  boolean visible = true;
  
  VariableButtons buttons;

  
  Graph(MasterAltDisplay displayBox, ArrayList<Location> locations, VariableButtons buttons, Slider slider)
  {
    this.originX = displayBox.getX() + 2*ALT_DISPLAY_MARGIN;
    this.originY = displayBox.getY() + displayBox.getHeight() - ALT_DISPLAY_MARGIN;
    
    
    this.locations = locations;
    this.date = "2013-2-"+(slider.getBoxLocation()+1);
    this.buttons = buttons;
    refreshData();
    this.numberOfLocations = locations.size() + 1;
  }
  
 
  public void refreshData() // Updates graph as slider is moved
  {
    this.date = "2013-2-"+(slider.getBoxLocation()+1);
    // Checking which radioButton has been selected
    for (int i = 0; i < buttons.getButtons().length; i += 1)
    {
      if (buttons.getButtons()[i].isSelected())
      {
        this.dataType = buttons.getButtons()[i].getDataType();
      }
    }
    // Adding values to array
    ArrayList<Integer> rangeOfValuesInt = new ArrayList<Integer>();
    ArrayList<Float> rangeOfValuesFloat = new ArrayList<Float>();
    // Loops through locations
    for (int i = 0; i < locations.size(); i += 1)
    {
      if(dataType == 0) // Mean Temp
      {
        int temperature = Integer.parseInt(locations.get(i).getDataPointsArrayList().get(slider.getBoxLocation()).getMeanTemp());
        rangeOfValuesInt.add(temperature);
      }
      else if (dataType == 1) // Mean Pressure
      {
        int pressure;
        // Some locations don't have Mean Pressure, therefore Mean is calculated
        // by taking an average of Max and Min.
        try
        {
          pressure = Integer.parseInt(locations.get(i).getDataPointsArrayList().get(slider.getBoxLocation()).getMeanPressure());
        }catch (NumberFormatException e)
        {
          // Takes average
          pressure = (Integer.parseInt(locations.get(i).getDataPointsArrayList().get(slider.getBoxLocation()).getMaxPressure()) +
                         Integer.parseInt(locations.get(i).getDataPointsArrayList().get(slider.getBoxLocation()).getMinPressure()))/ 2;
        }
          rangeOfValuesInt.add(pressure);
      }

      else if(dataType == 2) // Mean Wind Speed
      {
        int windSpeed = Integer.parseInt(locations.get(i).getDataPointsArrayList().get(slider.getBoxLocation()).getMeanWindSpeed());
        rangeOfValuesInt.add(windSpeed);
      }
      else if (dataType == 3) // Precipitation
      {
        float precipitation = (float)locations.get(i).getDataPointsArrayList().get(slider.getBoxLocation()).getPrecipitation();
        rangeOfValuesFloat.add(precipitation);
      }
    }
    if (dataType != 3)
    {
      float min = rangeOfValuesInt.get(0);
      float max = rangeOfValuesInt.get(0);
      // Determines min and max values
      for(int i = 0; i < rangeOfValuesInt.size(); i += 1)
      {
        if(rangeOfValuesInt.get(i) < min)
        {
          min = rangeOfValuesInt.get(i);
        }
        else if(rangeOfValuesInt.get(i) > max)
        {
          max = rangeOfValuesInt.get(i);
        }      
      }
      // Range calculated based on min and max
      this.minY = min;
      this.maxY = max;
      this.rangeY = max - min;
    }
    else
    {
      float min = rangeOfValuesFloat.get(0);
      float max = rangeOfValuesFloat.get(0);
      // Determines min and max values
      for(int i = 0; i < rangeOfValuesFloat.size(); i += 1)
      {
        if(rangeOfValuesFloat.get(i) < min)
        {
          min = rangeOfValuesFloat.get(i);
        }
        else if(rangeOfValuesFloat.get(i) > max)
        {
          max = rangeOfValuesFloat.get(i);
        }      
      }
      // Range calculated based on min and max
      this.minY = min;
      this.maxY = max;
      this.rangeY = max - min;
    }
  }
  // Shows graph point's value when you hover over it (float)
  private void displayVariableToGraph(float variable, float posX, float posY, String locationName)
  {
    // If mouse lies within point
    if (Math.sqrt(Math.pow(Math.abs(mouseX - posX), 2) + Math.pow(Math.abs(mouseY - posY), 2)) <= (float) GRAPH_POINT_RADIUS/2)
    {
      String variableText=locationName + " : " + variable;
      int boxLength=(int)(textWidth(variableText))+10;
      fill(0,0,0,150);
      rect(posX - boxLength, posY-23,boxLength ,20, 7);
      fill(WHITE);
      text(variableText, posX -boxLength +5, posY - 7);
      pointColor = colors.getSelectedScheme().getHighlightedNode();
    }
    else pointColor = WHITE;
  }
  // Shows graph point's value when you hover over it (int)
  private void displayVariableToGraph(int variable, float posX, float posY, String locationName)
  {
    // If mouse lies within point
    if (Math.sqrt(Math.pow(Math.abs(mouseX - posX), 2) + Math.pow(Math.abs(mouseY - posY), 2)) <= (float) GRAPH_POINT_RADIUS/2)
    {
      String variableText=locationName + " : " + variable;
      int boxLength=(int)(textWidth(variableText))+10;
      fill(0,0,0,150);
      rect(posX - boxLength, posY-23,boxLength ,20, 7);
      fill(WHITE);
      textFont(createFont("Raleway-Light.ttf", 15));
      text(variableText, posX -boxLength +5, posY - 7);
      pointColor = colors.getSelectedScheme().getHighlightedNode();
    }
    else pointColor = WHITE;
  }
  public void draw()
  {
    
    // Updates the graph with relevent data from date based on slider
    refreshData(); 
    stroke(255); 
    strokeWeight(1);
    fill(WHITE);
    // y - axis
    line(originX , originY, originX, originY - AXIS_LENGTH);
    fill(WHITE);
    // x - axis
    line(originX, originY, originX + AXIS_LENGTH, originY);
    
     // x - axis label
    text("Location", originX + AXIS_LENGTH, originY + 20);
    
    // y - axis label
    switch (this.dataType)
    {
      case 0:
        text("Mean Temp / degrees C", originX, originY - (AXIS_LENGTH + 10));
        // Displays Origin Point
        text((int)minY,originX - 20, originY + 5);
        // Displays Max value displayed by Graph
        text((int)maxY, originX - 20, originY - (AXIS_LENGTH - 5));
        break;
      case 1:
        text("Mean Pressure / hPa", originX, originY - (AXIS_LENGTH + 10));
        // Displays Origin Point
        text((int) minY, originX - 50, originY + 5);
        // Displays Max vallue displayed by Graph
        text((int)maxY, originX - 50, originY - (AXIS_LENGTH -5));
        break;
      case 2:
        text("Max Wind Speed / Km/hr", originX, originY - (AXIS_LENGTH + 10));
        // Displays Origin Point
        text((int)minY,originX - 30, originY + 5);
        // Displays Max value displayed by Graph
        text((int)maxY, originX - 30, originY - (AXIS_LENGTH - 5));
        break;
      case 3:
        text("Precipitation / mm", originX, originY - (AXIS_LENGTH + 10));
        // Displays Origin Point
        text(minY,originX - 60, originY + 5);
        // Displays Max value displayed by Graph
        text(maxY, originX - 60, originY - (AXIS_LENGTH - 5));
        break;
    }
    
    // Plots the dashes on the x - axis
    for(int i = 0; i < this.numberOfLocations; i += 1)
    { 
      line(originX + ((i + 1)*((float)AXIS_LENGTH/this.numberOfLocations)), this.originY + (DASH_LENGTH/2), originX + ((i + 1)*((float)AXIS_LENGTH/this.numberOfLocations)), originY - (DASH_LENGTH/2));
    }
    // Plots the dashes on the y - axis
    for (int i = 0; i < NUMBER_OF_Y_DASHES; i += 1)
    {
      line(originX - (DASH_LENGTH/2), originY - ((i+1) * ((float)AXIS_LENGTH/NUMBER_OF_Y_DASHES)), originX + (DASH_LENGTH/2), originY - ((i+1) * (float)(AXIS_LENGTH/NUMBER_OF_Y_DASHES)));
    }
    for (int i = 0; i < locations.size(); i += 1)
    {
      for (int j = 0; j < locations.get(i).getDataPointsArrayList().size(); j += 1)
      {
        if(locations.get(i).getDataPointsArrayList().get(j).getRawDate().equals(this.date))
        {
            if(dataType == 0) // Mean Temp
            {
              int temperature = Integer.parseInt(locations.get(i).getDataPointsArrayList().get(j).getMeanTemp());
              noStroke();
              displayVariableToGraph(temperature, originX + ((float)AXIS_LENGTH/this.numberOfLocations)*(i+1), originY - (AXIS_LENGTH*(temperature - this.minY))/this.rangeY, locations.get(i).getLocationName());
              fill(pointColor);
              ellipse(originX + ((float)AXIS_LENGTH/this.numberOfLocations)*(i+1), originY - (AXIS_LENGTH*(temperature - this.minY))/this.rangeY, GRAPH_POINT_RADIUS, GRAPH_POINT_RADIUS);
              
            }
            if(dataType == 1) // Mean Pressure
            {
              int pressure;
              try
              {
                pressure = Integer.parseInt(locations.get(i).getDataPointsArrayList().get(j).getMeanPressure());
              }
              catch (NumberFormatException e)
              {
                pressure = (Integer.parseInt(locations.get(i).getDataPointsArrayList().get(j).getMaxPressure()) +
                 Integer.parseInt(locations.get(i).getDataPointsArrayList().get(j).getMinPressure()))/ 2;
              }
              noStroke();
              displayVariableToGraph(pressure, originX + ((float)AXIS_LENGTH/this.numberOfLocations)*(i+1), originY - (AXIS_LENGTH*(pressure - this.minY))/this.rangeY, locations.get(i).getLocationName());
              fill(pointColor);
              ellipse(originX + ((float)AXIS_LENGTH/this.numberOfLocations)*(i+1),  originY - (AXIS_LENGTH*(pressure - this.minY))/this.rangeY, GRAPH_POINT_RADIUS, GRAPH_POINT_RADIUS);           
            }
            if(dataType == 2) // Max Wind Speed
            {
              int windSpeed = Integer.parseInt(locations.get(i).getDataPointsArrayList().get(j).getMeanWindSpeed());
              noStroke();
              displayVariableToGraph(windSpeed, originX + ((float)AXIS_LENGTH/this.numberOfLocations)*(i+1), originY - (AXIS_LENGTH*(windSpeed - this.minY))/this.rangeY, locations.get(i).getLocationName());
              fill(pointColor);
              ellipse(originX + ((float)AXIS_LENGTH/this.numberOfLocations)*(i+1),  originY - (AXIS_LENGTH*(windSpeed - this.minY))/this.rangeY, GRAPH_POINT_RADIUS, GRAPH_POINT_RADIUS);
            }
            if(dataType == 3) // Precipitation
            {
              float precipitation = locations.get(i).getDataPointsArrayList().get(j).getPrecipitation();
              if (this.rangeY == 0)
              {
                this.rangeY = 1;
                this.maxY = 1;
              } 
              noStroke();
              displayVariableToGraph(precipitation, originX + ((float)AXIS_LENGTH/this.numberOfLocations)*(i+1), originY - (AXIS_LENGTH*(precipitation - this.minY))/this.rangeY, locations.get(i).getLocationName());
              fill(pointColor);
              ellipse(originX + ((float)AXIS_LENGTH/this.numberOfLocations)*(i+1),  originY - (AXIS_LENGTH*(precipitation - this.minY))/this.rangeY, GRAPH_POINT_RADIUS, GRAPH_POINT_RADIUS);
            }
            fill(WHITE);
        }
      }
    }
  }
}
