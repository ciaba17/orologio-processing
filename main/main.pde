import ddf.minim.*;

void setup() 
{
  size(1200, 800, P2D);
  surface.setResizable(true); // La finestra può essere ridimensionata
  frameRate(60);

  imageMode(CENTER); // Imposta il riferimento al centro dell'immagine
  textAlign(CENTER, CENTER); // Imposta il riferimento al centro del testo

  // Carica le immagini
  hand = loadImage("../sprites/hand.png");
  clock = loadImage("../sprites/clock.png");
  bird = loadImage("../sprites/bird.png");
  
  // Carica i wallpaper
  wallpaper[0] = loadImage("../sprites/wallpapers/wallpaper0.jpg");
  wallpaper[1] = loadImage("../sprites/wallpapers/wallpaper1.jpg");
  wallpaper[2] = loadImage("../sprites/wallpapers/wallpaper2.jpg");
  wallpaper[3] = loadImage("../sprites/wallpapers/wallpaper3.jpg");
  wallpaper[4] = loadImage("../sprites/wallpapers/wallpaper4.jpg");
  wallpaper[5] = loadImage("../sprites/wallpapers/wallpaper5.jpg");
  wallpaper[6] = loadImage("../sprites/wallpapers/wallpaper6.jpg");
  wallpaper[7] = loadImage("../sprites/wallpapers/wallpaper7.jpg");

  
  
  

  // Carica i suoni
  minim = new Minim(this);
  cuckooSound = minim.loadFile("../sounds/cucu.mp3");
  tickingSound = minim.loadFile("../sounds/ticking.mp3");
  
}


void draw() 
{
  image(wallpaper[wallpaperNumber], width/2, height/2, width, height); //disegna lo sfondo
  
  update();
  
  
  // Disegna la legenda dei tasti
  fill(0, 0, 0);
  textAlign(LEFT, CENTER);
  textSize(width/25);
  text(" Muovi gli slider per\n cambiare minuti\n e secondi\n\n Z = +secondi\n X = +minuti \n C = +ore\n V = -secondi\n B = -minuti\n N = -ore", width*6/9, height*5/8);
  textAlign(CENTER, CENTER); 
  
  
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
