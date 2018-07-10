void drawBackground()
{
  background(255);
  //Draw frame
  stroke(200,50,50);
  noFill();
  rect(-1,-1, myBot.wDisplay()+2, myBot.hDisplay()+2);
  stroke(0);
}

void drawMyImg()
{
  if (imgGrab.grabbing)
  {
     pushMatrix();
     translate(mouseX - imgGrab.startCoords[0], mouseY - imgGrab.startCoords[1]);
     image(img,imgOffset[0],imgOffset[1]);
     popMatrix();
  }
  else
  {
     image(img,imgOffset[0],imgOffset[1]);
  }
}

void drawPointMap()
{
  int progress = int(map(mouseX,0,width,0,pointMap.size()));
  //clamp values
  progress = max(min(pointMap.size(), progress),0);
  for (int i = 1; i < pointMap.size(); i++)
  {
    stroke(0);
    if (viewProgress)
    {
      if (i == progress)
        stroke(0,0,255);
      else if (i > progress)
        stroke(0,255,0);
    }
    
    linePoint p0 = pointMap.get(i-1);
    linePoint p1 = pointMap.get(i);
    if (p0.liftPen)
    {
      stroke(200,200,200);
    }
    line(imgOffset[0]+p0.x, imgOffset[1]+p0.y, imgOffset[0]+p1.x, imgOffset[1]+p1.y);
  }  
}
