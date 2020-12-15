<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/btn.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/earthquakeGraph.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<meta charset="UTF-8">
<title>WebSocket Data</title>
</head>

<script type="text/javascript">
	var ws;
	var chart;
	var obj = null;

	$(document).ready(function() {
		wsOpen();
		$("#yourMsg").show();
		chart = new Highcharts.chart('hcontainer', {
			chart: {
		        type: 'spline',
		        animation: Highcharts.svg, // don't animate in old IE
		        marginRight: 10,
		        events: {
		            load: 
		            	function () {
		        		chart = new Highcharts.chart('hcontainer', {
		        			chart: {
		        		        type: 'spline',
		        		        animation: Highcharts.svg, // don't animate in old IE
		        		        marginRight: 10,
		        		        events: {
		        		            load: 
		        		            	function () {
		        		                // set up the updating of the chart each second
		        			                var series = this.series[0];
		        			                setInterval(function () {
		        			                    var x = (new Date()).getTime(), // current time
		        			                        y = parseFloat(obj.AcX);
		        			                    series.addPoint([x, y], true, true);
		        			                }, 1000);
		        		            }
		        		        }
		        		    },

		        			  title: {
		        			    text: 'Logarithmic axis demo'
		        			  },

		        			  xAxis: {
		        				tickPixelInterval: 150,
		        			    type: 'datetime'
		        			  },
		        			  yAxis: {
		        			        title: {
		        			            text: 'AcX'
		        			        },
		        			        plotLines: [{
		        			            value: 0,
		        			            width: 1,
		        			            color: '#808080'
		        			        }]
		        			    }, 
		        			  accessibility: {
		        			        announceNewData: {
		        			            enabled: true,
		        			            minAnnounceInterval: 15000,
		        			            announcementFormatter: function (allSeries, newSeries, newPoint) {
		        			                if (newPoint) {
		        			                    return 'New point added. Value: ' + newPoint.y;
		        			                }
		        			                return false;
		        			            }
		        			        }
		        			    },
		        			    time: {
		        			        useUTC: false
		        			    },
		        			  tooltip: {
		        			    headerFormat: '<b>{series.name}</b><br />',
		        			    pointFormat: 'x = {point.x}, y = {point.y}'
		        			  },

		        			  series: [{
		        			        name: 'Random data',
		        			        data: (function () {
		        			            // generate an array of random data
		        			            var data = [],
		        			                time = (new Date()).getTime(),
		        			                i;

		        			            for (i = -19; i <= 0; i += 1) {
		        			                data.push({
		        			                    x: time + i * 1000,
		        			                    y: 0
		        			                });
		        			            }
		        			            return data;
		        			        })
		        			    }]
		        			});		                // set up the updating of the chart each second
		            }
		        }
		    },

			  title: {
			    text: 'Logarithmic axis demo'
			  },

			  xAxis: {
				tickPixelInterval: 150,
			    type: 'datetime'
			  },
			  yAxis: {
			        title: {
			            text: 'AcX'
			        },
			        plotLines: [{
			            value: 0,
			            width: 1,
			            color: '#808080'
			        }]
			    }, 
			  accessibility: {
			        announceNewData: {
			            enabled: true,
			            minAnnounceInterval: 15000,
			            announcementFormatter: function (allSeries, newSeries, newPoint) {
			                if (newPoint) {
			                    return 'New point added. Value: ' + newPoint.y;
			                }
			                return false;
			            }
			        }
			    },
			    time: {
			        useUTC: false
			    },
			  tooltip: {
			    headerFormat: '<b>{series.name}</b><br />',
			    pointFormat: 'x = {point.x}, y = {point.y}'
			  },

			  series: [{
			        name: 'Random data',
			        data: (function () {
			            // generate an array of random data
			            var data = [],
			                time = (new Date()).getTime(),
			                i;

			            for (i = -19; i <= 0; i += 1) {
			                data.push({
			                    x: time + i * 1000,
			                    y: 0
			                });
			            }
			            return data;
			        }())
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
			console.log(msg);
			$("#chatting0").prepend("<p>" + msg + "</p>");
			obj = JSON.parse(msg);
			// ex: { "tmp":"28", "hum":"80" }

			if (msg != null && msg.trim() != '') {
				$("#chatting1").prepend("<p>" + obj.AcX + "</p>");
				$("#chatting2").prepend("<p>" + obj.AcY + "</p>");
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
	
</script>
<body>

	<figure class="highcharts-figure">
		<div id="hcontainer"></div>
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