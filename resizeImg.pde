PImage ResizeImage_FitContainer(PImage image, float containerWidth_mm, float containerHeight_mm, float viewScale)
{
  int maxWidth_Pixels = int(containerWidth_mm * viewScale);
  int maxHeight_Pixels = int(containerHeight_mm * viewScale);

  int newWidth_Pixels;
  int newHeight_Pixels;
  if (image.width == 0 || image.height == 0) { return null; } // return null if one dimension is 0

  if ((float)image.width / (float)image.height > (float)maxWidth_Pixels / (float)maxHeight_Pixels)
  {
      newWidth_Pixels = maxWidth_Pixels;
      newHeight_Pixels = image.height * int((float)newWidth_Pixels / (float)image.width);
  }
  else if ((float)image.width / (float)image.height < (float)maxWidth_Pixels / (float)maxHeight_Pixels)
  {
      newHeight_Pixels = maxHeight_Pixels;
      newWidth_Pixels = image.width * int((float)newHeight_Pixels / (float)image.height);
  }
  else
  {
      newWidth_Pixels =  (maxHeight_Pixels < maxWidth_Pixels) ? maxHeight_Pixels : maxWidth_Pixels;
      newHeight_Pixels = (maxHeight_Pixels < maxWidth_Pixels) ? maxHeight_Pixels : maxWidth_Pixels;
  }

  image.resize(newWidth_Pixels, newHeight_Pixels);
  
  return image;
}

int[] ResizePx_FitContainer(int w, int h, int newW, int newH)
{

  int newWidth_Pixels;
  int newHeight_Pixels;
  
  if (w == 0 || h == 0) { return null; } // return null if one dimension is 0

  if ((float)w / (float)h > (float)newW / (float)newH)
  {
      newWidth_Pixels = newW;
      newHeight_Pixels = h * int((float)newWidth_Pixels / (float)w);
  }
  else if ((float)w / (float)h < (float)newW / (float)newH)
  {
      newHeight_Pixels = newH;
      newWidth_Pixels = w * int((float)newHeight_Pixels / (float)h);
  }
  else
  {
      newWidth_Pixels =  (newH < newW) ? newH : newW;
      newHeight_Pixels = (newH < newW) ? newH : newW;
  }

  return new int[] {newWidth_Pixels, newHeight_Pixels};
}
