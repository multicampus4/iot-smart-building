#include<Wire.h>

const int MPU = 0x68; //MPU 6050 의 I2C 기본 주소
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;
// 이전 가속도 초기화
int16_t before_AcX;
int16_t before_AcY;
int16_t before_AcZ;
String state;
void setup() {
  //  pinMode(13,OUTPUT);
  Wire.begin();      //Wire 라이브러리 초기화
  Wire.beginTransmission(MPU); //MPU로 데이터 전송 시작
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     //MPU-6050 시작 모드로
  Wire.endTransmission(true);
  Serial.begin(9600);
}

void loop() {
  Wire.beginTransmission(MPU);    //데이터 전송시작
  Wire.write(0x3B);               // register 0x3B (ACCEL_XOUT_H), 큐에 데이터 기록
  Wire.endTransmission(false);    //연결유지
  Wire.requestFrom(MPU, 14, true); //MPU에 데이터 요청
  //데이터 한 바이트 씩 읽어서 반환
  AcX = Wire.read() << 8 | Wire.read(); // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  AcY = Wire.read() << 8 | Wire.read(); // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  AcZ = Wire.read() << 8 | Wire.read(); // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
  //  Tmp=Wire.read()<<8|Wire.read();  // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
  //  GyX=Wire.read()<<8|Wire.read();  // 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  //  GyY=Wire.read()<<8|Wire.read();  // 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  //  GyZ=Wire.read()<<8|Wire.read();  // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)

  //시리얼 모니터에 출력 ( 첫번째 )
  //  Serial.print("AcX = ");
  //  Serial.print(AcX);Serial.print(",");
  //  Serial.print(" | AcY = ");
  //  Serial.print(AcY);Serial.print(",");
  //  Serial.print(" | AcZ = ");
  //  Serial.println(AcZ);
  //  Serial.print(" | Tmp = "); Serial.print(Tmp/340.00+36.53);
  //  Serial.print(" | GyX = "); Serial.print(GyX);
  //  Serial.print(" | GyY = "); Serial.print(GyY);
  //  Serial.print(" | GyZ = "); Serial.println(GyZ);

  // 가속도 차 계산 & 절대값
  int diff_x = abs(before_AcX - AcX); //Serial.print("abs_diff_X: ");Serial.println(diff_x);
  int diff_y = abs(before_AcY - AcY); //Serial.print("abs_diff_Y: ");Serial.println(diff_y);
  int diff_z = abs(before_AcZ - AcZ); //Serial.print("abs_diff_Z: ");Serial.println(diff_z);
  if ((1000 <= diff_x && diff_x < 3000) || (1000 <= diff_y && diff_y < 3000) || (1000 <= diff_z && diff_z < 3000)) {
    state = "A";
  } else if ((3000 <= diff_x && diff_x < 5000) || (3000 <= diff_y && diff_y < 5000) || (3000 <= diff_z && diff_z < 5000)) {
    state = "B";
  } else if ((5000 <= diff_x) || (5000 <= diff_y) || (5000 <= diff_z)) {
    state = "C";
  } else {
    state = "N";
  }
  Serial.print("AcX");
  Serial.print(AcX);
  Serial.print(";AcY");
  Serial.print(AcY);
  Serial.print(";AcZ");
  Serial.print(AcZ);
  Serial.print(";dng");
  Serial.println(state);

  // 가속도 값 물려받기
  before_AcX = AcX;
  before_AcY = AcY;
  before_AcZ = AcZ;
  delay(1000);
}


