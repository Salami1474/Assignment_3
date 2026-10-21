boolean inTitleScreen = true;
char currentLetter = 'A';
char[] easyLetters = {'a', 'w'};


void setup () {
  size(700,450);
}

void draw () {
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
}

void mousePressed () {
  int easyMinX = 80;
  int easyMaxX = easyMinX + 130;
  int easyMinY = 250;
  int easyMaxY = easyMinY + 50;
  if (mouseX >= easyMinX && mouseX <= easyMaxX && mouseY >= easyMinY && mouseY <= easyMaxY) {
  inTitleScreen = false;
  println("Easy mode selected");
  background(100,100,200);

  
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
