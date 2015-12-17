int filecounter;
float cocounter;
float cocountermultiplier;
float counter; 
float drawresolution;
int pointsize;
float scale;
int rotationIterator; 
int rotation; 
int lastfunction; 

String function;
String analytics; 

float x;
float y;

void setup()
{
  background(255);
  size(800, 800);
  smooth();
  filecounter = 0;
  cocounter = 0.002;
}



void draw()
{  
  if (filecounter > 999) { 
    return;
  }
    
  if (lastfunction == 4) { lastfunction = 1; } else {lastfunction++;}

  translate(width/2, height/2);

  cocounter = cocounter + 0.0005;
  cocounter = cocounter*10000;
  cocounter = round(cocounter);
  cocounter = cocounter/10000;
  
  println("Cocounter = ", cocounter);
  
  filecounter++;
  println("A total of ", filecounter, " file(s) saved now.");

  background(255); 
  counter = 0; 

  drawresolution = 0.001; // 0.0001 is super high res 
  pointsize = 2; // 1 for points, larger integers for ellipses
  scale = 0.95; // How much of the screen should it take up?

  // generate one of each of rotations, then swap things around
  if (rotationIterator > 5) { 
    rotationIterator = 1;
  } 
  else { 
    rotationIterator++;
  }

  rotation = rotationIterator * 15; 

  scale = height * scale / 2;

  for (float loop = 0; loop < (1/drawresolution*TWO_PI*rotation); loop++) // If this line is uncommented, the sketch runs faster
  {
    rotate(radians(rotation));
    counter = counter + drawresolution; 

    x = sin(counter)*scale;
    y = sin(counter+HALF_PI)*scale;

    if (lastfunction == 1) 
    {
      x = x * sq(cos(cocounter*y)); function = "SQCOS";
    }
    else if (lastfunction == 2)
    {
      x = x * sq(sin(cocounter*y)); function = "SQSIN";
    }
    else if (lastfunction == 3)
    {
      x = x * sqrt(sin(cocounter*y)); function = "RTSIN";
    }
    else 
    {
      x = x * sqrt(cos(cocounter*y)); function = "RTCOS";
    }

    if (pointsize == 1) 
    { 
      point(x, y);
    }
    else
    { 
      ellipse(x, y, pointsize, pointsize);
    }
  } // end fastloop

  analytics = "Saved Files/Spirograph " + filecounter + " (Rot " + rotation  + " - Coc " + cocounter + " " + function + ")" + ".png"; 
  saveFrame(analytics);
} // end draw