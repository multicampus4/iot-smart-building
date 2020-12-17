#include <DHT11.h>

// 핀설정
const int temphumPin = A0;
const int dustPin = A1;
const int lightPin = A2;

// 온습도 설정
DHT11 dht11(temphumPin); 

//미세먼지 변수
unsigned long duration;
unsigned long starttime;
unsigned long sampletime_ms = 2000;
unsigned long lowpulseoccupancy = 0;
float ratio = 0;
float concentration = 0;
float ugm3 = 0;

// 조도 변수
const int ledPin = 13;
int lightVal;
int ledVal;

void setup() {
  Serial.begin(9600);
  pinMode(dustPin,INPUT);
  starttime = millis();
}

void loop() {
  // 미세먼지 계산
  duration = pulseIn(dustPin, LOW);
  lowpulseoccupancy = lowpulseoccupancy+duration;

  if ((millis()-starttime) > sampletime_ms)
  {
    ratio = lowpulseoccupancy/(sampletime_ms*10.0);  // Integer percentage 0=>100
    concentration = 1.1*pow(ratio,3)-3.8*pow(ratio,2)+520*ratio+0.62; // using spec sheet curve
    ugm3= concentration * 100 /13000;
    
    //Serial.print(ratio); Low pulse Occupancy %를 알고 싶을때
    //Serial.print(concentration); concentration 를 알고 싶을때

    // 조명제어
    ledVal = map(analogRead(lightPin),0,1100,0,255);
    analogWrite(ledPin, ledVal);
    
    // 온습도 처리
    float tmp, hum;
    dht11.read(hum, tmp);

    // 출력
    Serial.print("$");  // start char
//    Serial.print("tmp");
    Serial.print(tmp);Serial.print(",");
//    Serial.print(";hum");
    Serial.print(hum);Serial.print(",");
//    Serial.print(";dst");
    Serial.print(ugm3);Serial.print(",");
//    Serial.print(";lgt");
    Serial.print(analogRead(lightPin));
    Serial.print(";^\n"); // end char

    
    
    lowpulseoccupancy = 0;
    starttime = millis();
  }
}
