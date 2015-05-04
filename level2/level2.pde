import java.awt.*;
import javax.swing.*;
int r=0;
void setup(){
  size(600,600);
}

void draw(){
  background(0);
  sandq();
  String ins="Press q to see the instructions";
  String ins2="Each question is worth 10 points";
  String ins3="Press from 1 to 4 to see the questions";
  textSize(32);
  fill(255);
  text("Score "+r, 30, 550); 
  textSize(20);
  text(ins, 170, 200);
  text(ins2, 150, 230);
  text(ins3, 120, 260);

}
void sandq(){
  int al=0;
  color[] coStack={#D8F781,#81DAF5,#9F81F7,#F7819F};
  color[] coQueue={#B4045F,#5F04B4,#045FB4,#04B45F};
  for(int i=0;i<4;i++){
  fill(coStack[i]);
  rect(40, 81+al, 63, 63);
  al=al+63;
  }
  for(int i=0;i<4;i++){
   fill(coQueue[i]);
   ellipse(550, -150+al, 72, 72);
   al=al+72;
  }
}
void keyPressed(){
if(key=='q'){
    JOptionPane.showMessageDialog(null,"The Left Figure represents a Queue and the Right a Stack\nAnswer according the above");
  }
 if(key=='1'){ 
  int n = JOptionPane.showConfirmDialog( frame,
    "Is LIFO the principle of a queue?",
    "An Queue and Stack Question",
    JOptionPane.YES_NO_OPTION);
    if (n == JOptionPane.NO_OPTION) {
    r=r+10;
    JOptionPane.showMessageDialog(null,"Correct");
    }else{
    JOptionPane.showMessageDialog(null,"Incorrect");
    }
 }
  if(key=='2'){ 
  int n = JOptionPane.showConfirmDialog( frame,
    "In the left figure green elipse is going to go out first?",
    "An Queue and Stack Question",
    JOptionPane.YES_NO_OPTION);
    if (n == JOptionPane.YES_OPTION) {
    r=r+10;
    JOptionPane.showMessageDialog(null,"Correct");
    }else{
    JOptionPane.showMessageDialog(null,"Incorrect");
    }
 }
   if(key=='3'){ 
  int n = JOptionPane.showConfirmDialog( frame,
    "Is the right figure going to pop the green one?",
    "An Queue and Stack Question",
    JOptionPane.YES_NO_OPTION);
    if (n == JOptionPane.YES_OPTION) {
    r=r+10;
    JOptionPane.showMessageDialog(null,"Correct");
    }else{
    JOptionPane.showMessageDialog(null,"Incorrect");
    }
 }
  if(key=='4'){ 
  int n = JOptionPane.showConfirmDialog( frame,
    "If you enqueue another figure, Is it going to be infront of the green one? ",
    "An Queue and Stack Question",
    JOptionPane.YES_NO_OPTION);
    if (n == JOptionPane.NO_OPTION) {
    r=r+10;
    JOptionPane.showMessageDialog(null,"Correct");
    }else{
    JOptionPane.showMessageDialog(null,"Incorrect");
    }
 }
}

