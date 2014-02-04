// @Author: Ross Kinsella
// An object for managing the map and its nodes aswell as initialising condition images


class Map
{
  public PImage irelandOutline, sunIcon, rainIcon, sunCloudIcon, overcastIcon;
  public PImage XLsunIcon, xlDrizzle, XLrainIcon, XLsunCloudIcon, XLovercastIcon;
  Map()
  {
    irelandOutline = loadImage("irelandOutline1 copy.png");
    sunIcon = loadImage("sunIcon.png");
    rainIcon = loadImage("rainIcon.png");
    sunCloudIcon = loadImage("sunCloud.png");
    overcastIcon = loadImage("overcast.png");
    
    XLsunIcon = loadImage("xlSun.png");
    XLrainIcon = loadImage("xlRain.png");
    XLsunCloudIcon = loadImage("XLsunCloud.png");
    XLovercastIcon = loadImage("xlOvercast.png");
    xlDrizzle = loadImage("xlDirzzle.png");
    
    //XLsunIcon.resize(100,100);
    //XLrainIcon.resize(100,100);
   // XLsunCloudIcon.resize(100,100);
    //XLovercastIcon.resize(100,100);
    
  }
  
  public void draw()
  {
    image(back, 0, 0);
    image(irelandOutline, 0, 0);

    for(int i = 0; i<locations.size();i++)
    {
      theNodes[i].draw();
    }
  }
}
