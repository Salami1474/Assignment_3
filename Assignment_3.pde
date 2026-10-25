//Used AI for most of my comments
boolean inTitleScreen = true; // Checks if the main menu is showing
int difficulty; // Stores the selected difficulty
int screen = 0; // 0 = menu, 1 = Easy, 2 = Medium, 3 = Hard

char currentLetter = 'A'; // The letter the player must type
String letterOptions;
String messageY = "That's Correct!"; // Correct-answer message
String messageN = "That's wrong"; // Wrong-answer message
String mainMenu = "Press the key 'M' to go back to the main menu page"; // Used to display the key users can use to go back to main menu
String youWin = "You pass this round! Press 'M' to choose a new difficulty!"; // Displayed when the user hits the score limit

int correctAnswers = 0; // Counts correct answers
boolean gameOver = false; // Tracks whether the game is over
boolean answered = false; // Tracks whether an answer was given
int score = 0; // Stores the player's score
boolean levelFinished = false; // Stops typing when the score reaches 2150



// Coordinates for the Easy button
int easyMinX = 80;
int easyMaxX = easyMinX + 130;
int easyMinY = 250;
int easyMaxY = easyMinY + 50;

// Coordinates for the Medium button
int mediumMinX = 280;
int mediumMaxX = mediumMinX + 130;
int mediumMinY = 250;
int mediumMaxY = mediumMinY + 50;

// Coordinates for the Hard button
int hardMinX = 480;
int hardMaxX = hardMinX + 130;
int hardMinY = 250;
int hardMaxY = hardMinY + 50;

int correctWrongStartTime = 0; // Records when the answer message starts
boolean showMessage = false; // Controls whether the answer message appears

color gameBg; // Stores the game's background colour

void setup() {
  size(700, 450); // Sets the game window size
}

void draw() {

  // Screen 0 displays the main menu
  if (screen == 0) {
    if (inTitleScreen) {
      background(25, 28, 100); // Sets the menu background
      textAlign(LEFT, BASELINE);
      textSize(40);

      fill(255, 255, 255);
      text("Typing Test . Select a difficulty", 100, 70);

      // Draw the Easy button
      fill(0, 155, 0);
      rect(easyMinX, easyMinY, 130, 50);
      textSize(30);
      fill(255, 255, 255);
      text("Easy", 115, 290);

      // Draw the Medium button
      fill(255, 170, 0);
      rect(mediumMinX, mediumMinY, 130, 50);
      textSize(30);
      fill(255, 255, 255);
      text("Medium", 295, 290);

      // Draw the Hard button
      fill(200, 0, 0);
      rect(hardMinX, hardMinY, 130, 50);
      textSize(30);
      fill(255, 255, 255);
      text("Hard", 515, 290);
    }

  // Screen 1 displays Easy mode
  } else if (screen == 1) {
    background(gameBg);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("Typing Test", 350, 70);
    textSize(35);
    text("Difficulty Level: Easy", 350, 150);
    textSize(30);
    text("Type the letter below: ", 350, 250);
    textSize(70);
    text(currentLetter, 350, 400);

  // Screen 2 displays Medium mode
  } else if (screen == 2) {
    background(gameBg);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("Typing Test", 350, 70);
    textSize(35);
    text("Difficulty Level: Medium", 350, 150);
    textSize(30);
    text("Type the letter below: ", 350, 250);
    textSize(70);
    text(currentLetter, 350, 400);

  // Screen 3 displays Hard mode
  } else if (screen == 3) {
    background(gameBg);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("Typing Test", 350, 70);
    textSize(35);
    text("Difficulty Level: Hard", 350, 150);
    textSize(30);
    text("Type the letter below: ", 350, 250);
    textSize(70);
    text(currentLetter, 350, 400);
  }

  // Display the correct/wrong message for half a second
  if (showMessage && (screen == 1 || screen == 2 || screen == 3)) {
    if (millis() - correctWrongStartTime < 500) {
      textAlign(CENTER, CENTER);
      textSize(25);
      fill(255, 255, 255);
      text(messageY, 350, 300);
    } else {
      showMessage = false; // Hide the message after half second
    }
  }

  // Display the score and menu instructions during gameplay
  if (screen == 1 || screen == 2 || screen == 3) {
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255, 255, 255);
    text("Score: " + score, 350, 200);
    text(mainMenu, 350, 20);
  }

  // Display the winning message only on a game screen
  if (levelFinished && (screen == 1 || screen == 2 || screen == 3)) {
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(youWin, 350, 340);
  }
}

void mousePressed() {

  // Set the initial background colour
  gameBg = color(100, 100, 200);

  // Check whether the Easy button was clicked
  if (mouseX >= easyMinX && mouseX <= easyMaxX && mouseY >= easyMinY && mouseY <= easyMaxY) {

    inTitleScreen = false; // Hide the main menu
    difficulty = 1; // Select Easy
    screen = 1; // Open the Easy screen
    score = 0; // Reset the score
    correctAnswers = 0; // Reset correct answers
    levelFinished = false; // Allow keyboard input again
    showMessage = false; // Hide any old answer message
    currentLetter = 'A'; // Set the starting letter

    println("Easy mode selected");
    println("Difficulty is: " + difficulty);
  }

  // Check whether the Medium button was clicked
  if (mouseX >= mediumMinX && mouseX <= mediumMaxX && mouseY >= mediumMinY && mouseY <= mediumMaxY) {

    inTitleScreen = false;
    screen = 2; // Open the Medium screen
    difficulty = 2;
    score = 0;
    correctAnswers = 0;
    levelFinished = false;
    showMessage = false;
    gameBg = color(200, 0, 200);

    println("Medium mode selected");
    println("Difficulty is: " + difficulty);

    // Randomly choose one of four Medium letters
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

  // Check whether the Hard button was clicked
  if (mouseX >= hardMinX && mouseX <= hardMaxX && mouseY >= hardMinY && mouseY <= hardMaxY) {

    inTitleScreen = false;
    screen = 3; // Open the Hard screen
    difficulty = 3;
    score = 0;
    correctAnswers = 0;
    levelFinished = false;
    showMessage = false;
    gameBg = color(100, 200, 0);

    println("Hard mode selected");
    println("Difficulty is: " + difficulty);

    // Randomly choose one of six Hard letters
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

  // Press M to return to the main menu
  if (key == 'M' || key == 'm') {
    screen = 0; // Return to the menu screen
    inTitleScreen = true;
    difficulty = 0;
    correctAnswers = 0;
    gameOver = false;
    answered = false;
    score = 0; // Reset the score
    levelFinished = false; // Reset the finished state
    showMessage = false; // Hide any old answer message
    return; // Stop running the rest of this method
  }

  // Ignore all other keys after the level is completed
  if (levelFinished) {
    return; // Exit without changing the score or letter
  }

  // Only accept typing input while a level is active
  if (screen == 1 || screen == 2 || screen == 3) {

    // Check whether the player typed the correct letter
    // Both uppercase and lowercase letters are accepted
    if (key == currentLetter ||
        key == Character.toLowerCase(currentLetter)) {

      messageY = "That's Correct!";
      gameBg = color(0, 200, 0); // Change background to green
      score = score + 1; // Add one point
      correctAnswers++; // Count the correct answer

      // Generate a new random letter for Easy mode
      if (screen == 1) {
        int easyLetters = int(random(2));

        if (easyLetters == 0) {
          currentLetter = 'A';
        } else {
          currentLetter = 'W';
        }

      // Generate a new random letter for Medium mode
      } else if (screen == 2) {
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

      // Generate a new random letter for Hard mode
      } else if (screen == 3) {
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

    } else {
      // The player typed the wrong letter
      messageY = "That's Wrong!";
      gameBg = color(230, 0, 0); // Change background to red
      score = 0; // Reset the score after a wrong answer
    }

    // Start the one-second answer-message timer
    correctWrongStartTime = millis();
    showMessage = true;
  }
  // Finish the level when the score reaches 150
  if (score >= 150) {
    levelFinished = true; // Stop accepting further typing input
  }
}
