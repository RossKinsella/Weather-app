//author donal
// a class that contains all of the color schemes for the program stored in an arraylist
public class ColorGroup{
  ArrayList<ColorScheme> colorSchemes;
  
  // pass in the index of the selected box
  int i;
  ColorScheme purple;
  ColorScheme royalBlue;
  ColorScheme lightBlue;
  ColorScheme green;
  ColorScheme yellow;
  ColorScheme orange;
  ColorScheme red;
  
  ColorGroup(){
    // a number of colrschemes are created and added to the arraylist
    this.colorSchemes = new ArrayList<ColorScheme>();
    this.purple = new ColorScheme( color(120, 0, 180), color(149, 236, 0) , color(120, 0, 180, 150));
    colorSchemes.add(this.purple);
    this.royalBlue = new ColorScheme(color(44, 23, 177), color(255, 202, 0), color(44, 23, 177, 150));
    colorSchemes.add(this.royalBlue);
    this.lightBlue = new ColorScheme(color(3, 137, 156), color(255, 122, 0), color(3, 137, 156, 150));
    colorSchemes.add(this.lightBlue);
    this.green = new ColorScheme(color(88, 224, 0), color(244, 61, 107), color(88, 224, 0, 150));
    colorSchemes.add(this.green);
    this.yellow = new ColorScheme(color(255, 182, 0), color(74, 96, 215), color(255, 182, 0, 150));
    colorSchemes.add(this.yellow);
    this.orange = new ColorScheme(color(255, 122, 0), color(3, 137, 156), color(255, 122, 0, 150));
    colorSchemes.add(this.orange);
    this.red = new ColorScheme(color(246, 0, 24), color(89, 234, 58), color(246, 0, 24, 150));
    colorSchemes.add(this.red);  
  }
  //a method that returns the color scheme whos boolean selected is true
  ColorScheme getSelectedScheme(){
    return colorSchemes.get(this.i);
  }
  
   //a method that searches for the selected color scheme
   void selectScheme(){
    for(int x = 0; x < colorScreen.getColorButtons().size(); x++){
        if(colorScreen.getColorButtons().get(x).isSelected() == true){
         this.i = x; 
        }
      }
   }
    
}
