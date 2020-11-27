<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>WebSocket Data</title>
	<style>
		.container{
			width: 800px;
			margin: 0 auto;
			padding: 25px
		}
		.container h2{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.containerBottom{
			width: 500px;
			height: 100px;
			margin: 0 auto;
			padding: 25px
		}
		.btn1{
			float: left;
		}
		.btn2{
			float: left;
		}
		.btn3{
			float:left;
		}
		.innerContainer0{
			width: 30%;
			float: left;
			margin: 0 auto;
			padding: 5px
		}
		.innerContainer1{
			width: 30%;
			float: left;
			margin: 0 auto;
			padding: 5px
		}
		.innerContainer2{
			width: 30%;
			float: left;
			margin: 0 auto;
			padding: 5px
		}
		.chatting{
			background-color: #000;
			width: 100%;
			height: 500px;
			overflow: auto;
		}
		.chatting p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	
	$(document).ready(function(){
		wsOpen();
		$("#yourMsg").show();
	});

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chatting");
		wsEvt();
	}
		
	function wsEvt() {
		// onopen: 웹 소켓이 열리면 호출
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		// onmessage: 메시지가 도착하면 호출
		ws.onmessage = function(data) {
			var msg = data.data;
			$("#chatting0").prepend("<p>" + msg + "</p>");
			var obj = JSON.parse(msg);
			
			// ex: { "tmp":"28", "hum":"80" }
			
			if(msg != null && msg.trim() != ''){
				$("#chatting1").prepend("<p>" + obj.tmp + "</p>");
				$("#chatting2").prepend("<p>" + obj.hum + "</p>");
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function send() {
		var msg = $("#chatting").val();
		ws.send(msg);
		$('#chatting').val("");
	}
	
	// 버튼 상태 변경(DB연결)
	function setButtonState(){
		<c:forEach var="d" items="${devicelist}">
			// on인 상태일 때 버튼 색상 유지
			<c:choose>
			    <c:when test="${d.DEVICE_STAT eq 'ON'}">
				    $("#${d.DEVICE_ID}").addClass('active');
					$("#${d.DEVICE_ID}").css('background-color', '#3ac47d');
			    </c:when>
			</c:choose>
			
			$("#${d.DEVICE_ID}").text("${d.DEVICE_STAT}");
		</c:forEach>
	}
	
	$(document).ready(function() {
		setButtonState();
		// Buttons Action for TCP/IP Cmd
		$('#ledStart').click(function() {
			$.ajax({
				url : 'ledStart',
				success : function(data) {
					//alert('LED START...');
				}
			});
		});
		
		$('#ledStop').click(function() {
			$.ajax({
				url : 'ledStop',
				success : function(data) {
					//alert('LED STOP...');
				}
			});
		});
		$('#alert').click(function(){
			$.ajax({
				url:'alert',
				success:function(data){
					alert('Send Complete...');
				}
			});
		});
		
	});
	
</script>
<body>

<%@ page import="org.apache.log4j.*" %>
<%
	// http 온도데이터
	String data = request.getParameter("data");
	System.out.println("data(jsp) : " +  data);
	
	Logger LOGGER = Logger.getLogger("temp");
	LOGGER.info(data);
	
%>

	<!-- 층별 제어 화면 -->
	<div class="app-main__inner">
		<jsp:include page="controlFloors.jsp"></jsp:include>
	</div>

	<div id="container" class="container">
		<div class="innerContainer0">
			<h2>raw data</h2>
			<div id="chatting0" class="chatting"></div>
		</div>
		<div class="innerContainer1">
			<h2>센서1: 온도</h2>
			<div id="chatting1" class="chatting"></div>
		</div>
		<div class="innerContainer2">
			<h2>센서2: 습도</h2>
			<div id="chatting2" class="chatting"></div>
		</div>
	</div>



	<div id="container" class="containerBottom">
		<div class="btn1">
			<a class="btn" id="ledStart" href="#">LED START</a>
		</div>
		<div class="btn2">
			<a class="btn" id="ledStop" href="#">LED STOP</a>
		</div>
		<div class="btn3">
			<a class="btn" id= "alert" href = "#">Alert</a>
		</div>
		
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>Data from Arduino</th>
					<th><input id="chatting" value='{ "tmp":"28", "hum":"80" }'></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>