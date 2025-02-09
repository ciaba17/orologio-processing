void sizeChange()
{
  if (lastWidth != width)
  {
    systemTimeButtonPosX = width * 1/12;
    systemTimeButtonPosY = height * 1/12;
    systemTimeButtonSizeX = width / 6;
    systemTimeButtonSizeY = width / 24;
    
    clockSize = (clock.width/2) * (float(width)/610000); 
    birdSize = (bird.width/2) * (float(width)/610000); 
    
    secSliderPosX1 = width*4/6;
    secSliderPosX2 = secSliderPosX1 + 200;
    secSliderPosY = height * 1/7;
    
    minSliderPosX1 = width*4/6;
    minSliderPosX2 = hourSliderPosX1 + 200;
    minSliderPosY = height * 3/14;
    
    hourSliderPosX1 = width*4/6;
    hourSliderPosX2 = hourSliderPosX1 + 200;
    hourSliderPosY = height * 2/7;
  } 
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
      rotationS += radians(6);
    
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
    }
  }
  else if (sliderTime)
  {
     rotationS = radians(1.8 * (circlePosition[0] - secSliderPosX1));
     sliderTime = false;
  }
  
  else if (false)
  {
    // Modalità orario di sistema: le lancette seguono l'orario reale
    s = second();
    m = minute();
    h = hour();
    
    h = (h > 12) ? h - 12 : h; // Converte l'orario in formato AM/PM
    
    rotationS = s * radians(6);
    rotationM = m * radians(6);
    rotationH = h * radians(30);
    
    lastWidth = width;
    lastHeight = height;
  } 
}


void addTime()
{
  switch (addTime)
  {
  case 1:
    rotationS += radians(6);
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


boolean onSystemTimeButton() // Funzione per verificare se il mouse è all'interno dell'area del pulsante
{
  return ((mouseX > systemTimeButtonPosX) && (mouseX < systemTimeButtonPosX + systemTimeButtonSizeX) &&
          (mouseY > systemTimeButtonPosY) && (mouseY < systemTimeButtonPosY + systemTimeButtonSizeY));
}


boolean isOnSlider(int sliderPosY)
{
  return ((mouseX > secSliderPosX1) && (mouseX < secSliderPosX2) && 
  (mouseY > sliderPosY - 15) && (mouseY < sliderPosY + 15));
}
