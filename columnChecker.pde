/*
* Used to check the formatting of each file scrubbed from the internet.
* Parses through the the first column headings line and determines
* which column each weather data value is stored. This is accomplished by
* storing column positions in a default array of default weather positions.
* (For example, the date's column value will always be stored at the first 
* index of the array)
*
* @author Charlie
*/

public class ColumnChecker
{
  // Columns
  private int rawDate = -1;
  private int maxTemp = -1;
  private int meanTemp = -1;
  private int minTemp = -1;
  private int maxPressure = -1; 
  private int meanPressure = -1;
  private int minPressure = -1; 
  private int maxWindSpeed = -1;
  private int meanWindSpeed = -1;
  private int precipitation = -1;
  private int events = -1; 
  private int windDirection = -1;
  private int cloudCover = -1;
  
  public ColumnChecker(String[] data)
  {
    // Remove leading and trailing spaces
    for (int i = 0; i < data.length; i += 1)
    {
      data[i] = data[i].trim();
    }
    // Date column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("GMT") || 
          data[i].equals("Date"))
     {
       rawDate = i;
     } 
    }
    // Max Temp column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("MaxTemperatureC") ||
          data[i].equals("TemperatureHighC") ||
          data[i].equals("Max TemperatureC"))
      {
        maxTemp = i;
      } 
    }
    // Mean Temp column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Mean Temperature C") ||
          data[i].equals("TemperatureAvgC") ||
          data[i].equals("Mean TemperatureC"))
      {
        meanTemp = i;
      }
    }
    // Min Temp column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Min TemperatureC") ||
          data[i].equals("TemperatureLowC") ||
          data[i].equals("Min Temperature C"))
      {
        minTemp = i;
      }
    }
    // Max Pressure column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Max Sea Level PressurehPa") ||
          data[i].equals("PressureMaxhPa"))
      {
        maxPressure= i;
      }
    }
    // Mean Pressure column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Mean Sea Level PressurehPa") ||
          data[i].equals("PressureMeanhPa"))
      {
        meanPressure = i;
      }
    }
    // Min Pressure column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Min Sea Level PressurehPa") ||
          data[i].equals("PressureMinhPa"))
      {
        minPressure = i;
      }
    }
    // Max Wind Speed column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Max Wind SpeedKm/h") ||
          data[i].equals("WindSpeedMaxKMH"))
      {
        maxWindSpeed = i;
      }
    }
    // Mean Wind Speed column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Mean Wind SpeedKm/h") ||
          data[i].equals("WindSpeedAvgKMH"))
      {
        meanWindSpeed = i;
      }
    }
    // Precipitation column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Precipitationmm") ||
          data[i].equals("PrecipitationSumCM"))
      {
        precipitation = i;
      }
    }
    // Events column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("Events") ||
          data[i].equals("Event"))
      {
        events = i;
      }
    }
    // Wind Direction column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("WindDirDegrees"))
      {
        windDirection = i;
      }
    }
    // Cloud Cover column
    for (int i = 0; i < data.length; i += 1)
    {
      if (data[i].equals("CloudCover"))
      {
        cloudCover = i;
      }
    }
  }
  
  // Get Columns
  public int[] getColumns()
  {
    int[] columns = {rawDate,
                     maxTemp,
                     minTemp,
                     meanTemp,
                     maxPressure,
                     meanPressure,
                     minPressure,
                     maxWindSpeed,
                     meanWindSpeed,
                     precipitation,
                     events,
                     windDirection,
                     cloudCover
                     };
    return columns;
  }

}
