import ddf.minim.*;

void setup() 
{
  size(1200, 800, P2D);
  surface.setResizable(true); // La finestra può essere ridimensionata
  frameRate(60);

  imageMode(CENTER); // Imposta il riferimento al centro dell'immagine
  textAlign(CENTER, CENTER);

  // Carica le immagini
  hand = loadImage("../sprites/hand.png");
  clock = loadImage("../sprites/clock.png");
  bird = loadImage("../sprites/bird.png");
  
  // Carica i wallpaper
  wallpaper[0] = loadImage("../sprites/wallpapers/wallpaper0.jpg");
  wallpaper[1] = loadImage("../sprites/wallpapers/wallpaper1.jpg");
  wallpaper[2] = loadImage("../sprites/wallpapers/wallpaper2.jpg");
  wallpaper[3] = loadImage("../sprites/wallpapers/wallpaper3.jpg");

  // Carica i suoni
  minim = new Minim(this);
  cuckooSound = minim.loadFile("../sounds/cucu.mp3");
  tickingSound = minim.loadFile("../sounds/ticking.mp3");
  
}


void draw() 
{
  image(wallpaper[wallpaperNumber], width/2, height/2, width, height);
  
  update();
  
  drawClock();
  drawHands();
  drawButton("System time", systemTimeButtonPosX, systemTimeButtonPosY, systemTimeButtonSizeX, systemTimeButtonSizeY, systemTimeButtonColor);
  drawButton("Change wallpaper", systemTimeButtonPosX, wallpaperButtonPosY, systemTimeButtonSizeX, systemTimeButtonSizeY, wallpaperButtonColor);
  
  drawSlider(secSliderPosX1, secSliderPosX2, secSliderPosY, circlePosition, 0);
  drawSlider(minSliderPosX1, minSliderPosX2, minSliderPosY, circlePosition, 1);  
  
  drawBird();
}


void update() 
{
  sizeChange(); // definita in utility
  
  handLogic(); // definita in utility
  
  addTime(); // definita in utility
    
}
