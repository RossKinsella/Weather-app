import java.util.Properties;
ArrayList<Location> locations;
PFont theFont;
DateDisplay dateDisplay;
int[] dataTypes;
int numberOfDays;
Slider slider;
ColorGroup colors;
ColorScreenSwitch colorButton;
ColorSelectScreen colorScreen;
MoreInfoSwitch infoButton;
MainMenu menu;
MenuButton mapMenuButton;
PImage back;
VariableButtons buttons; 
SearchBar searchBar;

Map theMap;
Map_Node[] theNodes;
InfoColumn[] columns;

MasterAltDisplay displayBox;

void setup()
{
  Properties systemSettings = System.getProperties();
  systemSettings.put("http.proxyHost", "www-proxy.scss.tcd.ie");
  systemSettings.put("http.proxyPort", "8080");
  System.setProperties(systemSettings); 
  
  back = loadImage("clouds.jpg");
  colors = new ColorGroup();
  size(SCREEN_X,SCREEN_Y);
  frameRate(60);
  initialiseLocations(); 
  numberOfDays=locations.get(0).getDataPointsArrayList().size();
  initialiseMap();
  initialiseGuiElements();
  theFont = createFont("Raleway-Light.ttf", 15);
  textFont(theFont);
  searchBar = new SearchBar(width/4, 4*height/5, SEARCH_BAR_WIDTH, SEARCH_BAR_HEIGHT, theNodes, slider, displayBox);
  image(back, 0, 0, width, height);
}
void initialiseMap()
{
  theMap = new Map();
  theNodes = new Map_Node[locations.size()];
  for(int i=0;i<locations.size();i++)
  {
    theNodes[i] = new Map_Node(locations.get(i).getLocationName(), 
      locations.get(i).getCircleX(), locations.get(i).getCircleY() , i);    
  } 
}

void initialiseGuiElements()
{
  // loads in scrollBar
  slider = new Slider(numberOfDays, colors);
  
  // loads in checkboxes
  buttons = new VariableButtons();
  buttons.getButtons()[0].select(); // Selects First Button (Temperature) when program starts.
  
  // loads in displayBox
  displayBox = new MasterAltDisplay(locations, buttons, slider);
  
  dateDisplay = new DateDisplay(slider, locations);
  colorButton = new ColorScreenSwitch(SCREEN_X - 160, MAP_HEIGHT - 25);
  infoButton = new MoreInfoSwitch();
  colorScreen = new ColorSelectScreen();
  menu = new MainMenu();
  mapMenuButton = new MenuButton(SCREEN_X - 440, MAP_HEIGHT - 25,"Menu");
 // back = loadImage("clouds.jpg");
}

void initialiseLocations()
{
  this.locations = new ArrayList<Location>();
  String[] locationStringArray = loadStrings("locations.txt");
  for (int i = 0; i < locationStringArray.length; i++)
  {
    String[] data = split(locationStringArray[i], ",");
    Location tempLocation = new Location(data[0], data[1], data[2], data[3], data[4]);
    this.locations.add(tempLocation);
  }
}

void mouseClicked(){
  searchBar.checkSelected();
  if(menu.getVisible() ==true){
    if(colorScreen.getVisible() == false){
      menu.getMenuButton().select();
      menu.getExitButton().select();
    }
    menu.getMenuColorButton().select();
  }
  else{
  mapMenuButton.select();
  colorButton.select();
  infoButton.select();
  }
}

void mouseReleased()
{
  for(int i = 0; i<locations.size();i++)
  {
    theNodes[i].eventCheck();
  }
}

void draw()
{
  background(BACKGROUND);
  if(menu.getVisible() == true){
    image(back, 0, 0, width, height);
    menu.draw();
  }
  else{  
  theMap.draw();
  buttons.draw();  
  slider.draw();
  displayBox.draw();
  dateDisplay.draw();
  colorButton.draw();
  colorScreen.draw();
  infoButton.draw();
  mapMenuButton.draw();
  searchBar.draw();
  }
  
  colors.selectScheme();
  colorScreen.draw();
}

// If the user presses the right directional arrow the position of the
// slider shall be incremented. The reverse applies for
// left arrow key.
void keyPressed()
{
  searchBar.keyPressed();
  if((keyCode == RIGHT)&&(slider.box.getX() <= SCREEN_X - MARGIN_X - SLIDERBOX_WIDTH-(SLIDERRAIL_WIDTH/numberOfDays)))
  {
    slider.box.slideSetX(slider.box.getX() + (PLUS_BUTTON_VALUE*(SLIDERRAIL_WIDTH/numberOfDays)), PLUS_BUTTON_VALUE);
  }
  if((keyCode == LEFT)&&(slider.box.getX() >= MARGIN_X+(SLIDERRAIL_WIDTH/numberOfDays)))
  {
    slider.box.slideSetX(slider.box.getX() + (MINUS_BUTTON_VALUE*(SLIDERRAIL_WIDTH/numberOfDays)),MINUS_BUTTON_VALUE);
  }
  
  if((keyCode == RIGHT)&&(slider.box.getX() > SCREEN_X - MARGIN_X - SLIDERBOX_WIDTH-(SLIDERRAIL_WIDTH/numberOfDays)))
  {
    slider.box.slideSetX(SCREEN_X - MARGIN_X - SLIDERBOX_WIDTH, PLUS_BUTTON_VALUE);
  }
  if((keyCode == LEFT)&&(slider.box.getX() < MARGIN_X+(SLIDERRAIL_WIDTH/numberOfDays)))
  {
    slider.box.slideSetX(MARGIN_X, MINUS_BUTTON_VALUE);
  }
}  
