# semi

### 🐸 모든 프로젝트는 `Server.java` 실행이 선행되어야 함!

### 🐤 프로젝트 실행 전 환경설정 필!

* 루트폴더의 `my.properties` 에서 각 로컬 환경에 맞는 IP, Port 번호 등 입력해주세요.

* [my.properties](https://github.com/multicampus4/semi/blob/master/my.properties)

  ```properties
  # TCP/IP Main Server IP & Port
  tcpipIp = 192.168.0.0
  tcpipPort = 5253
  	
  # WebSocket IP & Port (Spring)
  # AWS : 3.35.240.16
  websocketIp = 192.168.0.0
  websocketPort = 88
  	
  # Arduino Serial Port (ex. COM5)
  serialPort = COM5
  
  # Oracle IP
  oracleHostname = database-1.chookpxses6b.ap-northeast-2.rds.amazonaws.com
  oracleId = admin
  oraclePwd = 2020final
  
  #Hive IP
  hiveHostname = 3.35.240.16:10000
  hiveId = root
  hivePwd = 111111
  ```

* 적용되는 프로젝트 목록

  * SensorSwitch
  * Server
  * can
  * chat2

## 🐽 세미프로젝트 기준 시점

세미프로젝트 마지막 커밋 id : `d5c9d764ddf335663c32ff0f833dbb7726798a6a`

이 시점으로 돌아려면

```bash
git reset --hard d5c9d764ddf335663c32ff0f833dbb7726798a6a
```



## 🐋층별 구역 센서 및 디바이스 명칭

- 센서

  ![센서](https://user-images.githubusercontent.com/24764210/100413044-a6c5dc80-30b9-11eb-852e-ea2dac9db163.PNG) 

- 디바이스

  ![디바이스](https://user-images.githubusercontent.com/24764210/100413047-a75e7300-30b9-11eb-9d87-533d9b47589f.PNG) 

- **ON, OFF 명령**은 뒤에 _ON 또는 _OFF를 붙입니다. 

  예) 1_A_D_AIR_ON

​    