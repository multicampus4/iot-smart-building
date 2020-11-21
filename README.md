# semi

### 🐸 모든 프로젝트는 `Server.java` 실행이 선행되어야 함!

### 🐤 프로젝트 실행 전 환경설정 필!

* 루트폴더의 `my.properties` 에서 각 로컬 환경에 맞는 IP, Port 번호 등 입력해주세요.

* [my.properties](https://github.com/multicampus4/semi/blob/master/my.properties)

  ```properties
  # TCP/IP 서버-클라이언트 IP주소 & 포트
  tcpipIp = 192.168.0.6
  tcpipPort = 5253
  	
  # 웹소켓 IP주소
  # AWS : 3.35.240.16
  websocketIp = 192.168.0.6
  websocketPort = 88
  	
  # 아두이노 시리얼 포트 넘버 (ex. COM5)
  serialPort = COM5
  ```

* 적용되는 프로젝트 목록

  * SensorSwitch
  * Server
  * can
  * chat2



