public class Datapoint
{
  /**
  * Datapoint class which stores weather data for a particular
  * point in time.
  * Parses through a single string line from a text file.
  * The string must be delimited by commas and contain no spaces.
  * @author Charlie
  **/

  private String rawDate; // GMT
  private String maxTemp; // C
  private String meanTemp; // C
  private String minTemp;// C
  private String maxPressure; // hPa
  private String meanPressure; // hPa
  private String minPressure; // hPa
  private String maxWindSpeed; // km/hr
  private String meanWindSpeed; // km/hr
  private float precipitation; // mm
  private String events; // ?
  private String windDirection; // degrees
  private float cloudCover; // X out of 10, i.e. 8/10 = overcast.
  
  
  // A single line of a text file is passed
  // to the constructor and column formatting.
  // @param line  Line of text file
  // @param columns  Array list of ints that correspond
  //                 to file column formatting
  public Datapoint(String line, int[] columns)
  {
    String[] data = split(line, ",");
    
    try
    {
      rawDate = data[columns[0]];
    }catch(IndexOutOfBoundsException e){rawDate = " - ";}
    try
    {
      maxTemp = data[columns[1]];
    }catch(IndexOutOfBoundsException e){maxTemp = " - ";}
    try
    {
      meanTemp = data[columns[2]];
    }catch(IndexOutOfBoundsException e){meanTemp = " - ";}
    try
    {
      minTemp = data[columns[3]];
    }catch(IndexOutOfBoundsException e){minTemp = " - ";}
    try
    {
      maxPressure = data[columns[4]];
    }catch(IndexOutOfBoundsException e){maxPressure = " - ";}
    try
    {
      meanPressure = data[columns[5]];
    }catch(IndexOutOfBoundsException e){meanPressure = " - ";}
    try
    {
      minPressure = data[columns[6]];
    }catch(IndexOutOfBoundsException e){minPressure = " - ";}
    try
    {
      maxWindSpeed = data[columns[7]];
    }catch(IndexOutOfBoundsException e){maxWindSpeed = " - ";}
    try
    {
      meanWindSpeed = data[columns[8]];
    }catch(IndexOutOfBoundsException e){meanWindSpeed = " - ";}
    try
    {
      precipitation = Float.parseFloat(data[columns[9]]);
    }catch(IndexOutOfBoundsException e){precipitation = -1;}
    try
    {
      events = data[columns[10]];
    }catch(IndexOutOfBoundsException e){events = " - ";}
    try
    {
      windDirection = data[columns[11]];
    }catch(IndexOutOfBoundsException e){windDirection = " - ";}
    try
    {
      cloudCover = Float.parseFloat(data[columns[12]]);
    }catch(IndexOutOfBoundsException e){cloudCover = -1;}
     catch(NumberFormatException e){cloudCover = -1;}
  }
  
  // Getters for variables  
  public String getRawDate()
  {
    return rawDate;
  }
  
  public String getMaxTemp()
  {
    return maxTemp;
  }
  
  public String getMeanTemp()
  {
    return meanTemp;
  }
  
  public String getMinTemp()
  {
    return minTemp;
  }
  
  public String getMaxPressure()
  {
    return maxPressure;
  }
  
  public String getMeanPressure()
  {
    return meanPressure;
  }
  
  public String getMinPressure()
  {
    return minPressure;
  }
  
  public String getMaxWindSpeed()
  {
    return maxWindSpeed;
  }
  
  public String getMeanWindSpeed()
  {
    return meanWindSpeed;
  }
  
  public float getPrecipitation()
  {
    return precipitation;
  }
      
  public String getEvents()
  {
    return events;
  }
  
  public String getWindDirection()
  {
    return windDirection;
  } 
  
  public float getCloudCover()
  {
    return cloudCover;
  }
}
