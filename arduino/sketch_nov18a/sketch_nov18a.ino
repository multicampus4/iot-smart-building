#include <DHT11.h>

const int temphumPin = A0;
const int ledPin = A2;

DHT11 dht11(temphumPin); 

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  delay(2000);

  int err;
  float tmp, hum;
  if((err=dht11.read(hum, tmp))==0)
  {
    Serial.print("tmp");
    Serial.print(tmp);
    Serial.print(";hum");
    Serial.print(hum);
    Serial.print(";\n");
  }
  else
  {
    Serial.println();
    Serial.print("Error No :");
    Serial.print(err);
    Serial.println();    
  }
  /*
  // 온도 센서
  int data = analogRead(temphumPin);
  float temp = ((5.0 * data) / 1024.0) * 100;
  Serial.print("tmp");
  Serial.print(temp);
  
  Serial.print(";hum");
  Serial.print(temp+52.12);
  Serial.print(";\n");
  */
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
