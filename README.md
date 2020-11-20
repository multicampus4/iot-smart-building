# semi

### 🐸 모든 프로젝트는 `Server.java` 실행이 선행되어야 함!

### 🐤 `can` `chat2` 실행 전 환경설정 필!

`com.properties.My.java` 에서 각 로컬 환경에 맞는 IP, Port 번호 등 입력해주세요!

```java
public class My {
	// 로컬 서버-클라이언트 IP주소 & 포트
	private String localIp = "192.168.0.6";		// 로컬 ip주소 입력. 예 ) 192.168.1.1
	private int localPort = 5253;				// TCP/IP 서버의 포트번호. 예) 5555
	
	// 웹소켓 IP주소
	// AWS : 3.35.240.16
	private String websocketIp = "192.168.0.6";	// 연결할 웹소켓의 ip주소 입력. 예 ) 192.168.1.1
	private int websocektPort = 88;				// 웹소켓의 포트 번호. 예 ) 88
	
	// 아두이노 시리얼 포트 넘버
	private String serialPort = "COM5";			// 아두이노 시리얼 포트. 예) COM5
```



