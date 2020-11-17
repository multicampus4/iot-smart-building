const int tempPin = A0;
const int ledPin = A2;
boolean check = false;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  delay(2000);
  float temp = analogRead(tempPin);
  temp = (temp * 5.0/1024.0)*100;
  Serial.print("humidity");
  Serial.print(temp+52.12);
  Serial.print("\n");
  // LED 센서
  String cmd="";
  if(Serial.available()){
    cmd = Serial.readString();
    Serial.println(cmd);
    if(cmd.equals("ledStart")){
      digitalWrite(ledPin, HIGH);
    }else if(cmd.equals("ledStop")){
      digitalWrite(ledPin, LOW);
    }else if(cmd.equals("tempStart")){
      digitalWrite(tempPin, HIGH);
      check = true;
    }else if(cmd.equals("tempStop")){
      digitalWrite(tempPin, LOW);
      check = false;
    }
  }
    if(check){
      float temp = analogRead(tempPin);
      temp = (temp * 5.0/1024.0)*100;
      Serial.println(temp);
  }
}
