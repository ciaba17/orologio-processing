import ddf.minim.*;

// ----- Variabili per le immagini -----
PImage hand, clock, bird; // Immagini per le lancette e l'orologio

// ----- Variabili per la rotazione delle lancette (in radianti) -----
float rotationS, rotationM, rotationH;

// ----- Variabili per l'orario -----
int s, m, h;
int addTime;

// ----- Variabili per il pulsante di attivazione/disattivazione dell'orario di sistema -----
int systemTimeButtonPosX, systemTimeButtonPosY;
int systemTimeButtonSizeX, systemTimeButtonSizeY;
boolean systemTime;
boolean sliderTime;
int buttonColor[];

// ----- Variabili per la gestione delle dimensioni -----
float clockSize;
float birdSize;
int lastWidth, lastHeight;

// ----- Variabili per il tempo a schermo dell'uccellino -----
int birdDuration;
int startTime;
boolean drawingBird;

// ----- Variabili per l'audio -----
Minim minim;
AudioPlayer cuckooSound;

// ----- Variabili per lo slider -----
int secSliderPosX1;
int secSliderPosX2;
int secSliderPosY;

int minSliderPosX1;
int minSliderPosX2;
int minSliderPosY;

int circlePosition[];
int lastCirclePosition[];
