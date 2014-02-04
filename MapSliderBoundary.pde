class MapSliderBoundary
{ 
 int x = 0;
 int y = MAP_HEIGHT + MAP_MAP_SLIDER_BOUNDARY_MARGIN;
 int width = SCREEN_X;
 int height = MAP_SlIDER_BOUNDARY_HEIGHT;
 
 // a line that appears between the slider and the rest of the screen
 
 MapSliderBoundary(){}
 
 void draw()
 {  
   noStroke();
   fill(colors.getSelectedScheme().getDefaultNode());
   rect(x, y, width, height); 
 }  
}
