import java.util.Scanner;
class DateDisplay
{
  public static final int FIRST_VALID_MONTH = 1;
  public static final int LAST_VALID_MONTH = 12;
  public static final int FIRST_VALID_DAY = 1;
  public static final int LAST_DAY_IN_FEBRUARY_NOT_LEAP_YEAR = 28;
  public static final int LAST_DAY_IN_FEBRUARY_LEAP_YEAR = 29;
  
  String rawDate;
  int day;
  int month;
  int year;
  PFont font = createFont("Raleway-Light.ttf", 18);
  DateDisplay(Slider slider, ArrayList<Location> locations)
  {
    displayDate();
  }
  
  public int getDate() {
    return day;
  }
  
  // @return dayOfTheWeekString  The name for the day of the week given the 
  //                             day, month and year. 
  public String dayOfTheWeek()
  {
    
    // Uses temp variables so future calculations aren't affected
    int tempYear = year;
    int tempDay = day + 1;
    int tempMonth = month;
    if (tempMonth == FIRST_VALID_MONTH || tempMonth == FIRST_VALID_MONTH + 1)
    {
      tempYear -= 1;
    }
    int yearLength = Integer.toString(year).length();
    if (yearLength == 2)
    {
      yearLength = 3;
    }
    int c = tempYear / (int)Math.pow(10, Math.abs(yearLength - 2));
    int y = tempYear % 100;
    int w = tempDay;
    w += Math.floor(2.6*(((tempMonth+9) % 12) + 1) - 0.2);
    w += y;
    w += Math.floor(y / 4);
    w += Math.floor(c / 4);
    w -= (2 * c);
    if ( w < 0)
    {
      w = w + ((-w/7) + 1)*7;
    }
    w %= 7;
    String dayOfTheWeekString = "";
    switch (w)
    {
      case 0:
        dayOfTheWeekString = "Sunday";
        break;
      case 1:
        dayOfTheWeekString = "Monday";
        break;
      case 2:
        dayOfTheWeekString = "Tuesday";
        break;
      case 3:
        dayOfTheWeekString = "Wednesday";
        break;
      case 4:
        dayOfTheWeekString = "Thursday";
        break;
      case 5:
        dayOfTheWeekString = "Friday";
        break;
      case 6:
        dayOfTheWeekString = "Saturday";
        break;
    }
    return dayOfTheWeekString;
  }
  // @return cardinalEnding  Returns, in string format, the correct cardinal 
  //                         ending for a given number.
  private String numberEnding(int day)
  {
    String cardinalEnding = "";
    switch (day)
    {
      case 1:
      case 21:
      case 31: 
        cardinalEnding = "st";
        break;
      case 2:
      case 22: 
        cardinalEnding = "nd";
        break;
      case 3:
      case 23:
        cardinalEnding = "rd";
        break;
      default:
        cardinalEnding = "th";
    }
    return cardinalEnding;
  }
  // Function that returns the name of a given month number
  // @param month  Month passed as an int
  // @return monthString  Month that corresponds to int value
  //                      is returned
  private String monthName(int month)
  {
    String monthString = ""; 
    switch (month)
    {
    case 1:
      monthString = "January";
      break;
    case 2:
      monthString = "February";
      break;
    case 3:
      monthString = "March";
      break;
    case 4:
      monthString = "April";
      break;
    case 5:
      monthString = "May";
      break;
    case 6:
      monthString = "June";
      break;
    case 7:
      monthString = "July";
      break;
    case 8:
      monthString = "August";
      break;
    case 9:
      monthString = "September";
      break;
    case 10:
      monthString = "October";
      break;
    case 11:
      monthString = "November";
      break;
    case 12:
      monthString = "December";
      break;
    }
    return monthString;
  }
  
  // Updates the current date that text widget should display to
  // the user based on the position of the slider.
  void displayDate()
  {
    // Gets the dates from Dublin
    rawDate = locations.get(0).getDataPointsArrayList().get(slider.getBoxLocation()).getRawDate();
    Scanner scanner = new Scanner(rawDate);
    scanner.useDelimiter("-");
    year = scanner.nextInt();
    month = scanner.nextInt();
    day = scanner.nextInt();
    
    String displayDate = dayOfTheWeek() + ", " + day + numberEnding(day) + " " + monthName(month) + " " + year;
    textFont(font);
    text(displayDate, SCREEN_X/2 - (displayDate.length()*3), SCREEN_Y - 55); 
  }
  void draw()
  {
    fill(WHITE);
    displayDate();
  }
}
