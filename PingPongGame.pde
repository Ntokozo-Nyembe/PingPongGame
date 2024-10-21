// Variables for the ball
float x, y;    // Position of the ball
float xSpeed, ySpeed; // Speed of the ball
float ballRadius = 20; // Radius of the ball

// Variables for the paddle
float paddleWidth = 100;
float paddleHeight = 20;
float paddleX; // X position of the paddle
float paddleY; // Y position of the paddle

// Game variables
int score = 0;
boolean gameOver = false;

//variable for display
int display = 0;



void setup() {
  size(800, 600); // Set the size of the window

  resetGame();
  
}

void draw() {
  
  background(255); // Clear the screen with a white background
  if(display >0){
    
    
  // If the game is over, display message
  if (gameOver) {
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("Game Over!", width / 2, height / 2);
    textSize(16);
    text("Score: " + score, width / 2, height / 2 + 30);
    return; // Exit draw to stop further processing
  }

  // Update the position of the ball
  x += xSpeed;
  y += ySpeed;

  // Check for collision with the walls
  if (x < ballRadius || x > width - ballRadius) {
    xSpeed *= -1; // Reverse the horizontal direction
  }
  if (y < ballRadius) {
    ySpeed *= -1; // Reverse the vertical direction
  }
  // Check for collision with the bottom wall
  if (y > height - ballRadius) {
    gameOver = true; // Game over if the ball hits the bottom wall
  }

  // Check for collision with the paddle
  if (y + ballRadius > paddleY && x > paddleX && x < paddleX + paddleWidth) {
    ySpeed *= -1; // Reverse the vertical direction
    score++; // Increase the score
  }

  // Draw the ball
  fill(127, 34, 255); // Set color for the ball
  ellipse(x, y, ballRadius * 2, ballRadius * 2); // Draw the ball

  // Draw the paddle
  fill(50, 150, 220); // Set color for the paddle
  rect(paddleX, paddleY, paddleWidth, paddleHeight); // Draw the paddle
  
  // Display score
  fill(0);
  textSize(16);
  text("Score: " + score, 30, 30);
  } 
  
  else{
    fill(255,100,150);
    background(209);
    textSize(50);
    text("WELCOME TO THE GAME", 100,100);
    text("CLICK ANYWHERE TO START", 100,300);
  }
}

void mouseMoved() {
  // Move the paddle with the mouse
  paddleX = mouseX - paddleWidth / 2;
  
  // Keep paddle within bounds
  paddleX = constrain(paddleX, 0, width - paddleWidth);
}

void resetGame() {
  // Reset ball position and speed
  x = width / 2;
  y = height / 2;
  xSpeed = random(2, 5);
  ySpeed = random(2, 5);
  
  // Reset paddle position
  paddleX = width / 2 - paddleWidth / 2;
  paddleY = height - 50; // Set paddle a bit above bottom
  score = 0; // Reset score
  gameOver = false; // Reset game over state
}

void mousePressed() {
  // Restart the game if it's over
  if (gameOver) {
    resetGame();
  }
}

void mouseClicked(){
  display += 1;
}
