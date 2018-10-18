import processing.serial.*;  // 시리얼통신을 위해 프로세싱의 라이브러리를 불러온다. 
Serial port; 

boolean button1, button2, button3, button4, button5=false;
float buttonSign=0;
PFont font;
int userA, userB, userC, userD, userE = 0;
//게임 참가 버튼
boolean buttonR, buttonG, buttonB, buttonY, buttonGr = false;
//게임내 협력 버튼
boolean buttonRG, buttonGG, buttonBG, buttonYG, buttonGrG = false;

void setup()
{
  size(1920,1080);
  background(255,255,255);
  port=new Serial(this,"COM7", 9600);  //시리얼 통신을 위한 객체 생성
                                                  //(각자 연결된 포트넘버를 쓰세요)

  port.bufferUntil('\n'); //줄바꿈('\n')이 나오기 전 까지 시리얼 통신 유지
  font=createFont("돋움체",400);
}

void draw(){
  if(mousePressed){
    mouseEvent();
  }
  startMenu();
  //버튼1이 true면 프로세싱을 종료 = 종료
  if(button1 == true){
    exit();
  }
  
  //버튼2가 true이면 gameStart함수가 실행 = 게임시작
  if(button2 == true){
    background(255,255,255);
     readyGame();
     setGame();
     delay(100);
   }
  
  //버튼3번이 true이면 배경을 흰색으로, helper함수를 실행하고 버튼3번을 false로한다 = 도움말
  if(button3 == true){
    background(255,255,255);
    helper();
    button3 = false;
    delay(100);
  }
  
  //버튼3번이 false, 버튼 4번이 true이면 돌아가기 창 실행가능
  if(button3 == false && button4 == true){
    background(255,255,255);
    button3 = false;
    button4 = false;
    delay(100);
  }
  if(buttonSign==1) {
  r1();
  }else if(buttonSign==2) {
  r2(); 
  }else if(buttonSign==3) {
  r3(); 
  }else if(buttonSign==4) {
  r4(); 
  }else if(buttonSign==5) {
  r5(); 
  }
}

void r1() {
  fill(255,255,0); //가변저항에 의한 값을 R 값으로 하는 rect
  rect(100,100,250,250);
}

void r2() {
  fill(0,0,255);//가변저항에 의한 값을 G값으로 하는 rect
  rect(100,100,250,250);
}

void r3() {
  fill(255,255,255);//가변저항에 의한 값을 G값으로 하는 rect
  rect(100,100,250,250);
}

void r4() {
  fill(255,0,0);//가변저항에 의한 값을 G값으로 하는 rect
  rect(100,100,250,250);
}

void r5() {
  fill(0,255,0);//가변저항에 의한 값을 G값으로 하는 rect
  rect(100,100,250,250);
}

void serialEvent(Serial port) //아두이노로 부터 값(데이터)가 들어올때마다 수행되는 함수
{
  buttonSign=float(port.readStringUntil('\n'));  //줄바꿈 전까지 데이터 읽음 
  println(buttonSign); //아두이노로 부터 받은 가변저항에 의한 값을 
                           //프로세싱 하단 창에 출력 
}

void startMenu(){
  rectMode(CENTER);
  //종료하기 상자
  fill(200, 200, 200);
  rect(width/2, height/2-15, 600, 60,7);
  //시작하기 상자
  fill(200, 200, 200);
  rect(width/2, height/2-90, 600, 60,7);
  //도움말 상자
  fill(200, 200, 200);
  rect(width/2, height/2+65, 600, 60,7);
  
  //종료하기 글씨
  fill(0);
  textFont(font,30);
  textAlign(CENTER);
  text("종료하기",width/2,height/2);
  
  //시작하기 글씨
  fill(0);
  textFont(font,30);
  textAlign(CENTER);
  text("시작하기",width/2,height/2-70);
  
  //도움말 글씨
  fill(0);
  textFont(font,30);
  textAlign(CENTER);
  text("도움말",width/2,height/2+75);
}

void mouseEvent(){
  //종료하기
  if(mouseX >= 680 && mouseX <=1260 && mouseY >= 495 && mouseY <= 555){
    button1 =! button1;
    delay(100);
  }
  
  if(mouseX >= 680 && mouseX <=1260 && mouseY >= 420 && mouseY <= 480){
    button2 =! button2;
    delay(100);
  }
  
  if(mouseX >= 680 && mouseX <=1260 && mouseY >= 575 && mouseY <= 635){
    button3 =! button3;
    delay(100);
  }
  
  if(mouseX >= 1450 && mouseX <=1550 && mouseY >= 870 && mouseY <= 930){
    button4 =! button4;
    delay(100);
  }
}

//helper함수 실행시 도움말과 게임 방식 출력
void helper(){
  fill(0);
  textFont(font,20);
  textAlign(CENTER);
  text("이 게임은 샌프란시스코 익스플로라토리움(Exploratorium) 과학관 1층에서 보았던 협동심(의리) 게임을보고\n제작한 게임입니다. 매우 기본적이고 초라하지만 재밌게 봐주세요.\n\n이 게임은 최대 5명이 참가할수 있는 게임입니다\n인원은 5명에 가까울수록 좋습니다.\n시작하기를 누르면 참가하실 자리의 버튼을 누르십시오.\n버튼을 누른 자리에서만 실행하실수 있습니다.\n\n버튼을 누르면 누른사람은 1점, 누르지 않은 사람은 3점씩 올라갑니다.\n\n점수가 가장 높은 사람이 승리합니다.\n 하지만 아무도 버튼을 누르지 않는 다면, 게임은 종료 됩니다.\n 그럼 이만 즐겜~",width/2,height/100*10);

  fill(200.200,200);
  rectMode(CENTER);
  rect(1500,900,100,60);
  fill(0);
  textFont(font,20);
  textAlign(CENTER);
  text("돌아가기",1500,900);
}

void setGame(){
//사용자별 ellipse, 색지정, 텍스트 구현
  //빨강 A
  noStroke();
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(width/100*16,height/3*1,200,200);
  
  textFont(font,60);
  textAlign(CENTER);
  fill(0);
  text(userA,width/100*16,height/3*1);
  
  //연두 userB
  noStroke();
  fill(0,255,0);
  ellipseMode(CENTER);
  ellipse(width/100*32,height/3*1,200,200);
  
  textFont(font,60);
  textAlign(CENTER);
  fill(0);
  text(userB,width/100*32,height/3*1);
  
  //노랑 userC
  noStroke();
  fill(232,232,0);
  ellipseMode(CENTER);
  ellipse(width/100*48,height/3*1,200,200);
  
  textFont(font,60);
  textAlign(CENTER);
  fill(0);
  text(userC,width/100*48,height/3*1);
  
  //회색 userD
  noStroke();
  fill(127,127,127);
  ellipseMode(CENTER);
  ellipse(width/100*64,height/3*1,200,200);
 
  textFont(font,60);
  textAlign(CENTER);
  fill(0);
  text(userD,width/100*64,height/3*1);
 
  //파랑 userE
  noStroke();
  fill(0,0,255);
  ellipseMode(CENTER);
  ellipse(width/100*80,height/3*1,200,200);
  
  textFont(font,60);
  textAlign(CENTER);
  fill(0);
  text(userE,width/100*80,height/3*1);
}

//게임 화면, 원 5개 그리기
void readyGame(){
  textFont(font,30);
  textAlign(CENTER);
  fill(255,0,0);
  text("원 아래 빈 네모를 클릭하시면 Ready가 됩니다!! 빈자리는 Ready를 눌러주신 상태로 그냥 진행하시면 됩니다.",width/2,height/10);
  
  if(button2 == true){
  background(255,255,255);
  
  //게임 참가
  //userA
  if(buttonR == false){
  rectMode(CENTER);
  noFill();
  stroke(0);
  rect(width/100*16,height/3*2,100,50);
  }else{
  rectMode(CENTER);
  fill(255,0,0);
  rect(width/100*16,height/3*2,100,50);
  textFont(font,20);
  textAlign(CENTER);
  fill(0);
  text("Ready",width/100*16,height/3*2);
  buttonR = true;
  }
  
  //userB
  if(buttonG == false){
  rectMode(CENTER);
  noFill();
  stroke(0);
  rect(width/100*32,height/3*2,100,50);
  }else{
  rectMode(CENTER);
  fill(0,255,0);
  rect(width/100*32,height/3*2,100,50);
  textFont(font,20);
  textAlign(CENTER);
  fill(0);
  text("Ready",width/100*32,height/3*2);
  buttonG = true;
  }
  
  //userC
  if(buttonY == false){
  rectMode(CENTER);
  noFill();
  stroke(0);
  rect(width/100*48,height/3*2,100,50);
  }else{
  rectMode(CENTER);
  fill(232,232,0);
  rect(width/100*48,height/3*2,100,50);
  textFont(font,20);
  textAlign(CENTER);
  fill(0);
  text("Ready",width/100*48,height/3*2);
  buttonY = true;
  }
  
  //userD
  if(buttonGr == false){
  rectMode(CENTER);
  noFill();
  stroke(0);
  rect(width/100*64,height/3*2,100,50);
  }else{
  rectMode(CENTER);
  fill(127,127,127);
  rect(width/100*64,height/3*2,100,50);
  textFont(font,20);
  textAlign(CENTER);
  fill(0);
  text("Ready",width/100*64,height/3*2);
  buttonGr = true;
  }
  
  //userE
  if(buttonB == false){
  rectMode(CENTER);
  noFill();
  stroke(0);
  rect(width/100*80,height/3*2,100,50);
  }else{
  rectMode(CENTER);
  fill(0,0,255);
  rect(width/100*80,height/3*2,100,50);
  textFont(font,20);
  textAlign(CENTER);
  fill(0);
  text("Ready",width/100*80,height/3*2);
  buttonB = true;
  }
  }
  if((buttonR == true) && (buttonG ==true) && (buttonY == true) && (buttonGr == true) && (buttonB == true)){
    startGame(); 
    //gameStartCountdownTimer();
  } 
  
}

void startGame(){
   background(255,255,255);
   textFont(font,40);
   textAlign(CENTER);
   fill(0);
   text("자신의 버튼을 클릭하세요!! 서로를 믿지 마세요!! 남을 위해 희생이라는 것을 배워봅시다!",width/2,height/2);
   
   rectMode(CENTER);
   fill(255,0,0);
   rect(width/100*16,height/10*8,100,50);
   rectMode(CENTER);
   fill(0,255,0);
   rect(width/100*32,height/10*8,100,50);
   rectMode(CENTER);
   fill(232,232,0);
   rect(width/100*48,height/10*8,100,50);
   rectMode(CENTER);
   fill(127,127,127);
   rect(width/100*64,height/10*8,100,50);
   rectMode(CENTER);
   fill(0,0,255);
   rect(width/100*80,height/10*8,100,50);  
}
