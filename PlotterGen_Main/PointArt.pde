void generateLines_Squiggle()
{
  pointMap.clear();
  int stepX = int(img.width/RESOLUTION_X);
  int stepY = int(img.height/RESOLUTION_Y);
  
  for (int y = 0; y < img.height; y += stepY)
  {
    
    for (int x = 0; x < img.width; x += stepX)
    {   
        color c = img.get(x,y);
        float r = c >> 16 & 0xFF;
        float g = c >> 8 & 0xFF;
        float b = c & 0xFF;
        int lum = int((r+g+b)/3);
        if (lum < 245)
        {
          pointMap.add(new linePoint(x-2, y, false));
          pointMap.add(new linePoint(x,y + map(lum,0,255,20,-5), false));
          pointMap.add(new linePoint(x+2,y, false));
        }
        else if (pointMap.size() > 0)
        {
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
    }
    
    //Manual increment
    y += stepY;
    
    for (int x = int(img.width/stepX)*stepX; x >= 0; x -= stepX)
    {   
        color c = img.get(x,y);
        float r = c >> 16 & 0xFF;
        float g = c >> 8 & 0xFF;
        float b = c & 0xFF;
        int lum = int((r+g+b)/3);
        if (lum < 245)
        {
          pointMap.add(new linePoint(x+2,y, false));
          pointMap.add(new linePoint(x,y + map(lum,0,255,20,-5), false));
          pointMap.add(new linePoint(x-2,y, false));
        }
        else if (pointMap.size() > 0)
        {
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
    }
  }
}

void generateLines_Offset()
{
  pointMap.clear();
  int stepX = int(img.width/RESOLUTION_X);
  int stepY = int(img.height/RESOLUTION_Y);
  
  for (int y = 0; y < img.height; y += stepY)
  {
    
    for (int x = 0; x < img.width; x += stepX)
    {   
        color c = img.get(x,y);
        float r = c >> 16 & 0xFF;
        float g = c >> 8 & 0xFF;
        float b = c & 0xFF;
        int lum = int((r+g+b)/3);
        if (lum < 245)
        {
          pointMap.add(new linePoint(x,y + map(lum,0,255,20,-5), false));
        }
        else if (pointMap.size() > 0)
        {
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
    }
    
    //Manual increment
    y += stepY;
    
    for (int x = int(img.width/stepX)*stepX; x >= 0; x -= stepX)
    {   
        color c = img.get(x,y);
        float r = c >> 16 & 0xFF;
        float g = c >> 8 & 0xFF;
        float b = c & 0xFF;
        int lum = int((r+g+b)/3);
        if (lum < 245)
        {
          pointMap.add(new linePoint(x,y + map(lum,0,255,10,-10), false));
        }
        else if (pointMap.size() > 0)
        {
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
    }
  }
}

void generateLines_Spiral()
{
  pointMap.clear();
  int stepX = int(img.width/RESOLUTION_X);
  int stepY = int(img.height/RESOLUTION_Y);
  
  for (int y = 0; y < img.height; y += stepY)
  {
    
    for (int x = 0; x < img.width; x += stepX)
    {   
        color c = img.get(x,y);
        float r = c >> 16 & 0xFF;
        float g = c >> 8 & 0xFF;
        float b = c & 0xFF;
        int lum = int((r+g+b)/3);
        if (lum < 245)
        {
          pointMap.add(new linePoint(x,y, true));
          
          drawSpiral(map(lum,0,255,12,0),x,y);
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
        else if (pointMap.size() > 0)
        {
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
    }
    
    //Manual increment
    y += stepY;
    
    for (int x = int(img.width/stepX)*stepX; x >= 0; x -= stepX)
    {   
        color c = img.get(x,y);
        float r = c >> 16 & 0xFF;
        float g = c >> 8 & 0xFF;
        float b = c & 0xFF;
        int lum = int((r+g+b)/3);
        if (lum < 245)
        {
          pointMap.add(new linePoint(x,y, true));
          
          drawSpiral(map(lum,0,255,12,0),x,y);
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
        else if (pointMap.size() > 0)
        {
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
     }
  }
}

void drawSpiral(float magnitude, int xOffset, int yOffset)
{
    for (float i = 0; i < magnitude; i+= .5)
    {
        pointMap.add(new linePoint(
          xOffset + (cos(i)* i),
          yOffset + (sin(i)* i),
          false)
          );
    }
}
