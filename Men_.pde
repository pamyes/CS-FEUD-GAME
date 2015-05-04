int r=25+20+90;
void setup(){
size(600, 600);
}

void draw(){
  background(#F7819F);
  textSize(40);
  fill(255);
  text("Computer Science Feud", 70, 100);
  textSize(20);
  text("Level 1   Press: l", 70, 200);
  text("Level 2   Press: k", 70, 290);
  text("Level 3   Press m", 70, 380);
  textSize(50);
  text("Score "+r, 340, 500); 
}

