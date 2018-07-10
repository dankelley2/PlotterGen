void exportFile()
{
  StringList output = new StringList();
  
  for(int i = 0;i < pointMap.size(); i++)
  {
    linePoint p0 = pointMap.get(i);
    output.append("MA " + str(int(((p0.x+imgOffset[0])/viewScale)*100)) + " " + str(int(((p0.y+imgOffset[1])/viewScale)*100)));
    if (p0.liftPen)
    {
      output.append("LIFT");
    }
  }
  saveStrings(OUTPUT_FILE_NAME,output.array());
}
