int buttonY = 9;
int buttonB = 10;
int buttonW = 11;
int buttonR = 12;
int buttonG = 13;
int finalSign = 0;
 
void setup() 
{
  Serial.begin(9600);
  pinMode(buttonY, INPUT_PULLUP); 
  pinMode(buttonB, INPUT_PULLUP);
  pinMode(buttonW, INPUT_PULLUP);
  pinMode(buttonR, INPUT_PULLUP);
  pinMode(buttonG, INPUT_PULLUP); 
}
 
void loop() 
{
  if (digitalRead(buttonY) == LOW){
    finalSign =5;
    Serial.println(finalSign);
    delay(6000);
  }
  else if (digitalRead(buttonB) == LOW){
    finalSign =4;
    Serial.println(finalSign);
    delay(6000);
  }
  else if (digitalRead(buttonW) == LOW){
    finalSign =3;
    Serial.println(finalSign);
    delay(6000);
  }
  else if (digitalRead(buttonR) == LOW){
    finalSign =2;
    Serial.println(finalSign);
    delay(6000);
  }
  else if (digitalRead(buttonG) == LOW){
    finalSign =1;
    Serial.println(finalSign);
    delay(6000);
  }
}
