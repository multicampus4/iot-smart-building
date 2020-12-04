const int tempPin = A0;
const int ledPin = A2;
boolean check = false;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  
}

void loop() {
  delay(2000);
  // LED 센서
  String cmd="";
  if(Serial.available()){
    cmd = Serial.readString();
    Serial.println(cmd);
    if(cmd.equals("ledStart")){
      digitalWrite(ledPin, HIGH);
    }else if(cmd.equals("ledStop")){
      digitalWrite(ledPin, LOW);
    }else if(cmd.equals("Sensor is started")){
      digitalWrite(tempPin, HIGH);
      check = true;
    }else if(cmd.equals("Sensor is stopped")){
      digitalWrite(tempPin, LOW);
      check = false;
    }
  }
    if(check){
      float temp = analogRead(tempPin);
      temp = (temp * 5.0/1024.0)*100-20;
      String temp_str=(String)temp;
      Serial.println("temp:"+temp_str);
  }
}
