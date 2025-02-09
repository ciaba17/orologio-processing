void setup() 
{
  size(1200, 800, P2D);
  surface.setResizable(true); // La finestra può essere ridimensionata
  frameRate(60); //Blocca il framerate a 60
    
  imageMode(CENTER); // Imposta il riferimento al centro dell'immagine
  
  addTime = 0;
  lastWidth = 0;
  lastHeight = 0;
  systemTime = false; // Inizialmente il pulsante è disattivato (non usa l'orario di sistema)

  // Carica le immagini
  hand = loadImage("../sprites/hand.png");
  clock = loadImage("../sprites/clock.png");
  bird = loadImage("../sprites/bird.png");
  
  buttonColor = new int[] {255, 255, 255}; // Colore iniziale del pulsante (bianco)
    
  birdDuration = 3000; // In millisecondi
  drawingBird = false;

  // Carica il suono
  minim = new Minim(this);
  cuckooSound = minim.loadFile("../sounds/cucu.mp3");
  
  
  sliderTime = false;
}


void draw() 
{
  background(247);
  update();
  
  drawClock();
  drawHands();
  drawButton();
  
  drawSlider(secSliderPosX1, secSliderPosX2, secSliderPosY, circlePosition, 0);
  drawSlider(minSliderPosX1, minSliderPosX2, minSliderPosY, circlePosition, 1);
  drawSlider(hourSliderPosX1, hourSliderPosX2, hourSliderPosY, circlePosition, 2);
  
  drawBird();  
}


void update() 
{  
  if (!drawingBird)
    startTime = millis();
  
  sizeChange(); // definita in utility
  
  handLogic(); // definita in utility
  
  addTime(); // definita in utility
    
}
