#include <DHT11.h>

// pin 설정
const int temphumPin = A0;
const int dustPin = A1;
const int ledPin = A2;

// 온습도 변수
float tmp = 0;
float hum = 0;

// 미세먼지 변수
unsigned long duration;
unsigned long sampletime_ms = 2000;
unsigned long lowpulseoccupancy = 0;
float ratio = 0;
float concentration = 0;
float dustDensity = 0;

// 온습도 설정
DHT11 dht11(temphumPin); 

void setup() {
  Serial.begin(9600);
  pinMode(dustPin, INPUT);
  pinMode(ledPin, OUTPUT);
}

void calTempHum(){
  // 온습도 계산
  int err;
  float temperature, humidity;
  if((err=dht11.read(humidity, temperature))==0)
  {
    tmp = temperature;
    hum = humidity; 
  }
  else
  {
    Serial.println();
    Serial.print("Error No :");
    Serial.print(err);
    Serial.println();    
  }
}

void calDust(){
  // 미세먼지 계산
  /*
      국제 미세먼지농도에 따른 경계단계 기준분류 
      30ug/m^3 이하 : 좋음 / 30~80ug/m^3 : 보통 / 80~150ug/m^3 : 나쁨 / 150ug/m^3 초과 : 매우 나쁨
    */
  duration = pulseIn(dustPin, LOW);
  lowpulseoccupancy = lowpulseoccupancy + duration;
  
  ratio = lowpulseoccupancy / (sampletime_ms * 10.0); // Integer percentage 0=>100
  concentration = 1.1 * pow(ratio, 3) - 3.8 * pow(ratio, 2) + 520 * ratio + 0.62; // using spec sheet curve
  dustDensity = concentration * 100 / 13000;
  lowpulseoccupancy = 0;

 
}

void loop() {
  delay(2000);

  calTempHum();
  calDust();

  // 출력
  Serial.print("tmp");
  Serial.print(tmp);
  Serial.print(";hum");
  Serial.print(hum);
  Serial.print(";dst");
  Serial.print(dustDensity);
  Serial.print(";\n");

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
