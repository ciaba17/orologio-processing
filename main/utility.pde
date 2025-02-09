void sizeChange()
{
  if (lastWidth != width)
  {
    systemTimeButtonPosX = width * 1/12;
    systemTimeButtonPosY = height * 1/12;
    systemTimeButtonSizeX = width / 6;
    systemTimeButtonSizeY = width / 24;
    
    wallpaperButtonPosY = systemTimeButtonPosY + height*1/7;
    
    clockSize = (clock.width/2) * (float(width)/610000); 
    birdSize = (bird.width/2) * (float(width)/610000); 
    
    secSliderPosX1 = width*4/6;
    secSliderPosX2 = secSliderPosX1 + 196;
    secSliderPosY = height * 1/7;
    
    minSliderPosX1 = width*4/6;
    minSliderPosX2 = minSliderPosX1 + 196;
    minSliderPosY = height * 3/14;
    
    circlePosition = new int[] {secSliderPosX1, secSliderPosX1};
    lastCirclePosition = new int[] {secSliderPosX1, secSliderPosX1};
  } 
  
  lastWidth = width;
  lastHeight = height;
}


void handLogic()
{
  if (!systemTime && !sliderTime) 
  {
    // Modalità manuale: l'orologio avanza in base alla funzione second()
    int sPrecedente = s;
    s = second();
  
    // Se il secondo corrente è cambiato, aggiorna la rotazione della lancetta dei secondi
    if (s != sPrecedente)
    {
      rotationS += radians(6);
      tickingSound.rewind();
      tickingSound.play();
    }
    
    // Se la rotazione dei secondi ha raggiunto quasi il giro completo,
    // resetta la rotazione dei secondi e incrementa quella dei minuti
    if (degrees(rotationS) >= 354) 
    {
      rotationS = radians(0);
      rotationM += radians(6);
    }
    
    // Se la rotazione dei minuti ha raggiunto quasi il giro completo,
    // resetta la rotazione dei minuti e incrementa quella delle ore
    if (degrees(rotationM) >= 354) 
    {
      rotationM = radians(0);
      rotationH += radians(6);
      cuckooSound.rewind();
      cuckooSound.play();
      startTime = millis();
    }
  }
  else if (systemTime)
  {
    // Modalità orario di sistema: le lancette seguono l'orario reale
    
    int sPrecedente = s;

    s = second();
    m = minute();
    h = (hour() > 12) ? h - 12 : h; // Converte l'orario in formato AM/PM

    
    if (s != sPrecedente)
    {
      tickingSound.rewind();
      tickingSound.play();
    }
    
    
    rotationS = s * radians(6);
    rotationM = m * radians(6);
    rotationH = h * radians(30);
  } 
}


void sliderLogic(int sliderPosY, int circlePos[], int circleNumber)
{
  // Gestisce le posizioni dei cerchi
  if (isOnSlider(sliderPosY) && mousePressed && !systemTime)
  {
    lastCirclePosition[circleNumber] = circlePos[circleNumber];
    circlePos[circleNumber] = mouseX;
    sliderTime = true;
  }
  else
  {
    sliderTime = false; 
    circlePosition = new int[] {-1000, -1000};
    lastCirclePosition = new int[] {-1000, -1000};
  }
  
  // Sposta le lancette in base ai cerchi
  if (sliderTime && (circlePosition[0] != lastCirclePosition[0]))
  {
     rotationS = radians(1.8 * (circlePosition[0] - secSliderPosX1));
     tickingSound.rewind();
     tickingSound.play();
  }
  if (sliderTime && (circlePosition[1] != lastCirclePosition[1]))
  {
     rotationM = radians(1.8 * (circlePosition[1] - secSliderPosX1));
  }
}


void addTime()
{
  switch (addTime)
  {
  case 1:
    rotationS += radians(6);
    tickingSound.rewind();
    tickingSound.play();
    delay(100);
    break;
  case 2:
    rotationM += radians(6);
    delay(100);
    break;
  case 3:
    rotationH += radians(30);
    delay(200);
  } 
}


boolean onButton(int posY) // Funzione per verificare se il mouse è all'interno dell'area del pulsante
{
  return ((mouseX > systemTimeButtonPosX) && (mouseX < systemTimeButtonPosX + systemTimeButtonSizeX) &&
          (mouseY > posY) && (mouseY < posY + systemTimeButtonSizeY));
}



boolean isOnSlider(int sliderPosY)
{
  return ((mouseX > secSliderPosX1) && (mouseX < secSliderPosX2) && 
  (mouseY > sliderPosY - 20) && (mouseY < sliderPosY + 20));
}
