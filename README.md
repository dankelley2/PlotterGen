# PlotterGen
Processing sketch that generates line art for use with a 2.5 axis (2 axis + z lift) draw bot
<img src="https://user-images.githubusercontent.com/21973290/42578037-b34712b8-84f3-11e8-9004-539feefc3ab0.png" width="75%">
<img src="https://user-images.githubusercontent.com/21973290/42592081-8409aa9c-8516-11e8-8b72-c117e5607a2a.png" width="75%">

## Usage
```
///////////////////////////////////////
// System assumes X+ is right, and Y+ is down
// All output values are in integers ((float mm * 100) parsed to int)
//  this keeps things simple and accurage on the arduino side without having to send floats over serial
//  
// SCRIPT PARAMS:
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
```
