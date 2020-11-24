<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%@page import="org.apache.log4j.*"%>

<%
	// http 온도데이터
	String data = request.getParameter("data");
	System.out.println("data(jsp) : " +  data);
	
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
				<button type="button" tabindex="0" class="dropdown-item">Menus</button>
				<button type="button" tabindex="0" class="dropdown-item">Settings</button>
				<h6 tabindex="-1" class="dropdown-header">Header</h6>
				<button type="button" tabindex="0" class="dropdown-item">Actions</button>
				<div tabindex="-1" class="dropdown-divider"></div>
				<button type="button" tabindex="0" class="dropdown-item">Dividers</button>
			</div>
		</div>
	</div>
	<div class="main-card mb-3 card">
		<div class="card-header">
			<i class="header-icon lnr-gift icon-gradient bg-grow-early"> </i>Header
			Tabs Standard Buttons
			<div class="btn-actions-pane-right">
				<div class="nav">
					<a data-toggle="tab" href="#tab-eg4-0"
						class="border-0 btn-pill btn-wide btn-transition active btn btn-outline-danger">Tab
						1</a> <a data-toggle="tab" href="#tab-eg4-1"
						class="mr-1 ml-1 btn-pill btn-wide border-0 btn-transition  btn btn-outline-danger">Tab
						2</a> <a data-toggle="tab" href="#tab-eg4-2"
						class="border-0 btn-pill btn-wide btn-transition  btn btn-outline-danger">Tab
						3</a>
						<a data-toggle="tab" href="#tab-eg4-0"
						class="border-0 btn-pill btn-wide btn-transition btn btn-outline-danger">Tab
						4</a>
						<a data-toggle="tab" href="#tab-eg4-0"
						class="border-0 btn-pill btn-wide btn-transition btn btn-outline-danger">Tab
						5</a>
						<a data-toggle="tab" href="#tab-eg4-0"
						class="border-0 btn-pill btn-wide btn-transition btn btn-outline-danger">Tab
						6</a>
						<a data-toggle="tab" href="#tab-eg4-0"
						class="border-0 btn-pill btn-wide btn-transition btn btn-outline-danger">Tab
						7</a>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="tab-content">
				<div class="tab-pane active" id="tab-eg4-0" role="tabpanel">
					<p>It was popularised in the 1960s with the release of Letraset
						sheets containing Lorem Ipsum passages, and more recently with
						desktop publishing software like Aldus PageMaker including
						versions of Lorem Ipsum.</p>
				</div>
				<div class="tab-pane" id="tab-eg4-1" role="tabpanel">
					<p>Like Aldus PageMaker including versions of Lorem. It has
						survived not only five centuries, but also the leap into
						electronic typesetting, remaining essentially unchanged.</p>
				</div>
				<div class="tab-pane" id="tab-eg4-2" role="tabpanel">
					<p>Lorem Ipsum has been the industry's standard dummy text ever
						since the 1500s, when an unknown printer took a galley of type and
						scrambled it to make a type specimen book. It has survived not
						only five centuries, but also the leap into electronic
						typesetting, remaining essentially unchanged.</p>
				</div>
			</div>
		</div>
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