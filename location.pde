/*
* Location class used to represent locations/weather stations.
* The class stores the weather data fpr the location.
*
* @author Kyrill
*/
public class Location
{
  //class variables
  private String locationName;
  private String stationName;
  private String locationType;
  private ArrayList<Datapoint> datapoints;
  private int circleX;
  private int circleY;
  int[] columns;
  
  //The constructor takes in a location name(String), location type(String),
  //station name(String), circle x coordinate(int) and circle y coordinate(int).
  //These values are then assigned to the corresponding variables of the location class.
  //Afterwards the Datapoints are initialised.
  public Location(String locationName,String locationType, 
    String stationName, String circleX, String circleY)
  {
    this.locationName=locationName;
    this.locationType = locationType;
    this.stationName=stationName;
    this.circleX= Integer.parseInt(circleX);
    this.circleY= Integer.parseInt(circleY);
    refreshDatapoints();
    
  }
  
  //a method that loads data from a URL.
  //The URL string differs based on the type of weather station (Normal or Airport).
  //The URl takes in the station name that is stored in the current Location object.
  //The data is then loaded line by line into a String array.
  //The lines are then processed to remove html formatting.
  //The line containing data headers is split and fed into the columnchecker class.
  //This lets the Datapoints know which data is available for a specific location.
  //The rest of the lines are then split and new Datapoint objects are created if the line is not empty.
  //The Datapoints are added to an ArrayList of Datapoints.
  public void refreshDatapoints()
  {
    this.datapoints = new ArrayList<Datapoint>();
    // Loads all lines from URL
    String lines[] = {""};
    if(locationType.equals("Airport"))
    {
     lines = loadStrings("http://www.wunderground.com/history/airport/"+stationName+"/2013/2/28/MonthlyHistory.html?format=1");
    }
    else if (locationType.equals("Normal"))
    {
      lines = loadStrings("http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID="+stationName+"&day=1&year=2013&month=2&graphspan=month&format=1");
    }
    // First line of txt file - shows format/headers
    for (int i=1; i<lines.length; i++)
    {
      lines[i]=lines[i].replaceAll("<br />","");
      lines[i]=lines[i].replaceAll("<br>","");
    }
    
    String[] data = split(lines[1], ",");
    ColumnChecker checker = new ColumnChecker(data);
    columns = checker.getColumns();
    for (int i = 2; i < lines.length; i++)
    {
      if (!lines[i].equals(""))
      {
        Datapoint tempDatapoint = new Datapoint(lines[i], columns);
        datapoints.add(tempDatapoint);
      }
    }
  } 
  
  //a method that returns the location name as a String.
  public String getLocationName()
  {
    return locationName;
  }
  
  //a method that returns the x coordinate for the map node of the location as an int.
  public int getCircleX()
  {
    return circleX;
  }
  
  //a method that returns the y coordinate for the map node of the location as an int.
  public int getCircleY()
  {
    return circleY;
  }
  
  //a method that returns the ArrayList of Datapoints.
  public ArrayList<Datapoint> getDataPointsArrayList()
  {
    return datapoints;
  }
  
  //a method that takes in an index of type int and returns the corresponding
  //datapoint from the ArrayList of Datapoints.
  public Datapoint getDataPoint(int index)
  {
    return datapoints.get(index);
  } 
}
