// @Author: Ross Kinsella
// an extension of the AltDisplays class
// Creates a window to the right of the map which shows the name of the noder and prompts the user to open a node.
// additional detail of the opened node will be shown in three columns which are seperate instances of the infoColumn class.


public class InfoPanel extends AltDisplays
{
 int startXPos, startYPos;
 PFont nameFont;
 int mOpenedNode;
 String mName;
 
 
 InfoPanel()
 {
   nameFont = createFont("Raleway-Light.ttf", 54);
   mOpenedNode = -1;
   mName = null;
   columns = new InfoColumn[3];
   columns[0] = new InfoColumn("Left");
   columns[1] = new InfoColumn("Center");
   columns[2] = new InfoColumn("Right");
 }
 
 void updateData()
 {
   mName = theNodes[mOpenedNode].getName();
 }
 
 void draw()
 {
   drawFrame();
   if (mOpenedNode != -1)
   {
     fill(255);
     for (int i = 0; i<columns.length ;i++)
     {
       columns[i].draw();
     }
     
   }
 }
 
 // returns a suitable X found by trail and error.
 int getNameXPos()
 {
   int X;
   if(mName.length() == 4) X = displayBox.getXTwo() -displayBox.getX() + 130;
   else if(mName.length() == 6) X = displayBox.getXTwo() -displayBox.getX() + 100;
   else if(mName.length() == 7) X = displayBox.getXTwo() -displayBox.getX() + 95;
   else if(mName.length() == 8) X = displayBox.getXTwo() -displayBox.getX() + 70;
   else if(mName.length() == 9) X = displayBox.getXTwo() -displayBox.getX() + 70;
   else if(mName.length() == 10) X = displayBox.getXTwo() -displayBox.getX() + 20;
   else if(mName.length() == 11) X = displayBox.getXTwo() -displayBox.getX() + 35;
   else if(mName.length() == 12) X = displayBox.getXTwo() -displayBox.getX() + 20;
   else if(mName.length() == 13) X = displayBox.getXTwo() -displayBox.getX();
   
   else X = displayBox.getXTwo() -displayBox.getX() + 130;
   return X;
 }
 

 
 void drawFrame()
 {
   textFont(nameFont, 54);
   line(displayBox.getX(), displayBox.getY() + 100, displayBox.getXTwo(),displayBox.getY() +100);
   fill(255);
   textSize(60);
   smooth(18);
   
   // if a node is open
   if(mOpenedNode != -1)
   {
   text(theNodes[mOpenedNode].getName(), getNameXPos() ,displayBox.getY() +90 );
   fill(colors.getSelectedScheme().getDefaultNode());
   textSize(15);
   
   line(displayBox. getX() + displayBox.getWidthOfBox()/3, displayBox.getY() + 100,displayBox. getX() + displayBox.getWidthOfBox()/3,displayBox.getY() +635 );
   line(displayBox. getX() + displayBox.getWidthOfBox()/3*2,displayBox.getY() + 100,displayBox. getX() + displayBox.getWidthOfBox()/3*2,displayBox.getY() +635 );
   line(displayBox.getX(), displayBox.getY() + 500, displayBox.getXTwo(),displayBox.getY() +500);
   
   line(displayBox.getX(), displayBox.getY() + 150, displayBox.getXTwo(),displayBox.getY() +150);
   }
   else // if none are open
   {
     textSize(20);
     text("Select a node to view more information.", (displayBox.getXTwo() -displayBox.getX()) ,displayBox.getY() +90 );
   }
 
 
   fill(colors.getSelectedScheme().getDefaultNode());
   textSize(15);
 } 

 
 public void setOpenedNode(int index)
 {
   mOpenedNode = index;
 }
 
 public int getCurrentNode()
 {
   return mOpenedNode;
 }
  
}
