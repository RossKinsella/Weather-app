class MainMenu{
 // the main menu screen that appears on the initial start-up of the program.
  boolean visible = true;
  ColorScreenSwitch menuColorButton = new ColorScreenSwitch(SCREEN_X/2-(BUTTON_WIDTH*6)/2, 600);
  MenuButton menuButton = new MenuButton(SCREEN_X/2-(BUTTON_WIDTH*6)/2, 500, "Map");
  ExitButton exit = new ExitButton(SCREEN_X/2-(BUTTON_WIDTH*6)/2, 700, "Exit");
  PImage logo = loadImage("logo.png");
  String creditText = "Designed and Developed by:\n\nRoss Kinsella\nCharlie Hebert\nKyrill Zorin\n&\nDonal O'Sullivan.";
  PFont font = createFont("Raleway-Light.ttf", 18); 
  PImage logoText = loadImage("logotext copy.png");
  
 MainMenu(){
   
 }
 
 void draw(){
  menuColorButton.draw();
  menuButton.draw();
  exit.draw();
  fill(colors.getSelectedScheme().getDefaultNode());
  ellipse(SCREEN_X/2, SCREEN_Y/2 - 150, 350, 350);
  image(logo, float(SCREEN_X/2 - 150), float(SCREEN_Y/2 - 277/2- 150));
  image(logoText, SCREEN_X/2- 185, SCREEN_Y/2-300);
  fill(255);
  textFont(font);
  text(creditText, 1100, 580);
 }
 // a method that the returns the visible boolean to the user
 boolean getVisible(){
  return visible; 
 }
 // a method that alters the visible boolean value
 void setVisibility(){
  if(visible == true){
   visible = false;
  }
  else{
   visible = true;
  } 
 }
 // a method that returns the colorscreenswitch that is a attribute of this class
 ColorScreenSwitch getMenuColorButton(){
  return menuColorButton;
 }
 // a method that returns the menubutton that is a attribute of this class
  MenuButton getMenuButton(){
  return menuButton;
 }
 // a method that returns the exitbutton that is a attribute of this class
 ExitButton getExitButton(){
  return exit; 
 }
  
}
