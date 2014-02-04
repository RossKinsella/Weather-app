class VariableButtons
{
  String[] names;
  String name1, name2, name3, name4;
  
  VariableRadioButton[] buttonGroup = new VariableRadioButton[NUMBER_OF_VARIABLES];
  int y = MAX_HEIGHT_FOR_VARIABLE_BUTTONS;
  
  VariableButtons()
  {
    initialiseNames();
    for(int i = 0; i < buttonGroup.length; i++)
    {
      // Given name from array, y value and index from array.
      // Index corresponds to dataType.
      buttonGroup[i] = new VariableRadioButton(names[i], y, i);
      y += BUTTON_HEIGHT + DISTANTS_BETWEEN_VARIABLE_BUTTONS;
    }
  }
  // a method that adds the Strings defined in the member data to the String array names
  void initialiseNames()
  {
  names = new String[NUMBER_OF_VARIABLES];
  name1 = "Temperature";
  name2 = "Pressure";
  name3 = "Wind Speed";
  name4 = "Precipitation";
 

  names[0] = name1;
  names[1] = name2;
  names[2] = name3;
  names[3] = name4; 
  }
  
  void draw()
  {
    for(int i = 0; i < buttonGroup.length; i++)
    {
      buttonGroup[i].draw();
    }
    buttonSelection();
  }
  
  //Senses when a user selects a button and deselects all
  //other buttons.
  void buttonSelection()
  {
    int s;
    for(int i = 0; i < buttonGroup.length; i++)
    {
      if(buttonGroup[i].selectionMade()==true)
      {
        s = i; 
        for(int z = 0; z < buttonGroup.length; z++)
        {
          buttonGroup[z].deselect();
        }
        buttonGroup[s].select();
      }
    }
  }
 VariableRadioButton[] getButtons()
 {
   return buttonGroup;
 } 
}
