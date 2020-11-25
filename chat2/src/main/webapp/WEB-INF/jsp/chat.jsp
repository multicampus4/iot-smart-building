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
	
	$(document).ready(function() {
		// Buttons Action for TCP/IP Cmd
		$('#alert').click(function(){
			$.ajax({
				url:'alert',
				success:function(data){
					alert('Send Complete...');
				}
			});
		});
		$('#f1').click(function(){
			$.ajax({
				url:'f1',
				success:function(data){
					console.log("111");
				}
			});
		});
		$('#f2').click(function(){
			$.ajax({
				url:'f2',
				success:function(data){
					console.log("222");
				}
			});
		});
		
	});
	
</script>
<body>

<%@page import="org.apache.log4j.*"%>

<%
	// http 온도데이터
	String data = request.getParameter("data");
	System.out.println("data(jsp) : " +  data);
	
	// 층별 화면 전환 확인용
	String floorpage = request.getParameter("floorpage");
	System.out.println("floorpage : " +  floorpage);
	
	Logger LOGGER = Logger.getLogger("temp");
	LOGGER.info(data);
%>
	<div class="layers-dropdown">
		<div class="dropdown d-inline-block">
			<button type="button" aria-haspopup="true" aria-expanded="false"
				data-toggle="dropdown"
				class="mb-2 mr-2 dropdown-toggle btn btn-secondary">Secondary</button>
			<div tabindex="-1" role="menu" aria-hidden="true"
				class="dropdown-menu">
				<button type="button" tabindex="0" class="dropdown-item" id="f1">Floor_1</button>
				<button type="button" tabindex="0" class="dropdown-item" id="f2">Floor_2</button>
				<h6 tabindex="-1" class="dropdown-header">Header</h6>
				<button type="button" tabindex="0" class="dropdown-item">Actions</button>
				<div tabindex="-1" class="dropdown-divider"></div>
				<button type="button" tabindex="0" class="dropdown-item">Dividers</button>
			</div>
		</div>
	</div>

	<div class="app-main__inner">
		<c:choose>
			<c:when test="${floorpage == null}">
				<jsp:include page="f1.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="${floorpage}"></jsp:include>
			</c:otherwise>
		</c:choose>
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