/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void textfieldInputAnswer_change1(GTextField source, GEvent event) { //_CODE_:textfieldInputAnswer:382653:
  println("textfieldInputAnswer - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfieldInputAnswer:382653:

public void buttonSubmit_click1(GButton source, GEvent event) { //_CODE_:buttonSubmit:738354:
  println("buttonSubmit - GButton >> GEvent." + event + " @ " + millis());
  checkAnswer(textfieldInputAnswer);
} //_CODE_:buttonSubmit:738354:

public void textfieldEnterCode_change1(GTextField source, GEvent event) { //_CODE_:textfieldEnterCode:894445:
  println("textfieldEnterCode - GTextField >> GEvent." + event + " @ " + millis());
  checkCode(textfieldEnterCode);
} //_CODE_:textfieldEnterCode:894445:

synchronized public void winStory_draw1(PApplet appc, GWinData data) { //_CODE_:windowStory:922006:
  appc.background(0);
} //_CODE_:windowStory:922006:

public void buttonStory_click1(GButton source, GEvent event) { //_CODE_:buttonStory:723930:
  windowStory.setVisible(false);
  if(buttonStory.getText().equals(endButtonText)){
    windowStory.exit();
  }
  println("buttonStory - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:buttonStory:723930:

public void timer1_Action1(GTimer source) { //_CODE_:timer1:457799:
  println("timer1 - GTimer >> an event occured @ " + millis());
  timer1.stop();
  textfieldEnterCode.setVisible(false);
  addWhiteBoxForClue = false;
  textfieldEnterCode.setText("");
} //_CODE_:timer1:457799:

public void timer2_Action1(GTimer source) { //_CODE_:timer2:662084:
  println("timer2 - GTimer >> an event occured @ " + millis());
  timer2.stop();
  //labelClue.setVisible(false);
  labelClue.setText("");
  addWhiteBoxForClue = false;
  labelClue.setLocalColorScheme(GCScheme.BLUE_SCHEME);
} //_CODE_:timer2:662084:

synchronized public void winCode_draw1(PApplet appc, GWinData data) { //_CODE_:windowCode:528872:
  appc.background(230);
  int deltaTime = millis() - timeStorage;
  if(deltaTime>100 && fixingCode){
    //change next char
    GLabel codeToFix;
      if(whichLineToFix ==0){
        codeToFix = labelCode1;
      } else if(whichLineToFix ==1){
        codeToFix = labelCode2;
      }else if(whichLineToFix ==2){
        codeToFix = labelCode3;
      }else if(whichLineToFix ==3){
        codeToFix = labelCode4;
      }else {
        codeToFix = labelCode5;
      }
      
    if(currentCharFixing<30){
      String line = codeToFix.getText();
      char[] lineComponents = line.toCharArray();
      char newBit = getRandomBit(1).charAt(0);
      lineComponents[currentCharFixing] = newBit ;
      currentCharFixing++;
      String newText = new String(lineComponents);
      codeToFix.setText(newText);
      timeStorage = millis();
    } else {
     codeToFix.setLocalColorScheme(GCScheme.GREEN_SCHEME);
     fixingCode = false;
     whichLineToFix++;
     currentCharFixing=0;
    }
  } else if(deltaTime>1000 && deltaTime<2000){//so it is not called when we are trying to show it again(but we should be resting the time)S
    windowCode.setVisible(false);
  }
} //_CODE_:windowCode:528872:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Attack AI");
  labelQuestion = new GLabel(this, 0, 0, 480, 110);
  labelQuestion.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelQuestion.setText("{Question}");
  labelQuestion.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  labelQuestion.setOpaque(false);
  textfieldInputAnswer = new GTextField(this, 150, 130, 160, 30, G4P.SCROLLBARS_NONE);
  textfieldInputAnswer.setPromptText("Type in your answer here");
  textfieldInputAnswer.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  textfieldInputAnswer.setOpaque(true);
  textfieldInputAnswer.addEventHandler(this, "textfieldInputAnswer_change1");
  buttonSubmit = new GButton(this, 190, 180, 80, 30);
  buttonSubmit.setText("Submit");
  buttonSubmit.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  buttonSubmit.addEventHandler(this, "buttonSubmit_click1");
  labelClue = new GLabel(this, 140, 230, 180, 40);
  labelClue.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelClue.setText("{Clue}");
  labelClue.setOpaque(false);
  textfieldEnterCode = new GTextField(this, 140, 270, 180, 30, G4P.SCROLLBARS_NONE);
  textfieldEnterCode.setPromptText("Enter code here");
  textfieldEnterCode.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  textfieldEnterCode.setOpaque(true);
  textfieldEnterCode.addEventHandler(this, "textfieldEnterCode_change1");
  windowStory = GWindow.getWindow(this, "Story", 470, 200, 480, 320, JAVA2D);
  windowStory.noLoop();
  windowStory.setActionOnClose(G4P.EXIT_APP);
  windowStory.addDrawHandler(this, "winStory_draw1");
  labelStory = new GLabel(windowStory, 130, 50, 210, 90);
  labelStory.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelStory.setText("An A.I. has turned evil. And now it is your job to stop it using your math skills to solve problems which will fix the A.I's code.");
  labelStory.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  labelStory.setOpaque(false);
  buttonStory = new GButton(windowStory, 180, 180, 120, 40);
  buttonStory.setText("Start your mission");
  buttonStory.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  buttonStory.addEventHandler(this, "buttonStory_click1");
  timer1 = new GTimer(this, this, "timer1_Action1", 2000);
  timer2 = new GTimer(this, this, "timer2_Action1", 2000);
  windowCode = GWindow.getWindow(this, "AI Code", 500, 250, 240, 120, JAVA2D);
  windowCode.noLoop();
  windowCode.addDrawHandler(this, "winCode_draw1");
  labelCode1 = new GLabel(windowCode, 0, 20, 240, 20);
  labelCode1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelCode1.setText("My label1");
  labelCode1.setLocalColorScheme(GCScheme.RED_SCHEME);
  labelCode1.setOpaque(false);
  labelCode2 = new GLabel(windowCode, 0, 40, 240, 20);
  labelCode2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelCode2.setText("My label2");
  labelCode2.setLocalColorScheme(GCScheme.RED_SCHEME);
  labelCode2.setOpaque(false);
  labelCode3 = new GLabel(windowCode, 0, 60, 240, 20);
  labelCode3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelCode3.setText("My label3");
  labelCode3.setLocalColorScheme(GCScheme.RED_SCHEME);
  labelCode3.setOpaque(false);
  labelCode4 = new GLabel(windowCode, 0, 80, 240, 20);
  labelCode4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelCode4.setText("My label4");
  labelCode4.setLocalColorScheme(GCScheme.RED_SCHEME);
  labelCode4.setOpaque(false);
  labelCode5 = new GLabel(windowCode, 0, 100, 240, 20);
  labelCode5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelCode5.setText("My label5");
  labelCode5.setLocalColorScheme(GCScheme.RED_SCHEME);
  labelCode5.setOpaque(false);
  labelFixing = new GLabel(windowCode, 60, 0, 110, 20);
  labelFixing.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelFixing.setText("Fixing A.I.'s code...");
  labelFixing.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  labelFixing.setOpaque(false);
  windowStory.loop();
  windowCode.loop();
}

// Variable declarations 
// autogenerated do not edit
GLabel labelQuestion; 
GTextField textfieldInputAnswer; 
GButton buttonSubmit; 
GLabel labelClue; 
GTextField textfieldEnterCode; 
GWindow windowStory;
GLabel labelStory; 
GButton buttonStory; 
GTimer timer1; 
GTimer timer2; 
GWindow windowCode;
GLabel labelCode1; 
GLabel labelCode2; 
GLabel labelCode3; 
GLabel labelCode4; 
GLabel labelCode5; 
GLabel labelFixing; 