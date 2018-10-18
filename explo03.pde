import processing.serial.*;  // 시리얼통신을 위해 프로세싱의 라이브러리를 불러온다. 
Serial port; 

//아두이노 시리얼 입력값
float buttonSign=0;
float buttonGameSign = 0;
//유저와 버튼, 폰트 선언
int userA, userB, userC, userD, userE = 0;
//옵션 버튼
boolean button1, button2, button3, button4, button5=false;
//게임 참가 버튼
boolean buttonR, buttonG, buttonB, buttonY, buttonW = false;
//게임내 협력 버튼
boolean buttonGR, buttonGG, buttonGB, buttonGY, buttonGW = false;
boolean next=false;
PFont font;
//시간 카운트 다운
int begin; 
int duration = 15;
int time = 15;
boolean timer = false;
//종료
boolean gameSet = false;
//화면 사이즈와 배경, 글씨체 선언
void setup() {
  port=new Serial(this,"COM3", 9600);
  port.bufferUntil('\n');
  size(1920,1080);
  background(255, 255, 255);
  font=createFont("돋움체",400);
}

//draw의 시작, 메뉴 상자, 메뉴 글씨 그리기
void draw() {
   startMenu();
  if(mousePressed){
    mouseEvent();
  }
  
  //버튼1이 true면 프로세싱을 종료 = 종료
  if(button1 == true){
    exit();
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
  
  //버튼2가 true이면 gameStart함수가 실행 = 게임시작
  if(button2 == true){    
  int i = 0;
  while (i<10) {
    time = 15;
    duration = 15;
    
    //다음라운드
    background(255,255,255);
    time = duration - (millis() - begin)/1000;

    textFont(font,30);
    textAlign(CENTER);
    fill(0);   
    text("다음 라운드까지 " + time + "초", width/100*70, 100);
    
    if(buttonSign==1){
      buttonG = true;
    }else if(buttonSign==2){
      buttonR =true;
    }else if(buttonSign==3){
      buttonW =true;
    }else if(buttonSign==4){
      buttonB =true;
    }else if(buttonSign==5){
      buttonY =true;
    }  

    //초록 A
    noStroke();
    fill(0,255,0);
    ellipseMode(CENTER);
    ellipse(width/100*16,height/3*1,200,200);
  
    textFont(font,60);
    textAlign(CENTER);
    fill(0);
    text(userA,width/100*16,height/3*1);
  
    //빨강 userB
    noStroke();
    fill(255,0,0);
    ellipseMode(CENTER);
    ellipse(width/100*32,height/3*1,200,200);
  
    textFont(font,60);
    textAlign(CENTER);
    fill(0);
    text(userB,width/100*32,height/3*1);
  
    //하양 userC
    stroke(0);
    fill(255,255,255);
    ellipseMode(CENTER);
    ellipse(width/100*48,height/3*1,200,200);
  
    textFont(font,60);
    textAlign(CENTER);
    fill(0);
    text(userC,width/100*48,height/3*1);
  
    //파랑 userD
    noStroke();
    fill(0,0,255);
    ellipseMode(CENTER);
    ellipse(width/100*64,height/3*1,200,200);
 
    textFont(font,60);
    textAlign(CENTER);
    fill(0);
    text(userD,width/100*64,height/3*1);
 
    //노랑 userE
    noStroke();
    fill(255,255,0);
    ellipseMode(CENTER);
    ellipse(width/100*80,height/3*1,200,200);
  
    textFont(font,60);
    textAlign(CENTER);
    fill(0);
    text(userE,width/100*80,height/3*1);
    
    if(time==0){
      if(buttonG==true){
        userA= userA +1;
        delay(1000);
        buttonG=false;
      }else{
        userA = userA+3;
        delay(1000);
      }
      if(buttonR==true){
        userB= userB +1;
        delay(1000);
        buttonG=false;
      }else{
        userB = userB+3;
        delay(1000);
      }
      if(buttonW==true){
        userC= userC +1;
        delay(1000);
        buttonG=false;
      }else{
        userC = userC+3;
        delay(1000);
        buttonG=false;
      }
      if(buttonB==true){
        userD= userD +1;
        delay(1000);
        buttonG=false;
      }else{
        userD = userD+3;
        delay(1000);
      }
      if(buttonY==true){
        userE= userE +1;
        delay(1000);
        buttonG=false;
      }else{
        userE = userE+3;
        delay(1000);
      }
      i = i + 1;
      if(time<0){
        time=15;
        duration = 15;
      }
      if(buttonG==false&&buttonR==false&&buttonW==false&&buttonB==false&&buttonY==false){
         exit();
      }
   }
   i=i+1;
  }
 }
  
  
  //길이 계산용 십자선
  //line(width/2,0,width/2,height);
  //line(0,height/2,width,height/2);
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

//버튼 역할, 지정된 범위클릭시 버튼이 on, off
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
  
  if(mouseX >= 257 && mouseX <=357 && mouseY >= 695 && mouseY <= 745){
    buttonR =! buttonR;
    //delay(1000);
  }
  
  if(mouseX >= 564 && mouseX <=664 && mouseY >= 695 && mouseY <= 745){
    buttonG =! buttonG;
    //delay(1000);
  }
  
  if(mouseX >= 871 && mouseX <=971 && mouseY >= 695 && mouseY <= 745){
    buttonY =! buttonY;
    //delay(1000);
  }
  
  if(mouseX >= 1178 && mouseX <=1278 && mouseY >= 695 && mouseY <= 745){
    buttonW =! buttonW;
    //delay(1000);
  }
  
  if(mouseX >= 1486 && mouseX <=1586 && mouseY >= 695 && mouseY <= 745){
    buttonB =! buttonB;
    //delay(1000);
  }
  
  if(mouseX >= 257 && mouseX <=357 && mouseY >= 695 && mouseY <= 889){
    buttonGR =! buttonGR;
    //delay(1000);
  }
  
  if(mouseX >= 564 && mouseX <=664 && mouseY >= 695 && mouseY <= 889){
    buttonGG =! buttonGG;
    //delay(1000);
  }
  
  if(mouseX >= 871 && mouseX <= 971 && mouseY >= 695 && mouseY <= 889){
    next =! next;
    //delay(1000);
  }
  
  if(mouseX >= 1178 && mouseX <= 1278 && mouseY >= 695 && mouseY <= 889){
    buttonGW =! buttonGW;
    //delay(1000);
  }
  
  if(mouseX >= 1486 && mouseX <=1586 && mouseY >= 695 && mouseY <= 889){
    buttonGB =! buttonGB;
    //delay(1000);
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

//아무도 누르지 않으면 게임 종료
void gameClose(){
  background(255,255,255); 
  textFont(font,50);
  textAlign(CENTER);
  fill(0);
  text("이런 의리없는 사람들!!",width/2,height/2);
}

void serialEvent(Serial port) //아두이노로 부터 값(데이터)가 들어올때마다 수행되는 함수
{
  buttonSign=float(port.readStringUntil('\n'));  //줄바꿈 전까지 데이터 읽음 
  println(buttonSign); //아두이노로 부터 받은 가변저항에 의한 값을 
                           //프로세싱 하단 창에 출력 
}
