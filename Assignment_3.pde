boolean inTitleScreen = true;
int difficulty = 0;
int screen = 0;
char currentLetter = 'A';
char[] easyLetters = {'a', 'w'};
char[] mediumLetters = {'t','e', 't', 'y'};
char[] hardLetters = {'q', 'w', 'e', 'r', 't', 'y'};



void setup () {
  size(700,450);
}

void draw () {
  // screen 1 is the main menu screen and screen 2 is the game area
  if (screen == 1) {
    if (inTitleScreen) {
    background(25,28,100);
  
    fill(255,255,255);
    textSize(40);
    text("Typing Test . Select a difficulty", 100, 70);
  
    fill(0, 155, 0);
    rect(80,250,130,50);
    textSize(30);
    fill(255,255,255);
    text("Easy", 115, 290);
  
    fill(255, 170, 0);
    rect(280,250,130,50);
    textSize(30);
    fill(255,255,255);
    text("Medium", 295, 290);
  
    fill(200, 0, 0);
    rect(480,250,130,50);
    textSize(30);
    fill(255,255,255);
    text("Hard", 515, 290);
  }
 } else if (screen == 2) {
  background(100,100,200);
}
  


void mousePressed () {
  int easyMinX = 80;
  int easyMaxX = easyMinX + 130;
  int easyMinY = 250;
  int easyMaxY = easyMinY + 50;
  if (mouseX >= easyMinX && mouseX <= easyMaxX && mouseY >= easyMinY && mouseY <= easyMaxY) {
   screen == 2;
  inTitleScreen = false;
  println("Easy mode selected");
  

  
  }
  
  int mediumMinX = 280;
  int mediumMaxX = mediumMinX + 130;
  int mediumMinY = 250;
  int mediumMaxY = mediumMinY + 50;
  if (mouseX >= mediumMinX && mouseX <= mediumMaxX && mouseY >= mediumMinY && mouseY <= mediumMaxY) {
  inTitleScreen = false;
  println("Medium mode selected");
  background(49,102,80);
  textSize(50);
  }
  
  int hardMinX = 480;
  int hardMaxX = hardMinX + 130;
  int hardMinY = 250;
  int hardMaxY = hardMinY + 50;
  if (mouseX >= hardMinX && mouseX <= hardMaxX && mouseY >= hardMinY && mouseY <= hardMaxY) {
  inTitleScreen = false;
  println("Hard mode selected");
  background(245,64,33);
  textSize(50);
  }
}
