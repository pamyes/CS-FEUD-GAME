int r=0; 
int nOfQs           = 5;
int nOfOpts         = 3;
int phase           = 1; 
int[] msgW;
boolean warnSave    = false;
boolean answdAll    = false; 
boolean answdAllCor = false;
int[] corOpt        = new int[nOfQs] ; 
int[] wrongOpt      = new int[nOfQs] ; 
//String[] questions  =new String{"",""};
String[] msg = {
  "CHOOSE AN OPTION", "CORRECT", "INCORRECT"
};
color[] c = {
  0xAA219080, 0x80FF7040, 0x80E0E0E0, 0xFF000000, 0xFFFFFFFF
};

String[] Qs={"Comment int (*a)[7];"," What is the function that add data into a stack",
"Queue can be used to implement:", "What is the meaning of FIFO?", "Which of the following is not a logical data structure?","Which case does a recursive function doesn't need"};
 
boolean[] corAns = {
  false, false, false, false, false
};
 
 
//------------------------  BUTTONS----------------------------
 
NonexclusiveToggleButton[][] btnQ = new NonexclusiveToggleButton[nOfQs][nOfOpts];
NonexclusiveToggleButton btnSaveAnss; 
 
String[][] btnLbls = new String[nOfQs][nOfOpts];
String[] btnQTxt = new String[nOfQs]; 
 
//---------------------ANSWER OPTIONS -------------------------------
 
int[] optsPerQ= new int[nOfQs];
 
int[] btnQAnsNumber = {
  2
    , 
  2
    , 
  1
    , 
  2
    , 
  0   
    , 
  2
    , 
  1
    , 
  0
};
 
//-----------------------SETUP -----------------------------
 
void setup()
{
  size(600, 600);        
  background(c[0]);  
      btnLbls[0][0] ="An array “a” of pointers";
      btnLbls[0][1] ="None of the mentioned";
      btnLbls[0][2] ="pointer “a” to an array";
      btnLbls[1][0] ="Pop";
      btnLbls[1][1] ="Enqueue";
      btnLbls[1][2] ="Push";
      btnLbls[2][0] ="Merge sort";
      btnLbls[2][1] ="Quick sort";
      btnLbls[2][2] ="heap sort";
      btnLbls[3][0] ="First in Fast out";
      btnLbls[3][1] ="Fast in First Out";
      btnLbls[3][2] ="First in First Out";
      btnLbls[4][0] ="Chain";
      btnLbls[4][1] ="Tree";
      btnLbls[4][2] ="Stack";

 
  for (int i = 0; i < nOfQs; i++) {
    btnQTxt[i] = "Question: "+ Qs[i];
    optsPerQ[i] = (int)(btnLbls[i].length);
    btnQ = new NonexclusiveToggleButton[nOfQs][i];
  }
 
  btnSaveAnss = new NonexclusiveToggleButton("Submit Answers", width-width/5, height-height/15, (int)(textWidth("Submit Answers")+20), 30);
  btnSaveAnss.press = false;
 
  switch (phase) {
  case 1:
    btnQrender();
    break; 
  case 2: 
    text("Thank you!", width/2, height/2);
    break; 
  default: 
    exit(); 
    break;
  }
}
 
//------------------------ DRAW----------------------------
void draw()
{
  background(c[0]);
  btnSavePressed(); 
  drawBtns();   
  noFill();
  drawWarnSave();
  textSize(20);
  fill(255); 
  text("QUIZ", (int)(width-width/9), height/240, (int)(textWidth("QUIZ")+20), 30);
  textSize(40);
  text ("Score: "+r, 100, 500); 
  textSize(12);
}
int msgW(int i) {
  return (int)(textWidth(msg[i]));
}
//--------------------- BUTTON DRAW -------------------------------
void drawBtns() {
  btnSaveAnss.draw();
  for (int i = 0; i < nOfQs; i++) { 
    for (int j=0; j < nOfOpts; j++) { 
      btnQ[i][j].draw();
    }
  }
}
 
//------------------- BUTTON PRESSED ON MOUSE ---------------------------------
void mousePressed() {
  btnSaveAnss.onMouse();
  for (int i = 0; i < nOfQs; i++) { 
    for (int j=0; j < nOfOpts; j++) {  
      btnQ[i][j].onMouse();
    }
  }
}
 
//------------------------ BUTON RENDER ----------------------------
void btnQrender() {
  for (int i = 0; i < nOfQs; i++) {
    int sX   = 20;
    int sY   = 70;
    int[] bW = new int[10] ;
    int mX   = 10; 
    int mY   = 30;
    int bH   = 30; 
    int bY   = mY +sY*i; 
    int bX   = 0; 
    String q = btnQTxt[i]; 
    for (int j = 0; j <nOfOpts; j++) {  
      String btnLbl = btnLbls[i][j];
      bW[j] = (int)(textWidth(btnLbls[i][j])+mX);
      if (j==0) {
        bX = mX;
      } 
      else {
        bX += sX+bW[j-1];
      }
      btnQ[i][j] = new NonexclusiveToggleButton(btnLbl, bX, bY, bW[j], bH);
    }
    for (int j =0; j<1;j++) {
      btnQ[i][j].setQ(q);
    }
  }
}
//-------------------- CLASS: ON/OFF BUTTON (non-exclusive)--------------------------------
void btnSavePressed() {
  saveAnss();
  if ((!btnSaveAnss.press) && (!answdAllCor)) { 
    warnSave = false;
  }
  if ((btnSaveAnss.press) && (!answdAllCor)) { 
    if (!answdAll) {
      warnSave = true;
    }
    if (answdAll) {
      warnSave = false;
      checkAnss();
    }
  }
  if ((btnSaveAnss.press) && (answdAllCor)) {
    warnSave = false; 
    phase++;
  }
}
 
//-------------------------COMPARE ANSWERS---------------------------
void saveAnss() {
  int count     =  0; 
  int numAnswd  =  0;
  int iAnswd    =  0;  
  for (int i = 0; i < nOfQs; i++) {
    corOpt[i]   =  0; 
    wrongOpt[i] =  0;
    corAns[i]   =  false; 
    corAns[i]   =  false;
    for (int j=0; j < nOfOpts; j++) { //CHANGE
      if ((btnQ[i][j].press)) { 
        numAnswd++;
        int chosen = j; 
        if (chosen == btnQAnsNumber[i]) {
          corOpt[i]++;
        }
        else {
          wrongOpt[i] ++;
        } 
        if (corOpt[i]==1&&wrongOpt[i]==0) {
          corAns[i] = true;
        } 
        else {
          corAns[i] = false;
        }   
        if ((corOpt[i]!=0)||(wrongOpt[i]!=0)) {
          iAnswd ++;
        }
        if (iAnswd == nOfQs) {
          answdAll= true;
        }
      }
    }
  }  
   noLoop();
}
 
 
//-------------------------WARNING: SAVE ---------------------------
 
void drawWarnSave() {
  if ( warnSave) {
    fill(#FF0000);
    textAlign(CENTER);
    text("Please answer all questions!", width/2, height-30);
    textAlign(LEFT);
    noFill();
  }
}
 
//-------------------------CHECK ANSWERS---------------------------
 
int checkAnss() {
  int bM = 30; 
  int bH = 30;
  int qSY = 60;
  int mY = 10; 
  for (int i = 0; i < nOfQs; i++) { 
    if ((corOpt[i]==0)&&(wrongOpt[i]==0)) {
      fill(c[0]);
      stroke(255, 100);
      rect(((int)(textWidth(btnQTxt[i]))+bM/2), mY+qSY*(i+1)-bH/2, msgW(0)+bM, bH); 
      fill(255);
      textAlign(LEFT);
      text(msg[0], ((int)(textWidth(btnQTxt[i]))+bM), mY+qSY*(i+1)-bH/4, msgW(0)+bM, bH);
    }
    if ((corAns[i])&&((corOpt[i]==1)&&(wrongOpt[i]==0))) { 
      /*fill(255, 30);
      stroke(255, 100);
      rect(((int)(textWidth(btnQTxt[i]))+bM/2), mY+qSY*(i+1)-bH/2, msgW(1)+bM, bH); 
      fill(255);
      textAlign(LEFT);
      text(msg[1], ((int)(textWidth(btnQTxt[i]))+bM), mY+qSY*(i+1)-bH/4, msgW(1)+bM+10, bH);*/
      r=r+5;
    }
    if ((!corAns[i])&&((corOpt[i]>0)||(wrongOpt[i]>0))) {    
      fill(c[1], 30);
      stroke(c[1], 100);
      rect(((int)(textWidth(btnQTxt[i]))+bM/2), mY+qSY*(i+1)-bH/2, msgW(2)+bM, bH); 
      fill(255);
      textAlign(LEFT);
      text(msg[2], ((int)(textWidth(btnQTxt[i]))+bM), mY+qSY*(i+1)-bH/4, msgW(2)+bM, bH);
    }
  }
  return r;
}
//------------------CLASS: ON/OFF BUTTON (non-exclusive)----------------------------------
 
class NonexclusiveToggleButton
{
 
  int x, y, w, h;
  boolean press;
  String lbl;
  String mQ    =  ""; 
  int fontSize = 12;
  int mQY      =  25;
  int nBg      = c[2];
  int nFg      = c[3];
  int sBg      = c[1];
  int sFg      = c[4];
 
  NonexclusiveToggleButton(String lbl, int x, int y, int w, int h) {
    this.lbl = lbl;
    this.x = x; 
    this.y = y; 
    this.w = w; 
    this.h = h;
    press = false;
  }
 
  void setQ(String value) {
    this.mQ = value;
  } 
 
  void draw() {
    fill(255);
    textAlign(LEFT);
    text(mQ, x, y-mQY, w*10, h);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    stroke(0, 100);
    strokeWeight(1);
    fill(press ? sBg : nBg);
    rect(x, y, w, h);
    fill(press ? sFg : nFg);
    text(lbl, x+w/2, y+h/2);
    

  }
 
  void onMouse() {
    if (this.contains(mouseX, mouseY)) {
      press = !press;
      redraw();
    }
  }
  boolean contains(int px, int py) {
    if (px < x) return false;
    if (py < y) return false;
    if (px - x > w) return false;
    if (py - y > h) return false;
    return true;
  }
 
};
