import java.awt.*;
import java.applet.*;
int rectX, rectY;
int r=0;
color[] c = {
  0xFF809070, 0x80FF4040, 0x80E0E0E0, 0xFF000000, 0xFFFFFFFF
};
TextField t1 = new TextField("",4);
TextField t2 = new TextField();
TextField t3 = new TextField();
TextField t4 = new TextField();
TextField t5 = new TextField();
TextField t6 = new TextField();
TextField t7 = new TextField();
TextField t8 = new TextField();
TextField t9 = new TextField();

color bg = color(33,33,33,255);
Panel p1=new Panel(new GridLayout(9,9,0,30));



void setup(){
 p1.setBackground(new Color(bg));
 size(600,600);
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(t1);
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));

 
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));

 
 p1.add(new Label(""));
 p1.add(t2);
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(t3);
 p1.add(new Label(""));
 p1.add(new Label(""));
 
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 
 p1.add(t4);
 p1.add(new Label(""));
 p1.add(t5);
 p1.add(new Label(""));
 p1.add(t6);
 p1.add(new Label(""));
 p1.add(t7);

 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 
 p1.add(new Label(""));
 p1.add(t8);
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(t9);
 p1.add(new Label(""));
 p1.add(new Label(""));
 p1.add(new Label(""));
 add(p1);
}
  
void draw(){
 background(bg);
if (mousePressed && (mouseButton == LEFT)) {
    r=correct();
    println(r);
  } 
  rect(60, 450, 100, 50);
  String p="Acomoda la siguiente cadena en el árbol:";
  String p2="7,5,3,10,6,4,8,12,9";
  textSize(50);
  text("Score "+r, 390, 500); 
  textSize(20);
  text(p, 25, 550);
  text(p2,25,590);
}

int correct(){
  int sc=0;
  if(t1.getText().equals("7"))sc=sc+10;
  if(t2.getText().equals("5"))sc=sc+10;
  if(t3.getText().equals("10"))sc=sc+10;
  if(t4.getText().equals("3"))sc=sc+10;
  if(t5.getText().equals("6"))sc=sc+10;
  if(t6.getText().equals("8"))sc=sc+10;
  if(t7.getText().equals("12"))sc=sc+10;
  if(t8.getText().equals("4"))sc=sc+10;
  if(t9.getText().equals("9"))sc=sc+10;
  return sc;
}


