class Slider
{
// The slider class contains and runs all of the code relating to the slider. This includes
// the buttons for incrementing and decrementing its position.
// 
// In order to run these classes in the main, all that needs to be called is slider.draw()
//
//The slider can be manipulated using the left and right arrow keys
  
 private int numberOfDays; 
  
 public SliderBox box;
 private SliderRail rail = new SliderRail();
 private SliderMinusButton minusButton = new SliderMinusButton();
 private SliderPlusButton plusButton = new SliderPlusButton();
 private MapSliderBoundary boundary = new MapSliderBoundary();
 
 Slider(int numberOfDays, ColorGroup colors)
 {
   this.numberOfDays=numberOfDays;
   box = new SliderBox(colors);
 }
 int getNumberOfDays()
 {
   return numberOfDays;
 }
 SliderBox getSliderBox()
 {
   return box;
 }
 
 void draw()
 {
    rail.draw();
    minusButton.draw();
    plusButton.draw();  
    box.draw();
    box.move();
    minusButton.pressed(box);
    plusButton.pressed(box);
    boundary.draw();
 }  
  
  int getBoxLocation()
  {
    return ((box.getX()+SLIDERBOX_WIDTH/2)-(MARGIN_X))/(SLIDERRAIL_WIDTH/numberOfDays);
  }
}
