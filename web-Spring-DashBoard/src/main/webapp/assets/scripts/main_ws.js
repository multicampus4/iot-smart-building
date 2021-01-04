/**
 * 메인 페이지 : 지진 데이터 실시간 차트
 * WebSocket + Hichart 
 */

var chart;
var ws;

$(document).ready(function() {
	wsOpen();
	chart = new Highcharts.chart('hcontainer', {

		title : {
			text : 'Logarithmic axis demo'
		},

		xAxis : {
			tickInterval : 1,
			type : 'logarithmic',
			accessibility : {
				rangeDescription : 'Range: 1 to 10'
			}
		},

		yAxis : {
			type : 'logarithmic',
			minorTickInterval : 0.1,
			accessibility : {
				rangeDescription : 'Range: 0.1 to 1000'
			}
		},

		tooltip : {
			headerFormat : '<b>{series.name}</b><br />',
			pointFormat : 'x = {point.x}, y = {point.y}'
		},

		series : [ {
			data : [ 28, 22, 24, 28, 16, 32, 24, 28, 25, 22 ],
			pointStart : 1
		} ]
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

			chart.series[0].addPoint(parseFloat(obj.tmp), true, true);
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