/*
* Custom search bar that allows the user to query certain locations or dates.
* Accomplishes this by interfacing with an array of the map nodes, slider and
* an instance of the MasterAltDisplay class.
* @author Charlie
*/
public class SearchBar
{
  private int xPos;
  private int yPos;
  private int barWidth;
  private int barHeight;
  private boolean isSelected;
  private String searchInput = "Search...";
  private int strokeColour;
  private Map_Node[] mapNodes;
  private MasterAltDisplay display;
  // @param xPos  The starting x position
  // @param yPos  The starting y position
  // @param barWidth  The width of the bar
  // @param barHeight  The height of the bar
  // @param mapNodes  Array of Map_Node objects - necessary so search bar can
  //                  inflate the nodes when matching input is entered 
  public SearchBar(int xPos, int yPos, int barWidth, int barHeight, Map_Node[] mapNodes, Slider slider, MasterAltDisplay display)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.barWidth = barWidth;
    this.barHeight = barHeight;
    this.strokeColour = colors.getSelectedScheme().getDefaultNode();
    this.mapNodes = mapNodes;
    this.display = display;
  }
  // As long as the search bar is selected, inflates the matching node
  void checkEntry()
  {
    if(isSelected && !checkInteger(searchInput))
    {
      for (int i = 0; i < mapNodes.length; i += 1)
      {
        if (searchInput.equalsIgnoreCase(mapNodes[i].getName()))
        {
          mapNodes[i].mInflating = true;
          display.getMoreInfo().setOpenedNode(i);
          display.getMoreInfo().updateData();
          for(int j=0 ; j < columns.length;j++)
          {
             columns[j].updateCurrentNode(i);
          } 
        }
        else
        {
          mapNodes[i].mInflating = false;
        }
      }
    }
    // If a number is entered, move slider position
    else if(isSelected && checkInteger(searchInput))
    {
      int search = Integer.parseInt(searchInput);
      if (search <= slider.getNumberOfDays() && search > 0)
      {
        // Depending on search, sets box to corresponding day position
        slider.getSliderBox().setX(((search - 1) * (SLIDERRAIL_WIDTH/numberOfDays)) + 
                                 MARGIN_X);
      }
    } 
  }
  // Check if parameter is an integer
  boolean checkInteger(String s)
  {
   try 
   { 
     Integer.parseInt(s); 
   } catch(NumberFormatException e) 
   { 
     return false; 
   }
    // if false isn't returned
    return true;
  }
  // Adds or removes characters from search bar
  void append(char s)
  {
    if(s == BACKSPACE)
    {
      if(!searchInput.equals(""))
      {
        searchInput = searchInput.substring(0, searchInput.length() - 1);
      }
    }
    // Restricts characters entered and pressing enter has no effect
    else if (textWidth(searchInput) < SEARCH_BAR_WIDTH-20 && s != ENTER)
    {
      searchInput = searchInput + str(s);
    }
  }
  // If the search bar is selected, executes append() method
  // as keys are pressed
  void keyPressed() 
  {
    if(isSelected)
    {
      if (key == CODED)
      {
        if (key == SHIFT)
        {}
      }
      else if (key == ENTER)
      {
        checkEntry();
      }
      else
      {
        append(key);
      }
    }
  }
  
  // Checks if user has clicked the search bar or not. If it hasn't been
  // selected before, clears text field. If it's deselected, sets text field
  // to "Search..." 
  void checkSelected()
  {
    // Collision detection
    if (mouseX <= xPos + barWidth && mouseX >= xPos &&
        mouseY <= yPos + barHeight && mouseY >= yPos)
    {
      // Resets search bar if it wasn't selected before being clicked again
      if (!isSelected)
      {
        searchInput = "";
      }
      isSelected = true; 
      // Once clicked, colour scheme's highlighted border option is set
      // as the border colour.
      strokeColour = colors.getSelectedScheme().getHighlightedNode();
    }
    else
    {
      isSelected = false;
      searchInput = "Search...";
      // Once deselected, border colour reverts to colour scheme's
      // default colour.
      strokeColour = colors.getSelectedScheme().getDefaultNode();
    }
  }
  void draw()
  {
    // Search Bar Colour
    fill(WHITE);
    // Search Bar border thickness
    strokeWeight(3);
    // Search Bar border colour
    stroke(strokeColour);
    // Search bar area
    rect(xPos, yPos, barWidth, barHeight, 10);
    // Text colour
    fill(0);
    // Search Input displayed as text
    text(searchInput, xPos + barWidth/20, yPos + 2*barHeight/3);
    // After input is entered, check if it matches the name of a node
  }
}
