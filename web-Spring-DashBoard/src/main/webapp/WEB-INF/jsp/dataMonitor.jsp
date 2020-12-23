<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/btn.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<meta charset="UTF-8">
	<title>WebSocket Data</title>
	<style>
	.container h2 {
		text-align: left;
		padding: 5px 5px 5px 15px;
		color: #FFBB00;
		border-left: 3px solid #FFBB00;
		margin-bottom: 20px;
	}
	
	.containerBottom {
		width: 500px;
		height: 100px;
		margin: 0 auto;
		padding: 25px
	}
	
	.btn1 {
		float: left;
	}
	
	.btn2 {
		float: left;
	}
	
	.btn3 {
		float: left;
	}
	
	.innerContainer0 {
		width: 30%;
		float: left;
		margin: 0 auto;
		padding: 5px
	}
	
	.innerContainer1 {
		width: 30%;
		float: left;
		margin: 0 auto;
		padding: 5px
	}
	
	.innerContainer2 {
		width: 30%;
		float: left;
		margin: 0 auto;
		padding: 5px
	}
	
	.chatting {
		background-color: #000;
		width: 100%;
		height: 500px;
		overflow: auto;
	}
	
	.chatting p {
		color: #fff;
		text-align: left;
	}
	
	input {
		width: 330px;
		height: 25px;
	}
	
	#yourMsg {
		display: none;
	}
	
	.highcharts-figure, .highcharts-data-table table {
		min-width: 360px;
		max-width: 800px;
		margin: 1em auto;
	}
	
	.highcharts-data-table table {
		font-family: Verdana, sans-serif;
		border-collapse: collapse;
		border: 1px solid #EBEBEB;
		margin: 10px auto;
		text-align: center;
		width: 100%;
		max-width: 500px;
	}
	
	.highcharts-data-table caption {
		padding: 1em 0;
		font-size: 1.2em;
		color: #555;
	}
	
	.highcharts-data-table th {
		font-weight: 600;
		padding: 0.5em;
	}
	
	.highcharts-data-table td, .highcharts-data-table th,
		.highcharts-data-table caption {
		padding: 0.5em;
	}
	
	.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
		{
		background: #f8f8f8;
	}
	
	.highcharts-data-table tr:hover {
		background: #f1f7ff;
	}
	</style>
</head>

<script type="text/javascript">
	var ws;
	var chart;
	var ranges = [
        [14.3, 27.7],
        [14.5, 27.8],
        [11.6, 21.8]
    ];
	$(document).ready(function() {
		wsOpen();
		$("#yourMsg").show();
		
		chart = new Highcharts.chart('hcontainer', {
			  title: {
			    text: '온도'
			  },
			  xAxis: {
			    tickInterval: 1,
			    type: 'logarithmic',
			    accessibility: {
			      rangeDescription: 'Range: 1 to 10'
			    }
			  },
			  yAxis: {
				min: 20,
				max: 30,
			    minorTickInterval: 0.1,
			    accessibility: {
			      rangeDescription: 'Range: 0.1 to 1000'
			    },
			  },
			  
			  tooltip: {
			    headerFormat: '<b>{series.name}</b><br />',
			    pointFormat: 'x = {point.x}, y = {point.y}'
			  },
			  series: [{
			    data: [24, 22, 24, 26, 22, 24, 24, 23, 25, 22, 23, 21, 23],
			    pointStart: 1
			  }]
			});
		
		chart2 = new Highcharts.chart('hcontainer2', {
			  title: {
			    text: '습도'
			  },
			  xAxis: {
			    tickInterval: 1,
			    type: 'logarithmic',
			    accessibility: {
			      rangeDescription: 'Range: 1 to 10'
			    }
			  },
			  yAxis: {
				min: -10,
				max: 40,
			    minorTickInterval: 0.1,
			    accessibility: {
			      rangeDescription: 'Range: 0.1 to 1000'
			    },
			  },
			  
			  tooltip: {
			    headerFormat: '<b>{series.name}</b><br />',
			    pointFormat: 'x = {point.x}, y = {point.y}'
			  },
			  series: [{
			    data: [21, 22, 24, 28, 16, 32, 24, 28, 25, 22, 24, 25, 21],
			    pointStart: 1
			  }]
			});
		
		
		
	});
	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/chatting");
		wsEvt();
	}
	function wsEvt() {
		// onopen: 웹 소켓이 열리면 호출
		ws.onopen = function(data) {
			//소켓이 열리면 초기화 세팅하기
		}
		// onmessage: 메시지가 도착하면 호출
		ws.onmessage = function(data) {
			var msg = data.data;
			$("#chatting0").prepend("<p>" + msg + "</p>");
			var obj = JSON.parse(msg);
			// ex: { "tmp":"28", "hum":"80" }
			if (msg != null && msg.trim() != '') {
				$("#chatting1").prepend("<p>" + obj.tmp + "</p>");
				$("#chatting2").prepend("<p>" + obj.hum + "</p>");
				
				if(obj.tmp != null)
					chart.series[0].addPoint(parseFloat(obj.tmp), true, true);
				if(obj.hum != null)
					chart2.series[0].addPoint(parseFloat(obj.hum), true, true);
			}
		}
		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
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
		$('#alert').click(function() {
			$.ajax({
				url : 'alert',
				success : function(data) {
					alert('Send Complete...');
				}
			});
		});
	});
	
	
	
</script>
<body>

	<figure class="highcharts-figure">
		<div id="hcontainer"></div>
	</figure>
	
	<figure class="highcharts-figure">
		<div id="hcontainer2"></div>
	</figure>

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

	<div class="card mb-3 widget-content bg-midnight-bloom">
		<div class="widget-content-wrapper text-white">
			<div class="widget-content-left">
				<div class="widget-heading">Total Orders</div>
				<div class="widget-subheading">Last year expenses</div>
			</div>
			<div class="widget-content-right">
				<div class="widget-numbers text-white">
					<span>1896</span>
				</div>
			</div>
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