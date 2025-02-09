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
  // Se il mouse è sul pulsante e il sistema non usa l'orario di sistema,
  // attiva l'orario di sistema e cambia il colore del pulsante
  if (onSystemTimeButton() && !systemTime) 
  {
    systemTime = true;
    buttonColor = new int[] {200, 0, 0};
  }
  // Se il pulsante viene premuto e l'orario di sistema è attivo,
  // disattiva l'orario di sistema e ripristina il colore del pulsante
  else if (onSystemTimeButton() && systemTime) 
  {
    systemTime = false; 
    buttonColor = new int[] {255, 255, 255};
    
    // Reimposta il tempo a 0
    rotationS = 0;
    rotationM = 0;
    rotationH = 0;
  }
}
