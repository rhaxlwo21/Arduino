int buttonY = 9;
int buttonB = 10;
int buttonW = 11;
int buttonR = 12;
int buttonG = 13;
 
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
    Serial.println("Y");
    delay(7000);
  }
  else if (digitalRead(buttonB) == LOW){
    Serial.println("B");
    delay(7000);
  }
  else if (digitalRead(buttonW) == LOW){
    Serial.println("W");
    delay(7000);
  }
  else if (digitalRead(buttonR) == LOW){
    Serial.println("R");
    delay(7000);
  }
  else if (digitalRead(buttonG) == LOW){
    Serial.println("G");
    delay(7000);
  }
}
