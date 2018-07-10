float[][] drawCircle(float r_mm)
{
    float[][] coords = new float[37][2];
    int c = 0;
    
    for (int i = 0; i < 180; i+= 10)
    {
        coords[c][0] = cos(radians(i))*r_mm;
        coords[c][1] = sin(radians(i))*r_mm;
        c++;
    }
    
    for (int i = 0; i < 180; i+= 10)
    {
        coords[c][0] = -cos(radians(i))*r_mm;
        coords[c][1] = -sin(radians(i))*r_mm;
        c++;
    }
    
    coords[36][0] = cos(0)*r_mm;
    coords[36][1] = sin(0)*r_mm;
    
    return coords;
}

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
          pointMap.add(new linePoint(x,y + map(lum,0,255,20,0), false));
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
          pointMap.add(new linePoint(x,y + map(lum,0,255,20,0), false));
          pointMap.add(new linePoint(x-2,y, false));
        }
        else if (pointMap.size() > 0)
        {
          pointMap.get(pointMap.size()-1).liftPen = true;
        }
    }
  }
}
