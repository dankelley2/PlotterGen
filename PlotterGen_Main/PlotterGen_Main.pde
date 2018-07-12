float X_WIDTH = 200;
float Y_HEIGHT = 100;
int RESOLUTION_X = 65;
int RESOLUTION_Y = 80;

String IMG_PATH = "img\\skull.jpg";
String OUTPUT_FILE_NAME = "output\\skull.txt";

String SHADING = "SQUIGGLE";
//SPIRAL
//SQUIGGLE

///////////////////////////////////////
// System assumes X+ is right, and Y+ is down
// All output values are in integers ((float mm * 100) parsed to int)
//  this keeps things simple and accurage on the arduino side without having to send floats over serial
//  
// PARAMS:
//  
//  X_WIDTH / Y_HEIGHT are the width and height of your draw area in millimeters.
//  
//  RESOLUTION_X / Y is the number of total scan lines on the x and y axis of your photo
//  
//  IMG_PATH is the path to your image file (backslash must be escaped)
//  
//  OUTPUT_FILE_NAME is the name of your output file (you don't say!)
//   This will save in the sketch folder by default
//  
// CONTROLS:
//  
//  Dragging with the mouse buttons will move 
//   your image among the free space on the canvas.
//  
//  Pressing space will toggle viewing the line drawing process
//  Pressing t will toggle viewing the travel lines
//  Pressing i will toggle viewing the loaded image
//  Pressing Enter or Return will save an output file
// 
///////////////////////////////////////

//Other vaiables
PImage img;
int[] imgOffset = {0,0};
boolean viewProgress = false;
boolean viewTravel = true;
boolean viewImage = true;

ArrayList<linePoint> pointMap = new ArrayList();
drawBot myBot = new drawBot(X_WIDTH,Y_HEIGHT);

float viewScale;
int WIN_WIDTH = 1000;
int WIN_HEIGHT = 600;
float padding = 25;


void settings()
{
  viewScale = WIN_WIDTH/X_WIDTH;
  size(WIN_WIDTH + int(padding * 2), int((Y_HEIGHT * viewScale) + (padding * 2)));
}

void setup()
{
  img = loadImage(IMG_PATH);
  ResizeImage_FitContainer(img, myBot.w, myBot.h, viewScale);
  background(255);
  smooth();
  fill(100);
  stroke(0);
  reShade();
}

void mousePressed()
{
  imgGrab.grabbing = true;
  imgGrab.startCoords[0] = mouseX;
  imgGrab.startCoords[1] = mouseY;
}

void mouseReleased()
{
  imgGrab.grabbing = false;
  int newXOffset = imgOffset[0] + (mouseX - imgGrab.startCoords[0]);
  int newYOffset = imgOffset[1] + (mouseY - imgGrab.startCoords[1]);
  if (myBot.wDisplay() - img.width > 0)
  {
    imgOffset[0] = newXOffset;
  }
  if (myBot.hDisplay() - img.height > 0)
  {
    imgOffset[1] = newYOffset;
  } 
  reShade();
}

void reShade()
{
  if (SHADING == "SPIRAL")
  {
    generateLines_Spiral();
  }
  else if (SHADING == "SQUIGGLE")
  {
    generateLines_Squiggle();
  }
  else if (SHADING == "OFFSET")
  {
    generateLines_Offset();
  }
}

void keyPressed()
{
  if (key == RETURN || key == ENTER)
  {
    exportFile();
  }
  if (key == ' ')
  {
    viewProgress = !viewProgress;
  }
  if (key == 't')
  {
    viewTravel = !viewTravel;
  }
  if (key == 'i')
  {
    viewImage = !viewImage;
  }
}

void draw()
{
  translate(padding,padding);
  drawBackground();
  if (viewImage)
  {
    drawMyImg();
  }
  drawPointMap(viewTravel);
}
