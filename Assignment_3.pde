boolean inTitleScreen = true;
int difficulty;
int screen = 0;
char currentLetter = 'A';
String letterOptions;
String message = "";
int correctAnswers = 0;
boolean gameOver = false;

int startTime = 0;
int endTime = 0;

int easyMinX = 80;
int easyMaxX = easyMinX + 130;
int easyMinY = 250;
int easyMaxY = easyMinY + 50;

int mediumMinX = 280;
int mediumMaxX = mediumMinX + 130;
int mediumMinY = 250;
int mediumMaxY = mediumMinY + 50;

int hardMinX = 480;
int hardMaxX = hardMinX + 130;
int hardMinY = 250;
int hardMaxY = hardMinY + 50;



void setup () {
  size(700, 450);
}

void draw () {
  // screen 1 is the main menu screen and screen 2 is the game area
  if (screen == 0) {
    if (inTitleScreen) {
      background(25, 28, 100);

      fill(255, 255, 255);
      textSize(40);
      text("Typing Test . Select a difficulty", 100, 70);

      fill(0, 155, 0);
      rect(easyMinX, easyMinY, 130, 50);
      textSize(30);
      fill(255, 255, 255);
      text("Easy", 115, 290);

      fill(255, 170, 0);
      rect(mediumMinX, mediumMinY, 130, 50);
      textSize(30);
      fill(255, 255, 255);
      text("Medium", 295, 290);

      fill(200, 0, 0);
      rect(hardMinX, hardMinY, 130, 50);
      textSize(30);
      fill(255, 255, 255);
      text("Hard", 515, 290);
    }
  } else if (screen == 1) {
    background(100, 100, 200);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("Typing Test", 350, 70);
    textSize(35);
    text("Difficulty Level: Easy", 350, 150);
    textSize(30);
    text("Type the letter below: ", 350, 250);
    textSize(70);
    text(currentLetter, 350, 400);
    textSize(25);
  } else if (screen == 2) {
    background(200, 0, 200);
    textAlign(CENTER, CENTER);
    text("Typing Test", 350, 70);
    textSize(35);
    text("Difficulty Level: Medium", 350, 150);
    textSize(30);
    text("Type the letter below: ", 350, 250);
    textSize(70);
    text(currentLetter, 350, 400);
  } else if (screen  == 3) {
    background(100, 200, 0);
    textAlign(CENTER, CENTER);
    text("Typing Test", 350, 70);
    textSize(35);
    text("Difficulty Level: Hard", 350, 150);
    textSize(30);
    text("Type the letter below: ", 350, 250);
    textSize(70);
    text(currentLetter, 350, 400);
  }
}


void mousePressed() {


  if (mouseX >= easyMinX && mouseX <= easyMaxX && mouseY >= easyMinY && mouseY <= easyMaxY) {
    inTitleScreen = false;
    difficulty = 1;
    screen = 1;
    println("Easy mode selected");
    println("Difficulty is: " + difficulty);
  }




  if (mouseX >= mediumMinX && mouseX <= mediumMaxX && mouseY >= mediumMinY && mouseY <= mediumMaxY) {
    inTitleScreen = false;
    screen = 2;
    difficulty = 2;
    println("Medium mode selected");
    println("Difficulty is: " + difficulty);
    background(49, 102, 80);

    int mediumLetters = int(random(4));

    if (mediumLetters == 0) {
      currentLetter = 'K';
    } else if (mediumLetters == 1) {
      currentLetter = 'P';
    } else if (mediumLetters == 2) {
      currentLetter = 'Q';
    } else {
      currentLetter = 'Y';
    }
  }

  if (mouseX >= hardMinX && mouseX <= hardMaxX && mouseY >= hardMinY && mouseY <= hardMaxY) {

    inTitleScreen = false;
    screen = 3;
    difficulty = 3;
    println("Hard mode selected");
    println("Difficulty is: " + difficulty);
    background(245, 64, 33);
    textSize(50);

    int hardLetters = int(random(6));

    if (hardLetters == 0) {
      currentLetter = 'L';
    } else if (hardLetters == 1) {
      currentLetter = 'B';
    } else if (hardLetters == 2) {
      currentLetter = 'Q';
    } else if (hardLetters == 3) {
      currentLetter = 'Y';
    } else if (hardLetters == 4) {
      currentLetter = 'O';
    } else {
      currentLetter = 'I';
    }
  }
}

void keyPressed() {
  if (screen == 1) {
    if (key == currentLetter || key == Character.toLowerCase(currentLetter)) {
      int easyLetters = int(random(2));

      if (easyLetters == 0) {
        currentLetter = 'A';
      } else {
        currentLetter = 'W';
      }
    }
  } else if (screen == 2) {
    if (key == currentLetter || key == Character.toLowerCase(currentLetter)) {
      int mediumLetters = int(random(4));

      if (mediumLetters == 0) {
        currentLetter = 'K';
      } else if (mediumLetters == 1) {
        currentLetter = 'P';
      } else if (mediumLetters == 2) {
        currentLetter = 'Q';
      } else {
        currentLetter = 'Y';
      }
    }
  }
}
