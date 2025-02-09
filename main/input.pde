void keyPressed() 
{
  // In modalità manuale, permetti l'avanzamento delle lancette tramite tasti
  if (!systemTime) 
  {
    switch (key) 
    {
      case 'z':
        addTime = 1;
        break;
      case 'x':
        addTime = 2;
        break;
      case 'c':
        addTime = 3;
        break;
    }
  }
}

void keyReleased() 
{
  if (!systemTime) 
  {
    switch (key) 
    {
      case 'z':
        addTime = 0;
        break;
      case 'x':
        addTime = 0;
        break;
      case 'c':
        addTime = 0;
        break;
    }
  }
}


void mousePressed() 
{
  // Attiva l'orario di sistema e cambia il colore del pulsante
  if (onButton(systemTimeButtonPosY) && !systemTime) 
  {
    systemTime = true;
    systemTimeButtonColor = new int[] {200, 0, 0};
  }
  // Disattiva l'orario di sistema e ripristina il colore del pulsante
  else if (onButton(systemTimeButtonPosY) && systemTime) 
  {
    systemTime = false; 
    systemTimeButtonColor = new int[] {255, 255, 255};
    
    // Reimposta il tempo a 0
    rotationS = 0;
    rotationM = 0;
    rotationH = 0;
  }
  
  // Cambia lo sfondo
  if (onButton(wallpaperButtonPosY))
  {
    wallpaperNumber++;
  }
}
