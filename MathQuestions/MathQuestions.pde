import g4p_controls.*;


PVector[] fallingNum = new PVector[100];//x loc, y loc, 1 or 0
PVector[] metaData = new PVector[100];//speed , size
boolean addWhiteBoxForClue = false;

//0 = storyboard
//1 = question 1, etc
private int state;

String [] answers = new String [5];
String [] clues = new String [5];
String [] codes = new String [5];
String [] questions = new String[5];


public boolean fixingCode = false;
public int whichLineToFix = 0;
public int currentCharFixing = 0;
public int timeStorage = 0;

void setup(){
  size(480, 320);
  createGUI();
  
  for(int i =0; i< fallingNum.length;i++ ){
    fallingNum[i] = new PVector((float)Math.random()*width, -10 - ((float)Math.random()*height), (int)(Math.random()*2) );
    metaData[i] = new PVector( (float) Math.random()*5+1 , (float) Math.random()*20+5);
  }
  
  labelClue.setVisible(false);
  textfieldEnterCode.setVisible(false);
  state = 1;
  
  answers[0] = "1";//winnie - 
  answers[1] = "2";//katelyn - (6,7,13)
  answers[2] = "3";//Christine - 6
  answers[3] = "4";//Christine -2.71
  answers[4] = "5";//Calvin -3.3
  
  clues[0] = "Listen carefully";
  clues[1] = "A good place to hang-out";
  clues[2] = "Where Ms.Kueh takes a seat";
  clues[3] = "I see trees of greeen, red roses too";
  clues[4] = "clue 5";
  
  codes[0] = "1";//Speaker - 8942
  codes[1] = "2";//Coat hanger - COAT
  codes[2] = "3";//teachers desk - KUEH
  codes[3] = "4";//white board - 3679
  codes[4] = "";//is not used

  questions[0] = "A robot is pushing a package up a ramp from (3,3,0) to a positive point on the z-axis. The robot is not very efficient and applies a force that is equal to the ramp but the z value is negative. The Robot has 17g of fuel and uses 2g/J. The robot wants to use all of it's fuel. Determine the end point of the ramp. (round to 2 decimal place values)";
  questions[1] = "Find the parametric equation of the plane passing throught the points (1,-3,2),(-5,4,1),(-2,-6,5). Find a vector perpendicular to this plane.(Input in formate '(a,b,c)'with no spaces";
  questions[2] = "State all discontiunities in the piecewise function \ng(x)={3x,x<4}\n\t {x^2-4,4<=x<6}\n\t {2^(x-2),x>=6}";
  questions[3] = "For f(x) = sinxlnx, find f'(45)";
  questions[4] = "A person is standing on a plane x-y+z+5=0 at point (0,0,-5). Their shadow has a magnitude of 3, the sunlight shines in the direction (-2,-2,-5). How tall is the person? (Round to nearest tenth)";
  
  labelCode1.setText( getRandomBit(30) );
  labelCode2.setText( getRandomBit(30) );
  labelCode3.setText( getRandomBit(30) );
  labelCode4.setText( getRandomBit(30) );
  labelCode5.setText( getRandomBit(30) );
}

void checkAnswer(GTextField answer){
  if (state == 0) {
    return;
  }
  if (answer.getText().equals(answers[state-1])) {
    showClue();
    textfieldEnterCode.setVisible(true);
    checkCode(textfieldEnterCode);
    buttonSubmit.setEnabled(false);
    return;
  }
  labelClue.setVisible(true);
  labelClue.setText("Incorrect Answer");
  addWhiteBoxForClue=true;
  labelClue.setLocalColorScheme(GCScheme.RED_SCHEME);
  timer2.start();
}

void checkCode(GTextField code) {
  if (state == 0) {
    return;
  }
  if (code.getText().equals(codes[state-1])) {
    newQuestion();
    fixBinary();
    buttonSubmit.setEnabled(true);
    timer1.start();
  }
}

void fixBinary() {
  windowCode.setVisible(true);
  timeStorage = millis();
  currentCharFixing =0;
  fixingCode=true;
  
}

void showClue() {
  labelClue.setText(clues[state-1]);
  addWhiteBoxForClue = true;
  labelClue.setVisible(true);
}

void newQuestion() {
  state++;
  textfieldInputAnswer.setText("");
  textfieldInputAnswer.setEnabled(true);
  labelClue.setVisible(false);
}

String getRandomBit(int length_){
 String str = "";
 for (int i =0; i<length_; i++){
   if((int)(Math.random()*2) ==0){
     str+="0";
   }else {
     str+="1";
   }
 }
 return str;
}

void draw(){
  background(10);
  if (state > 0 && state < 6) {
    labelQuestion.setText(questions[state-1]);
  } else if(state == 6){//finshed the game
    windowStory.setVisible(true);
    labelStory.setText("You have fixed the A.I. and saved the day");
    buttonStory.setText("Horay");
  }
  
  
  for(int i = 0; i<fallingNum.length; i++){
    
    if(fallingNum[i].y>(height+10) ){
      fallingNum[i] = new PVector((float)Math.random()*width, -10, (int)(Math.random()*2) );
    } else {
      fallingNum[i].y+= metaData[i].y/5;
      fill(0,255,0);
      textSize(metaData[i].y);
      text((int)fallingNum[i].z, fallingNum[i].x, fallingNum[i].y);
    }
    
    
    
  }
  
  noStroke();
  fill(255,255,255);
  rect(0,0,width,110);
  
  if(addWhiteBoxForClue){
    fill(200,200,200);
    rect(140,230,180,40);
  }
  
  
  
}