//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {
int snakeX;
int snakeY;
//Add x and y member variables. They will hold the corner location of each segment of the snake.


// Add a constructor with parameters to initialize each variable.
Segment(int snakex, int snakey){
 snakeX = snakex;
 snakeY = snakey;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
int foodX;
int foodY;




//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500,500);
head = new Segment(250,250);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
foodX = ((int)random(50)*10);
foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0,0,0);
  drawFood();
    move();
  drawSnake();
eat();
}

void drawFood() {
  //Draw the food
  fill(235, 52, 52);
  rect(foodX,foodY,10,10);
  
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(22, 255, 5);
  rect(head.snakeX,head.snakeY,10,10);
}

int direction = UP;
int foodEaten = 0;
//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for(int i = 0; i<foodEaten;i++){
 rect(i*10,head.snakeY ,10,10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
 if (key == CODED) {
    if (keyCode == UP) {
      direction = UP;
    } else if (keyCode == DOWN) {
     direction = DOWN;
    } 
  } else if(keyCode == RIGHT){
      println("right");
    direction = RIGHT;
  }
  else if(keyCode == LEFT){
       println("left");
   direction = LEFT; 
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
   
  switch(direction) {
  case UP:
    // move head up here 
   head.snakeY--;
    break;
  case DOWN:
    // move head down here 
   head.snakeY++;
    break;
  case LEFT:
   // figure it out 
   head.snakeX--;
    break;
  case RIGHT:
    // mystery code goes here 
   head.snakeX++;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.snakeX == width){
  head.snakeX = 0;
 }
 else if(head.snakeY== height){
  head.snakeY =0; 
 }
 else if(head.snakeX == 0){
  head.snakeX = width;
 }
 else if(head.snakeY==0){
  head.snakeY = height; 
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.snakeX == foodX && head.snakeY == foodY){
  foodEaten++;
  drawFood();
}
}
