<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <style>
 
 .highcharts-figure .chart-container {
	width: 300px;
	height: 200px;
	/* float: none; */
	margin: 0 auto;
}

.highcharts-figure, .highcharts-data-table table {
	width: 600px;
	margin: 0 auto;
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
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

@media (max-width: 600px) {
	.highcharts-figure, .highcharts-data-table table {
		width: 100%;
	}
	.highcharts-figure .chart-container {
		width: 300px;
		float: none;
		margin: 0 auto;
	}

}
#dropbox {
width:250px;
margin:0 auto;
}

.backslash {
  background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="0" x2="100%" y2="100%" stroke="gray" /></svg>');
}
.backslash { text-align: left; }
.backslash div { text-align: right; }

th, td {
	
	padding: 5px;
	text-align: center;
}

</style>

<script type="text/javascript" >

//하루 평균 온도 값 차트 
function displayTempAvg(data){
	//alert(data[4].data[10]);
	//alert(data[0].data);
	 var gaugeOptions = {
			    chart: {
			        type: 'solidgauge'
			    },
			    title: null,
			    pane: {
			        center: ['50%', '85%'],
			        size: '140%',
			        startAngle: -90,
			        endAngle: 90,
			        background: {
			            backgroundColor:
			                Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
			            innerRadius: '60%',
			            outerRadius: '100%',
			            shape: 'arc'
			        }
			    },
			    exporting: {
			        enabled: false
			    },
			    tooltip: {
			        enabled: false
			    },
			    // the value axis
			    yAxis: {
			        stops: [
			            [1.5, '#FA5858'] //red
			            /* [0.5, ''], // yellow
			            [0.9, '#DF5353'] */ // red
			        ],
			        lineWidth: 0,
			        tickWidth: 0,
			        minorTickInterval: null,
			        tickAmount: 2,
			        title: {
			            y: -70
			        },
			        labels: {
			            y: 16
			        }
			    },
			    plotOptions: {
			        solidgauge: {
			            dataLabels: {
			                y: 5,
			                borderWidth: 0,
			                useHTML: true
			            }
			        }
			    }
			};
	 
			var chartdust = Highcharts.chart('daytemp', Highcharts.merge(gaugeOptions, {
			    yAxis: {
			        min: 0,
			        max:40,
			        title: {
			            text: 'Temperature'
			        }
			    },
			    credits: {
			        enabled: false
			    },
			    series: [{
			        name: 'Speed',
			        //data:[data[0].data[1]] 행 배열로 받은 경우,
			        data:[data[0].data[10]],
			        dataLabels: {
			            format:
			                '<div style="text-align:center">' +
			                '<span style="font-size:25px">{y}</span><br/>' +
			                '<span style="font-size:12px;opacity:0.4">°C</span>' +
			                '</div>'
			        },
			        tooltip: {
			            valueSuffix: 'c'
			        }
			    }]
			})); 
} 

//하루 평균 습도 차트 
 function displayHumAvg(data){
	
	 var gaugeOptions = {
			    chart: {
			        type: 'solidgauge'
			    },

			    title: null,

			    pane: {
			        center: ['50%', '85%'],
			        size: '140%',
			        startAngle: -90,
			        endAngle: 90,
			        background: {
			            backgroundColor:
			                Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
			            innerRadius: '60%',
			            outerRadius: '100%',
			            shape: 'arc'
			        }
			    },

			    exporting: {
			        enabled: false
			    },

			    tooltip: {
			        enabled: false
			    },

			    // the value axis
			    yAxis: {
			        stops: [
			            [1.5, '#FFFF00'] //yellow
			            /* [0.5, ''], // yellow
			            [0.9, '#DF5353'] */ // red
			        ],
			        lineWidth: 0,
			        tickWidth: 0,
			        minorTickInterval: null,
			        tickAmount: 2,
			        title: {
			            y: -70
			        },
			        labels: {
			            y: 16
			        }
			    },

			    plotOptions: {
			        solidgauge: {
			            dataLabels: {
			                y: 5,
			                borderWidth: 0,
			                useHTML: true
			            }
			        }
			    }
			};

			
			     
			
			var chartdust = Highcharts.chart('dayhumid', Highcharts.merge(gaugeOptions, {
				
			    yAxis: {
			        min: 0,
			        max: 100,
			        title: {
			            text: 'Humid'
			        }
			    },

			    credits: {
			        enabled: false
			    },
             
			    series: [{ 
			    	
			        name: 'Speed',
			        
			        
			        data:[data[1].data[10]],
			   
			        
			        
			        dataLabels: {
			            format:
			                '<div style="text-align:center">' +
			                '<span style="font-size:25px">{y}</span><br/>' +
			                '<span style="font-size:12px;opacity:0.4">%</span>' +
			                '</div>'
			        },
			        tooltip: {
			            valueSuffix: ' km/h'
			        }
			    }]
			}
		)
	); 
} 
//하루 평균 미세먼지 농도 차트 
 function displayDustSat(data){
	 var gaugeOptions = {
			    chart: {
			        type: 'solidgauge'
			    },

			    title: null,

			    pane: {
			        center: ['50%', '85%'],
			        size: '140%',
			        startAngle: -90,
			        endAngle: 90,
			        background: {
			            backgroundColor:
			                Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
			            innerRadius: '60%',
			            outerRadius: '100%',
			            shape: 'arc'
			        }
			    },

			    exporting: {
			        enabled: false
			    },

			    tooltip: {
			        enabled: false
			    },

			    // the value axis
			    yAxis: {
			        stops: [
			            [1.5, '#04B404'] // green
			            /* [0.5, '#DDDF0D'], // yellow
			            [0.9, '#DF5353'] */ // red
			        ],
			        lineWidth: 0,
			        tickWidth: 0,
			        minorTickInterval: null,
			        tickAmount: 2,
			        title: {
			            y: -70
			        },
			        labels: {
			            y: 16
			        }
			    },

			    plotOptions: {
			        solidgauge: {
			            dataLabels: {
			                y: 5,
			                borderWidth: 0,
			                useHTML: true
			            }
			        }
			    }
			};

			
			     
			
			var chartdust = Highcharts.chart('dustgraph', Highcharts.merge(gaugeOptions, {
				
			    yAxis: {
			        min: 0,
			        max: 200,
			        title: {
			            text: 'FineDust'
			        }
			    },

			    credits: {
			        enabled: false
			    },
                
			    series: [{ 
			    	
			        name: 'Speed',
			        
			        
			        data:[data[2].data[10]],
			   
			        
			        
			        dataLabels: {
			            format:
			                '<div style="text-align:center">' +
			                '<span style="font-size:25px">{y}</span><br/>' +
			                '<span style="font-size:14px;opacity:0.4">㎍/㎥</span>' +
			                '</div>'
			        },
			        tooltip: {
			            valueSuffix: ' km/h'
			        }
			    }]
			   

			})); 
			
 } //console.log(data);
 
//하루 평균 조도 차트 
 function displayLightAvg(data){
	
	 var gaugeOptions = {
			    chart: {
			        type: 'solidgauge'
			    },

			    title: null,

			    pane: {
			        center: ['50%', '85%'],
			        size: '140%',
			        startAngle: -90,
			        endAngle: 90,
			        background: {
			            backgroundColor:
			                Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
			            innerRadius: '60%',
			            outerRadius: '100%',
			            shape: 'arc'
			        }
			    },

			    exporting: {
			        enabled: false
			    },

			    tooltip: {
			        enabled: false
			    },

			    // the value axis
			    yAxis: {
			        stops: [
			            [1.5, '#2E64FE'] // green
			            /* [0.5, '#DDDF0D'], // yellow
			            [0.9, '#DF5353'] */ // red
			        ],
			        lineWidth: 0,
			        tickWidth: 0,
			        minorTickInterval: null,
			        tickAmount: 2,
			        title: {
			            y: -70
			        },
			        labels: {
			            y: 16
			        }
			    },

			    plotOptions: {
			        solidgauge: {
			            dataLabels: {
			                y: 5,
			                borderWidth: 0,
			                useHTML: true
			            }
			        }
			    }
			};
			
			var chartdust = Highcharts.chart('daylight', Highcharts.merge(gaugeOptions, {
				
			    yAxis: {
			        min: 0,
			        max: 700,
			        title: {
			            text: 'Light'
			        }
			    },

			    credits: {
			        enabled: false
			    },
                
			    series: [{ 
			    	
			        name: 'Speed',
			        
			        
			        data:[data[3].data[10]],
			   
			        
			        
			        dataLabels: {
			            format:
			                '<div style="text-align:center">' +
			                '<span style="font-size:25px">{y}</span><br/>' +
			                '<span style="font-size:12px;opacity:0.4">lx(lux)</span>' +
			                '</div>'
			        },
			        tooltip: {
			            valueSuffix: ' km/h'
			        }
			    }]
			   

			})); 
			
 } 
 //시간 별 쾌적지수 그래프 출력 
 function displayTimeGph(data){
	 //alert(data[0].data)
	 var colors = Highcharts.getOptions().colors;

	 Highcharts.chart('timetempcontainer', {
	     chart: {
	         type: 'spline'
	     },

	     legend: {
	         symbolWidth: 40
	     },

	     title: {
	         text: '빌딩 내 쾌적지수'
	     },

	     subtitle: {
	         text: '빌딩 내 평균 쾌적지수'
	     },

	     yAxis: {
	         title: {
	             text: 'Percentage usage'
	         }
	     },

	     xAxis: {
	         title: {
	             text: 'Time'
	         },
	         accessibility: {
	             description: 'Time from December 2010 to September 2019'
	         },
	         categories: ['05:00', '07:00', '09:00', '11:00', '13:00', '15:00', '17:00', '19:00', '21:00', '23:00',
	        	 			'01:00','03:00']
	     },

	     tooltip: {
	         valueSuffix: '%'
	     },

	     plotOptions: {
	         series: {
	             point: {
	                 events: {
	                     click: function () {
	                         window.location.href = this.series.options.website;
	                     }
	                 }
	             },
	             cursor: 'pointer'
	         }
	     },
		
	     //dashStyle:ShortDot,Dash,ShortDashDot,
	     //각각의 데이터를 입력해야 하는데 다른 데이터 입력하는 방법 찾아보기 
	     series: [
	         {
	        	 name: '온도',
	        	 data :[data[4].data[0],data[4].data[1],data[4].data[2],data[4].data[3],
	        		 data[4].data[4],data[4].data[5],data[4].data[6],data[4].data[7],
	        		 data[4].data[8],data[4].data[9],data[4].data[10],data[4].data[11],data[4].data[12]], 
	        	 dashStyle: 'Dash',
	        	 color: colors[1]
	            
	         },
	         {
	            
	             name: '습도',
	             data: [data[5].data[0],data[5].data[1],data[5].data[2],data[5].data[3],
	        		 data[5].data[4],data[5].data[5],data[5].data[6],data[5].data[7],
	        		 data[5].data[8],data[5].data[9],data[5].data[10],data[5].data[11],data[5].data[12]],
	             dashStyle: 'ShortDash',
	             color: colors[3]
	         },
	         
	         {
	        	 name: '미세먼지',
	        	 data :[data[6].data[0],data[6].data[1],data[6].data[2],data[6].data[3],
	        		 data[6].data[4],data[6].data[5],data[6].data[6],data[6].data[7],
	        		 data[6].data[8],data[6].data[9],data[6].data[10],
	        		 data[6].data[11],data[6].data[12]],
	        	 dashStyle: 'ShortDot',
	        	 color: colors[2]
	            
	         },
	         
	         {
	        	 name: '조도',
	        	 data : [data[7].data[0],data[7].data[1],data[7].data[2],data[7].data[3],
	        		 data[7].data[4],data[7].data[5],data[7].data[6],data[7].data[7],
	        		 data[7].data[8],data[7].data[9],data[7].data[10],
	        		 data[7].data[11],data[7],data[12]],
	        	 dashStyle: 'ShortDashDot',
	        	 color: colors[4]
	            
	         }
	     ],

	     responsive: {
	         rules: [{
	             condition: {
	                 maxWidth: 550
	             },
	             chartOptions: {
	                 legend: {
	                     itemWidth: 150
	                 },
	                 /* xAxis: {
	                     categories: ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00']
	                 }, */
	                 yAxis: {
	                     title: {
	                         enabled: false
	                     },
	                     labels: {
	                         format: '{value}%'
	                     }
	                 }
	             }
	         }]
	     }
	 });
 }
 
 function displayTable(data){
	 var str='';

		for(var i=0;i<4;i++){
			//alert(data.length[4])
			
			str += '<tr>';
			str += '<td>' + data[i].name+'</td>';
			str += '<td>' + data[i].data[0]+ '</td>';
			str += '<td>' + data[i].data[1]+ '</td>';  
			str += '<td>' + data[i].data[2]+ '</td>';
			str += '<td>' + data[i].data[3]+ '</td>';
			str += '<td>' + data[i].data[4]+ '</td>';
			str += '<td>' + data[i].data[5]+ '</td>';
			str += '<td>' + data[i].data[6]+ '</td>';
			str += '<td>' + data[i].data[7]+ '</td>';
			str += '<td>' + data[i].data[8]+ '</td>';
			str += '<td>' + data[i].data[9]+ '</td>';
			str += '<td>' + data[i].data[10]+ '</td>';
			str += '<td>' + data[i].data[11]+ '</td>';
		
			str += '</tr>';
			//console.log(data)
		} 
		$('#htable').html(str);	
 }
 
 function getTimeGph(){
		$.ajax({
			url:'getTimeGph.mc',
			success:function(data){
			
				displayTimeGph(data);
				
			},
			error:function(){
				}
		});
		
	}

 function getTable(){
		$.ajax({
			url:'getTimeGph.mc',
			
			success:function(data){
				displayTable(data);
					},
			error:function(){
				}
		});

	}
 
function getDayAvg(){
		$.ajax({
			url:'getdayavg.mc',
			
			success:function(data){
				//alert(data[0].data);
				displayTempAvg(data);
				displayHumAvg(data);
				displayDustSat(data);
				displayLightAvg(data);
				//console.log(data);
			},
			error:function(){
				}
		});
		/* displayTempAvg();
		displayHumAvg();
		displayDustSat();
		displayLightAvg(); */
		
	}
 
 //body의 onclick에 의해 실행되는 함수 
 //클릭하면 아래의 함수가 호출되고 아래의 함수에 따른 데이터로 그래프와 표가 업데이트 된다.
 //추후 실제 로그데이터가 만들어지면 해당 날짜에 onclick이벤트 실행하여 해당 데이터로 업데이트 되는 함수 작성해 주면 됨 

 function getdata1130(){
		$.ajax({
			url:'getdata1130.mc',
			//alert(123)
			success:function(data){
				if(data.cmd="1"){
					displayTempAvg(data);
					displayHumAvg(data);
					displayDustSat(data);
					displayLightAvg(data);
					displayTable(data);
						console.log(data)
					}if(data.cmd="2"){
						//alert("cmd ok")
						displayTimeGph(data);
						
					} 
			},
			error:function(){
			}
		});
		$('#loading').hide();
	} 
 
 
 
 
 function getdata1201(){
		$.ajax({
			url:'getdata1201.mc',
		 
			success:function(data){
				if(data.cmd="1"){
				displayTempAvg(data);
				displayHumAvg(data);
				displayDustSat(data);
				displayLightAvg(data);
				displayTable(data);
					//console.log(data)
				}if(data.cmd="2"){
					displayTimeGph(data);
				} 
			
			},
			error:function(){}
			});
		$('#loading').hide();
 }
		/* $.ajax({
			url:'getdata1201.mc?cmd=2',
					success:function(data){
						displayTimeGph(data);
					},
					error:function(){
						
					}
		}); */
	
 
 
  function getdata1202(){
	  
	  $.ajax({
			url:'getdata1202.mc',
			//alert(123)
			success:function(data){
				if(data.cmd="1"){
					displayTempAvg(data);
					displayHumAvg(data);
					displayDustSat(data);
					displayLightAvg(data);
					displayTable(data);
						//console.log(data)
					}if(data.cmd="2"){
						//alert("cmd ok")
						displayTimeGph(data);
						
					} 
			},
			error:function(){
			}
		});
	  $('#loading').hide();
  }

 /* function getdata1204(){
		$.ajax({
			url:'getdata1204.mc',
			//alert(123)
			success:function(data){
				if(data.cmd="1"){
					displayTempAvg(data);
					displayHumAvg(data);
					displayDustSat(data);
					displayLightAvg(data);
					displayTable(data);
						//console.log(data)
					}if(data.cmd="2"){
						//alert("cmd ok")
						displayTimeGph(data);
						
					} 
			},
			error:function(){
			}
		});
	}  */
 
  function getdata1203(){
		$.ajax({
			url:'getdata1203.mc',
			//alert(123)
			success:function(data){
				if(data.cmd="1"){
					displayTempAvg(data);
					displayHumAvg(data);
					displayDustSat(data);
					displayLightAvg(data);
					displayTable(data);
						//console.log(data)
					}if(data.cmd="2"){
						//alert("cmd ok")
						displayTimeGph(data);
						
					} 
			},
			error:function(){
			}
		});
		$('#loading').hide();
	} 
  function getdata1207(){
		$.ajax({
			url:'getdata1207.mc',
			//alert(123)
			success:function(data){
				displayTempAvg(data);
				displayHumAvg(data);
				displayTable(data);
				//displayTimeTempHum(data)
				//console.log(data)
			},
			error:function(){
			}
		});
		$('#loading').hide();
	} 
  function getdata1208(){
		$.ajax({
			url:'getdata1208.mc',
			//alert(123)
			success:function(data){
				displayTempAvg(data)
				displayHumAvg(data)
				displayDustSat(data);
				displayLightAvg(data);
				//console.log(data)
			},
			error:function(){
			}
		});
		$('#loading').hide();
	} 

	$(document).ready(function() {
		var animation = bodymovin.loadAnimation({
			container : document.getElementById('lottie'), // Required
			path : 'assets/lottie/42329-christmas-tree-slider.json', // Required
			renderer : 'svg', // Required
			loop : 5, // Optional
			autoplay : true
		// Optional
		});
		
		var animation2 = bodymovin.loadAnimation({
			container : document.getElementById('lottie2'), // Required
			path : 'assets/lottie/42325-christmas-wreath-loader.json', // Required
			renderer : 'svg', // Required
			loop : 5, // Optional
			autoplay : true
		// Optional
		});
		
		var animation3 = bodymovin.loadAnimation({
			container : document.getElementById('lottie3'), // Required
			path : 'assets/lottie/42325-christmas-wreath-loader.json', // Required
			renderer : 'svg', // Required
			loop : 5, // Optional
			autoplay : true
		// Optional
		});
		
		var animation4 = bodymovin.loadAnimation({
			container : document.getElementById('lottie4'), // Required
			path : 'assets/lottie/42329-christmas-tree-slider.json', // Required
			renderer : 'svg', // Required
			loop : 5, // Optional
			autoplay : true
		// Optional
		});

		getDayAvg();
		getTable();
		getTimeGph();

	});
	
</script>
    
<body>
<div class="app-page-title">
	<div class="page-title-wrapper">
		<div class="page-title-heading">
			<div class="page-title-icon">
				<i class="pe-7s-graph icon-gradient bg-mean-fruit"> </i>
			</div>
			<div>
				<b>빅데이터 조회</b>
				<div class="page-title-subheading">
				로그기록의 일별 분석 결과를 조회하세요.</div>
			</div>
		</div>
		<div class="page-title-actions">
			<button type="button" data-toggle="tooltip" title="Example Tooltip"
				data-placement="bottom" class="btn-shadow mr-3 btn btn-dark">
				<i class="fa fa-star"></i>
			</button>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6 col-xl-4">
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
	</div>
	<div class="col-md-6 col-xl-4">
		<div class="card mb-3 widget-content bg-amy-crisp ">
			<div class="widget-content-wrapper text-white">
				<div class="text-center"> 
				<div class="mb-2 mr-2 btn-group" id="dropbox">
                   <button class="btn btn-outline-light text-white">날짜선택</button>
                   <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="dropdown-toggle-split dropdown-toggle btn btn-outline-light text-white"><span class="sr-only">Toggle Dropdown</span>
                     </button>
                        <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu">

                         <button type="button" tabindex="0" class="dropdown-item" onclick="getdata1130()">2020-11-30</button>
                         <button type="button" tabindex="0" class="dropdown-item" onclick="getdata1201()">2020-12-01</button>
                         <button type="button" tabindex="0" class="dropdown-item" onclick="getdata1202()">2020-12-02</button>
                         <button type="button" tabindex="0" class="dropdown-item" onclick="getdata1203()">2020-12-03</button> 
                         <!-- <button type="button" tabindex="0" class="dropdown-item" onclick="getdata1208()">1208</button> -->
                        
                        </div>
                   </div>
				</div>
				</div>
		</div>
	</div>
	<div class="col-md-6 col-xl-4">
		<div class="card mb-3 widget-content bg-midnight-bloom">
			<div class="widget-content-wrapper text-white">
				<div class="widget-content-left">
					<div class="widget-heading">Followers</div>
					<div class="widget-subheading">People Interested</div>
				</div>
				<div class="widget-content-right">
					<div class="widget-numbers text-white">
						<span>46%</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
<div class="col-md-12 col-lg-6">
		<div class="main-card mb-3 card">
			
			<div class="card-header">
				하루 평균 온도 
			</div>
			
			 <div class="tab-content">
			 <div id="loading" class="loading">
					<div class="loading-span-history">
						<span id="lottie"></span>
					</div>
				</div>
				<figure class="highcharts-figure">
    				<div id="daytemp" class="chart-container"></div>
				</figure>
				
			</div> 
		</div>
	</div>
	
	<div class="col-md-12 col-lg-6">
		<div class="main-card mb-3 card">
			
			<div class="card-header">
				하루 평균 습도 
			</div>
			
			 <div class="tab-content">
			 <div id="loading" class="loading">
					<div class="loading-span-history">
						<span id="lottie2"></span>
					</div>
				</div>
				<figure class="highcharts-figure">
    <div id="dayhumid" class="chart-container"></div>
				</figure>
				
			</div> 
		</div>

	</div>
	</div>
	
	
	<div class="row"> 
	 <div class="col-md-12 col-lg-6">
		<div class="main-card mb-3 card">
			<div class="card-header">
				하루 평균 미세먼지 농도  
			</div>
			
			 <div class="tab-content">
			 <div id="loading" class="loading">
					<div class="loading-span-history">
						<span id="lottie3"></span>
					</div>
				</div>
				<figure class="highcharts-figure">
					<div id="dustgraph" class="chart-container"></div>
				</figure>
			</div> 
		</div>
	</div> 
	
    <div class="col-md-12 col-lg-6">
		<div class="main-card mb-3 card">
			<div class="card-header">
				하루 평균 조도
			</div>
			<div class="tab-content">
				<div id="loading" class="loading">
					<div class="loading-span-history">
						<span id="lottie4"></span>
					</div>
				</div>
				<figure class="highcharts-figure">
					<div id="daylight" class="chart-container"></div>
				</figure>
			</div> 
		</div>
	</div>  
</div>

<div class="row">
<div class="col-md-12 ">
		<div class="main-card mb-3 card">
			
			<div class="card-header">
			    시간별 평균 쾌적지수  
			</div>
			
			 <div class="tab-content">
				<figure class="highcharts-figure">
					<div id="timetempcontainer"></div>
				</figure>
			</div> 
		</div>
	</div>
</div>

	<div class="row">
		<div class="col-md-12">
			<div class="main-card mb-3 card">
				<div class="card-body table-responsive">
					<h5 class="card-title">Table bordered</h5>
					<table class="mb-0 table table-bordered">
						<thead>
							<tr>
								<th class='backslash'><div>시간</div>센서</th>

								<th>05:00</th>
								<th>07:00</th>
								<th>09:00</th>
								<th>11:00</th>
								<th>13:00</th>
								<th>15:00</th>
								<th>17:00</th>
								<th>19:00</th>
								<th>21:00</th>
								<th>23:00</th>
								<th>01:00</th>
								<th>03:00</th>
							</tr>
						</thead>
						<tbody id="htable">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>