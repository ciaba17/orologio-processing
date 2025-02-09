void drawClock() {
  pushMatrix();
  translate(width/2, height/2 + clockSize*83.5);
  scale(clockSize);
  image(clock, 0, 0);
  popMatrix();
}


void drawHands() 
{  
  // Offset per il posizionamento delle immagini delle lancette
  float secHandSize = (hand.width/2) * (float(width)/5990000);
  float minHandSize = (hand.width/2) * (float(width)/7400000);
  float hourHandSize = (hand.width/2) * (float(width)/8900000);  
  
  // Disegna la lancetta dei secondi
  pushMatrix();
    translate(width / 2, height/2);
    rotate(rotationS);
    scale(secHandSize);
    image(hand, 0, -hand.height*0.284);
  popMatrix();
  
  // Disegna la lancetta dei minuti
  pushMatrix();
    translate(width / 2, height / 2);
    rotate(rotationM);
     scale(minHandSize);
    image(hand, 0, -hand.height*0.284);
  popMatrix();
  
  // Disegna la lancetta delle ore
  pushMatrix();
    translate(width / 2, height / 2);
    rotate(rotationH);
    scale(hourHandSize);
    image(hand, 0, -hand.height*0.284);
  popMatrix();
}


void drawButton()
{
  // Disegna il pulsante
  stroke(0);
  fill(buttonColor[0], buttonColor[1], buttonColor[2]);
  strokeWeight(systemTimeButtonSizeY/20);

  rect(systemTimeButtonPosX, systemTimeButtonPosY, systemTimeButtonSizeX, systemTimeButtonSizeY, systemTimeButtonSizeY / 1.8);
  
  // Disegna il testo
  fill(0, 0, 0);
  textSize(systemTimeButtonSizeX / 7.4);
  text("orario di sistema", 
  systemTimeButtonPosX * 1.043, 
  systemTimeButtonPosY + systemTimeButtonSizeY * 0.7);
}


void drawSlider(int sliderPosX1, int sliderPosX2, int sliderPosY, int circlePosition[], int circleNumber)
{
  // Disegna lo slider
  strokeWeight(15);
  stroke(230,0,0);
  line(sliderPosX1, sliderPosY, sliderPosX2, sliderPosY);
  
  strokeWeight(8);
  stroke(255,135,0);
  line(sliderPosX1, sliderPosY, sliderPosX2, sliderPosY);
  
  if (isOnSlider(sliderPosY) && mousePressed && !systemTime)
  {
    sliderTime = true;
    circlePosition[circleNumber] = mouseX;
  }
  
  // Disegna il cerchio
  strokeWeight(0);
  fill(230,0,0);
  circle(circlePosition[circleNumber],sliderPosY,20);
}


void drawBird()
{
  if (degrees(rotationM) >= 354 || drawingBird) 
  {
    if (millis() - startTime < birdDuration)
    {
      pushMatrix();
      translate(width / 2, height / 2 - birdSize*600);
      scale(birdSize);
      image(bird, 0, 0);
      popMatrix();
      
      drawingBird = true;
    }
    else
      drawingBird = false;
  }
}
