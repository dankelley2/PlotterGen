class linePoint
{
  linePoint(float x, float y, boolean liftPen)
  {
    this.x = x;
    this.y = y;
    this.liftPen = liftPen;
  }
  
  float x;
  float y;
  boolean liftPen;
}

static class imgGrab
{
  static boolean grabbing = false;
  static int[] startCoords = {0,0};
}

class drawBot
{
  float w;
  float h;
  float wDisplay() {return myBot.w*viewScale;}
  float hDisplay() {return myBot.h*viewScale;}
  
  drawBot(float w, float h)
  {
    this.w = w;
    this.h = h;
  }
}
