const int tempPin = A0;
const int ledPin = A2;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  delay(2000);
  
  // 온도 센서
  int data = analogRead(tempPin);
  float temp = ((5.0 * data) / 1024.0) * 100;
<<<<<<< HEAD
  Serial.print("tmp");
  Serial.print(temp);
  
  Serial.print(";hum");
  Serial.print(temp+52.12);
  Serial.print(";\n");
=======
  Serial.print("temp:");
  Serial.print(temp);
  Serial.println();

  Serial.print("humidity:");
  Serial.print(temp+52.12);
  Serial.println();
>>>>>>> d7fca7605b477e614ba0238cdfd6e5c22266dc3c
  
  // LED 센서
  String cmd="";
  if(Serial.available()){
    cmd = Serial.readString();
    Serial.println(cmd);
    if(cmd.equals("ledStart")){
      digitalWrite(ledPin, HIGH);
    }else if(cmd.equals("ledStop")){
      digitalWrite(ledPin, LOW);
    }
  }
  

  
  


}
