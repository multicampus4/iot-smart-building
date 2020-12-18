#include <DHT11.h>

// 핀설정
const int temphumPin = A0;
const int dustPin = A1;
const int lightPin = A2;

// 온습도 설정
DHT11 dht11(temphumPin); 

// 자동제어 타겟, 액션 변수
String deviceName = "";   // AIR
String deviceAction = ""; // ON

// 에어컨 등 시설 작동여부 변수 
boolean isAutoOnAir = false;  // 냉난방기
boolean isAutoOnHum = false;  // 가습,제습기 
boolean isAutoOnAircl = false;  // 공청기
boolean isAutoOnLED = false;  // 조명 >> 별도 제어 안함

// 자동제어에 따른 센서값 보정 위한 변수
float fakeAmountTmp = 0;  // 온도
float fakeAmountHum = 0;  // 습도
float fakeAmountDst = 0;  // 미세먼지 


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

  // 라떼판다로부터 메시지 전달 받음 
  if(Serial.available()){
    String cmdMsg = "";       // cmd 예시 : AIR_ON 
    cmdMsg = Serial.readString();
    Serial.println(cmdMsg);
    
    if(cmdMsg.equals("AIR_ON")){
      isAutoOnAir = true;
    } else if(cmdMsg.equals("AIR_OFF")){
      isAutoOnAir = false;
    } else if(cmdMsg.equals("HUM_ON")){
      isAutoOnHum = true;
    } else if(cmdMsg.equals("HUM_OFF")){
      isAutoOnHum = false;
    } else if(cmdMsg.equals("AIRCL_ON")){
      isAutoOnAircl = true;
    } else if(cmdMsg.equals("AIRCL_OFF")){
      isAutoOnAircl = false;
    }

  }

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

    // 자동제어 on 시 fake 데이터 반영
    if(isAutoOnAir){
      fakeAmountTmp += 0.1;
      tmp -= fakeAmountTmp;
    } else { fakeAmountTmp = 0; }

    if(isAutoOnAircl){
      fakeAmountDst += 1;
      ugm3 -= fakeAmountDst;
    } else { fakeAmountDst = 0; }
    
    if(isAutoOnHum){
      fakeAmountHum += 0.1;
      hum -= fakeAmountHum;
    } else { fakeAmountHum = 0; }

    // 출력
    Serial.print("$");  // start char
    Serial.print("tmp");Serial.print(tmp);
    Serial.print(";hum");Serial.print(hum);
    Serial.print(";dst");Serial.print(ugm3);
    Serial.print(";lgt");Serial.print(analogRead(lightPin));
    Serial.print(";^\n"); // end char    
    
    lowpulseoccupancy = 0;
    starttime = millis();
  }
}
