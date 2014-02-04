class ColorSelectScreen{
  //the screen that contains various radio buttons, labelled in accordance with the color they correspond to. when a button is pressed the others are 
  //deselected and the color scheme is chaged to that of the selected button
  
  //an arraylist of type variableRadioButton is declared
  ArrayList<VariableRadioButton> colorButtons;
  
  //a number of variable radio buttons are declared
  VariableRadioButton purple;
  VariableRadioButton royalBlue;
  VariableRadioButton lightBlue;
  VariableRadioButton green;
  VariableRadioButton yellow;
  VariableRadioButton orange;
  VariableRadioButton red;
  
  boolean visible = false;
  boolean inflating=false;
  boolean deflating=false;
  
  int size = 0;
  int x = SCREEN_X/2 - size/2;
  int y = SCREEN_Y/2 - size/2;
  int x1 = SCREEN_X/2 - COLOR_SELECT_SCREEN_SIZE/2;
  int y1 = SCREEN_Y/2 - COLOR_SELECT_SCREEN_SIZE/2;
  
  //The constructor assigns coordinates and text to the variable radio butttons and adds them to the array
  ColorSelectScreen(){
    purple = new VariableRadioButton("Purple", y1 + 130, 0);
    royalBlue = new VariableRadioButton("Royal Blue", y1 + 160, 1);
    lightBlue = new VariableRadioButton("Light Blue", y1 + 190, 2);
    green = new VariableRadioButton("Green", y1 + 220, 3);
    yellow = new VariableRadioButton("Yellow", y1 + 250, 4);
    orange = new VariableRadioButton("Orange", y1 + 280, 5);
    red = new VariableRadioButton("Red", y1 + 310, 6);
    colorButtons = new ArrayList<VariableRadioButton>();
    colorButtons.add(purple);
    colorButtons.add(royalBlue);
    colorButtons.add(lightBlue);
    colorButtons.add(green);
    colorButtons.add(yellow);
    colorButtons.add(orange);
    colorButtons.add(red);
    
    for(int i = 0; i < colorButtons.size(); i++){
     colorButtons.get(i).setX(this.x1 + 250);
    colorButtons.get(2).select();
  }
  }
  // the menu is only drawn when the visible boolean is true
    void draw()
    {
     if(visible == true)
     {
       stroke(0);
       if((inflating)||(deflating)) noStroke();
       fill(150);
       rect(x, y, size, size);
       if(inflating) inflate();
       if(deflating) deflate();
       if ((inflating==false)&&(deflating==false)&&(visible==true))
       {
         fill(0);
         text("Select Your Color", this.x1 + 125, this.y1 + 70);
         for(int i = 0; i < colorButtons.size(); i++)
         {
           colorButtons.get(i).draw();
         }
         buttonSelection();
       }
     }
    }
  // a method that changes the value of the boolean visible
  void changeVisibility(){
    if(visible == true){
       deflating = true;
     }
     else {
       visible = true;
       inflating=true;
     }
   }
   
   //a method that cycles through the buttons checking if a selection has been made. If so, the index of the 
  //button selected is stored in a temporary variable, all buttons then deselected, the index in the placeholder is then used to select the
  // button that was selected.
   void buttonSelection()
  {
    int s;
    for(int i = 0; i < colorButtons.size(); i++)
    {
      if(colorButtons.get(i).selectionMade()==true)
      {
        s = i; 
        for(int z = 0; z < colorButtons.size(); z++)
        {
          colorButtons.get(z).deselect();
        }
        colorButtons.get(s).select();
      }
    }
  }
  // a method that returns the current value of the boolean visible
  boolean getVisible(){
    return visible;
  }
  // method that returns the current state of the arrayList of variableRadioButtons
  ArrayList<VariableRadioButton> getColorButtons(){
    return colorButtons;
  }
  
  //a method that inflates the window to a certain size.
  //it is used for the window open animation.
  void inflate()
  {
    if (size < COLOR_SELECT_SCREEN_SIZE)
    {
      size+=20;
      inflating=true;
    }
    else
    {
      visible = true;
      size = COLOR_SELECT_SCREEN_SIZE;
      inflating=false;
    }
    x = SCREEN_X/2 - size/2;
    y = SCREEN_Y/2 - size/2;
  }
  
   //a method that deflates the window until it is not visible.
  //it is used for the window close animation.
  void deflate()
  {
    if (size > 0)
    {
      size-=20;
      deflating=true;
    }
    else
    {
      visible=false;
      deflating=false;
      size = 0;
    }
    x = SCREEN_X/2 - size/2;
    y = SCREEN_Y/2 - size/2;
  }
  
}
