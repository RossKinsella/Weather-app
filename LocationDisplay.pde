class LocationDisplay extends AltDisplays{
  
  PFont font = createFont("Raleway-Light.ttf", 15);
  
  LocationDisplay(MasterAltDisplay displayBox){
  
 }
 
 /*to get the info for the place selected, have the node return a value equal to its index + 1, if no nodes are selected 
   have a 0 returned. Then if 0 is returned we know to draw the graph. 
 */
  
 void draw(){
   fill(WHITE);
   textFont(font);
   text("Place Name",displayBox.getX() + ALT_DISPLAY_MARGIN,displayBox.getY() + ALT_DISPLAY_MARGIN);  
 }
  
}
