const int tempPin = A0;
const int ledPin = A2;

String deviceName = "";   // AIR
String deviceAction = ""; // ON

boolean runAir = false;

float fakeAmountTmp = 0;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  delay(2000);
  
  // 온도 센서
  int data = analogRead(tempPin);
  float temp = ((5.0 * data) / 1024.0) * 100;
  
  
  if(Serial.available()){
    String cmdMsg = "";       // cmd 예시 : AIR_ON 
    cmdMsg = Serial.readString();
    Serial.println(cmdMsg);
    // Split(cmdMsg, '_');
    if(cmdMsg.equals("AIR_ON")){
      runAir = true;
    } else if(cmdMsg.equals("AIR_OFF")){
      runAir = false;
    }

  }

  if(runAir == true){
    Serial.println("AIRCON_ON");
    fakeAmountTmp += 0.2;
    temp -= fakeAmountTmp;
    Serial.println(fakeAmountTmp);
  } else if(runAir == false){
    fakeAmountTmp = 0;
  }
  Serial.print("tmp");
  Serial.print(temp);
  
/*
  if(deviceName.equals("AIR")){
      if(deviceAction.equals("ON")){
        Serial.println("AIRCON_ON");
        fakeAmountTmp += 0.2;
        temp -= fakeAmountTmp;
        Serial.println(fakeAmountTmp);

      } else {  // OFF
        fakeAmountTmp = 0;
      }
    }
    */
  
  // 평시 상태
  // Serial.print("tmp");
  // Serial.print(temp);
  Serial.print(";hum");
  Serial.print(temp+52.12);
   
  Serial.print(";acx");
  Serial.print(temp+1.01);
  Serial.print(";acy");
  Serial.print(temp+2.19);
  Serial.print(";acz");
  Serial.print(temp+1.84);
  Serial.print(";\n");
  
}

void Split(String sData, char cSeparator) {	
    int nCount = 0;
    int nGetIndex = 0 ;
    String sTemp = "";
    String sCopy = sData;

    while(true){
      nGetIndex = sCopy.indexOf(cSeparator);  // 구분자 찾기

      if(-1 != nGetIndex) {   // 리턴된 인덱스가 있을 경우 
        sTemp = sCopy.substring(0, nGetIndex);  // 있으면 데이터 넣고
        sCopy = sCopy.substring(nGetIndex + 1); // 뺀 데이터 만큼 잘라낸다.
        // Serial.println( sTemp ); // AIR, HUM ...
        deviceName = sTemp;

      } else {  // 없으면 end
        // Serial.println( sCopy );  // ON or OFF
        deviceAction = sCopy;
        break;
      }
      ++nCount; // 다음 문자로
    }
  }
