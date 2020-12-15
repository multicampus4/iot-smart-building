#include <DHT11.h>
#include<Wire.h>
// 핀설정
const int temphumPin = A0;
const int dustPin = A1;
const int lightPin = A2;

// 가속도센서 설정
const int MPU=0x68;  //MPU 6050 의 I2C 기본 주소
int16_t AcX,AcY,AcZ,Tmp,GyX,GyY,GyZ;
// 이전 가속도 초기화
int16_t before_AcX;
int16_t before_AcY;
int16_t before_AcZ;

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

  //가속도 센서 처리
  Wire.begin();      //Wire 라이브러리 초기화
  Wire.beginTransmission(MPU); //MPU로 데이터 전송 시작
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     //MPU-6050 시작 모드로
  Wire.endTransmission(true); 
}

void loop() {
  delay(500);
  // 가속도 센서
  Wire.beginTransmission(MPU);    //데이터 전송시작
  Wire.write(0x3B);               // register 0x3B (ACCEL_XOUT_H), 큐에 데이터 기록
  Wire.endTransmission(false);    //연결유지
  Wire.requestFrom(MPU,14,true);  //MPU에 데이터 요청
  //데이터 한 바이트 씩 읽어서 반환
  AcX=Wire.read()<<8|Wire.read();  // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)    
  AcY=Wire.read()<<8|Wire.read();  // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  AcZ=Wire.read()<<8|Wire.read();  // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
  // 출력 (1)
  Serial.print("AcX");Serial.print(AcX); 
  Serial.print(";AcY");Serial.print(AcY); 
  Serial.print(";AcZ");Serial.print(AcZ);
  if(before_AcX-AcX!=0 || before_AcY-AcY!=0 || before_AcY-AcY!=0){
  // 가속도 차 계산 & 절대값
  int diff_x = abs(before_AcX-AcX);//Serial.print("abs_diff_X: ");Serial.println(diff_x);
  int diff_y = abs(before_AcY-AcY);//Serial.print("abs_diff_Y: ");Serial.println(diff_y);
  int diff_z = abs(before_AcZ-AcZ);//Serial.print("abs_diff_Z: ");Serial.println(diff_z);
  Serial.print(";dng");
  // 지진 상태 판단
  if((1000<=diff_x && diff_x<3000)||(1000<=diff_y && diff_y<3000)||(1000<=diff_z && diff_z<3000)){
    Serial.println("aaa");
  }else if((3000<=diff_x && diff_x<5000)||(3000<=diff_y && diff_y<5000)||(3000<=diff_z && diff_z<5000)){
    Serial.println("bbb");
  }else if((5000<=diff_x)||(5000<=diff_y)||(5000<=diff_z)){
    Serial.println("ccc");
  }else{
    Serial.println("normal");
  }
  // 가속도 값 물려받기
  before_AcX = AcX;
  before_AcY = AcY;
  before_AcZ = AcZ;
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

    // 출력
    Serial.print("tmp");
    Serial.print(tmp);
    Serial.print(";hum");
    Serial.print(hum);
    Serial.print(";dst");
    Serial.print(ugm3);
    Serial.print(";lgt");
    Serial.println(analogRead(lightPin));
    
    lowpulseoccupancy = 0;
    starttime = millis();
  }
}
