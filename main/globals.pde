// ----- Variabili per le immagini -----
PImage hand, clock, bird;
PImage wallpaper[] = new PImage[8];
int wallpaperNumber = 0;


// ----- Variabili per la rotazione delle lancette (in radianti) -----
float rotationS = 0, rotationM = 0, rotationH = 0;
float fullRotationM = 0, fullRotationH = 0;

// ----- Variabili per l'orario -----
int s, m, h;
int addTime = 0;
boolean setSystemTime = false;

// ----- Variabili per il pulsante di attivazione/disattivazione dell'orario di sistema -----
int systemTimeButtonPosX, systemTimeButtonPosY;
int systemTimeButtonSizeX, systemTimeButtonSizeY;
boolean systemTime = false; // Inizialmente il pulsante è disattivato (non usa l'orario di sistema)
boolean sliderTime = false;
int systemTimeButtonColor[] = {255, 255, 255}; // Colore iniziale del pulsante (bianco);

// ----- Variabili per il pulsante di attivazione/disattivazione dei wallpaper -----
int wallpaperButtonPosY;
int wallpaperButtonColor[] = {255, 255, 255}; // Colore iniziale del pulsante (bianco);

// ----- Variabili per l'allarme -----
int alarmPosX;
int  alarmPosY;
int alarmSizeX, alarmSizeY;

// ----- Variabili per la gestione delle dimensioni -----
float clockSize;
float birdSize;
int lastWidth = 0, lastHeight = 0;

// ----- Variabili per il tempo a schermo dell'uccellino -----
int birdDuration = 3000; // In millisecondi
int startTime = -3000; // Per evitare che l'immagine venga disegnata i primi tre secondi
boolean drawingBird = false;

// ----- Variabili per l'audio -----
Minim minim;
AudioPlayer cuckooSound;
AudioPlayer tickingSound;

// ----- Variabili per lo slider -----
int secSliderPosX1;
int secSliderPosX2;
int secSliderPosY;

int minSliderPosX1;
int minSliderPosX2;
int minSliderPosY;

int circlePosition[];
int lastCirclePosition[];
