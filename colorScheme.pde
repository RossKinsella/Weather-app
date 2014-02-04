public class ColorScheme{
  
  color defaultNode;
  color highlightedNode;
  color boxColor2;
  // a constructor that takes in three color values, the color values entered, are initialised to the member data colors that make up the colorscheme
  ColorScheme(color dNode, color hNode, color color2){
    defaultNode = dNode;
    highlightedNode = hNode;
    boxColor2 = color2;    
  }
  //a method that returns the color labelled Node in the scheme and returns it to the user
  color getDefaultNode(){
    return defaultNode;
  }
  // a method that returns the color labelled higlightedNode to the user
  color getHighlightedNode(){
    return highlightedNode;
  }
  //a method that returns the color labelled boxColor2 to the user
  color getBoxColor2(){
    return boxColor2;
  }
  
}
