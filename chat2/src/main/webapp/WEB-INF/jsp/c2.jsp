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
	//alert(data[1].data[1]);
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
			            [1.5, '#DF5353'] //red
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
			        data:[data[0].data],
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
			            [1.5, '#DDDF0D'] //yellow
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
			        
			        
			        data:[data[1].data],
			   
			        
			        
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
			            [1.5, '#8041D9'] // green
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
			        
			        
			        data:[data[2].data],
			   
			        
			        
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
			            [1.5, '#8041D9'] // green
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
			        max: 4000,
			        title: {
			            text: 'Light'
			        }
			    },

			    credits: {
			        enabled: false
			    },
                
			    series: [{ 
			    	
			        name: 'Speed',
			        
			        
			        data:[data[3].data],
			   
			        
			        
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
	         categories: ['01:00', '03:00', '05:00', '07:00', '09:00', '11:00', '13:00', '15:00', '17:00', '19:00', '21:00', '23:00']
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
	        		 data[4].data[8],data[4].data[9],data[4].data[10]], 
	        	 dashStyle: 'Dash',
	        	 color: colors[1]
	            
	         },
	         {
	            
	             name: '습도',
	             data: [data[5].data[0],data[5].data[1],data[5].data[2],data[5].data[3],
	        		 data[5].data[4],data[5].data[5],data[5].data[6],data[5].data[7],
	        		 data[5].data[8],data[5].data[9],data[5].data[10]],
	             dashStyle: 'ShortDash',
	             color: colors[3]
	         },
	         
	         {
	        	 name: '미세먼지',
	        	 data :[data[6].data[0],data[6].data[1],data[6].data[2],data[6].data[3],
	        		 data[6].data[4],data[6].data[5],data[6].data[6],data[6].data[7],
	        		 data[6].data[8],data[6].data[9],data[6].data[10]],
	        	 dashStyle: 'ShortDot',
	        	 color: colors[2]
	            
	         },
	         
	         {
	        	 name: '조도',
	        	 //data : [35.6, 21.5, 14.2, 41.8, 24.2, 10.4], 
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
	                 xAxis: {
	                     categories: ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00']
	                 },
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

	/*  $.each(data, function(index,item){
			
		});  */
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

			str += '</tr>';
		}); 
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
			url:'getdatatable.mc',
			
			success:function(data){
				displayTable(data);
	        //alert(data)

	        //console.log(data)
					},
			error:function(){
				}
		});

	}
 
function getDayAvg(){
		$.ajax({
			url:'getdata1204.mc',
			
			success:function(data){
				//alert(data[0].data);
				displayTempAvg(data);
				displayHumAvg(data);
				displayDustSat(data);
				displayLightAvg(data);
				console.log(data);
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
			error:function(){
			}
			
				});
		/* $.ajax({
			url:'getdata1201.mc?cmd=2',
					success:function(data){
						displayTimeGph(data);
					},
					error:function(){
						
					}
		}); */
	} 
 
 
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
						console.log(data)
					}if(data.cmd="2"){
						//alert("cmd ok")
						displayTimeGph(data);
						
					} 
			},
			error:function(){
			}
		});
  }

 function getdata1204(){
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
	} 
 
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
				console.log(data)
			},
			error:function(){
			}
		});
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
				console.log(data)
			},
			error:function(){
			}
		});
	} 
$(document).ready(function(){

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
				<i class="pe-7s-car icon-gradient bg-mean-fruit"> </i>
			</div>
			<div>
				Analytics Dashboard
				<div class="page-title-subheading">This is an example
					dashboard created using build-in elements and components.</div>
			</div>
		</div>
		<div class="page-title-actions">
			<button type="button" data-toggle="tooltip" title="Example Tooltip"
				data-placement="bottom" class="btn-shadow mr-3 btn btn-dark">
				<i class="fa fa-star"></i>
			</button>
			<!-- <div class="d-inline-block dropdown">
				<button type="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"
					class="btn-shadow dropdown-toggle btn btn-info">
					<span class="btn-icon-wrapper pr-2 opacity-7"> <i
						class="fa fa-business-time fa-w-20"></i>
					</span> 날짜선택
				</button>
				<div tabindex="-1" role="menu" aria-hidden="true"
					class="dropdown-menu dropdown-menu-right">
					<ul class="nav flex-column">
					
					
					
					월요일을 누르면 월요일에 해당되는 데이터가 출력되고 
					     화요일을 누르면 화요일에 해당되는 데이터 출력하기
					
						<li class="nav-item"><a href="javascript:void(0);"
							
							
							<li class="nav-link"> <i class="nav-link-icon lnr-book"></i> 
									<span class= "paragragh"onclick="getMon()" >
									월요일
									
									
									</span>
									
								<div class="ml-auto badge badge-pill badge-danger">80</div>
						</a></li></li>
						
						
						
						<li class="nav-item"><a href="javascript:void(0);"
							class="nav-link"> <i class="nav-link-icon lnr-book" onclick="getTue"></i> <span>
									화요일 </span>
								<div class="ml-auto badge badge-pill badge-danger">5</div>
						</a></li>
						
						<li class="nav-item"><a href="javascript:void(0);"
							class="nav-link"> <i class="nav-link-icon lnr-picture"></i> <span>
									Picture </span>
						</a></li>
						<li class="nav-item"><a disabled href="javascript:void(0);"
							class="nav-link disabled"> <i
								class="nav-link-icon lnr-file-empty"></i> <span> File
									Disabled </span>
						</a></li>
						
						
						
						
						
					</ul>
				</div>
			</div>
			 -->
			
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
		<div class="card mb-3 widget-content bg-secondary ">
			<div class="widget-content-wrapper text-white">
				<div class="widget-content-left">
				
				<div class="mb-2 mr-2 btn-group" id="dropbox">
                   <button class="btn btn-secondary">날짜선택</button>
                     <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="dropdown-toggle-split dropdown-toggle btn btn-secondary"><span class="sr-only">Toggle Dropdown</span>
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
		<div class="card mb-3 widget-content bg-grow-early">
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
	<div class="d-xl-none d-lg-block col-md-6 col-xl-4">
		<div class="card mb-3 widget-content bg-premium-dark">
			 <div class="widget-content-wrapper text-white">
				<div class="widget-content-left">
					<div class="widget-heading">Products Sold</div>
					<div class="widget-subheading">Revenue streams</div>
				</div>
				<div class="widget-content-right">
					<div class="widget-numbers text-warning">
						<span>$14M</span>
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
				<figure class="highcharts-figure">
    				<div id="daytemp" class="chart-container"></div>
				</figure>
				<button type="button" id="PopoverCustomT-1"
				        class="btn btn-primary btn-sm" >Details</button>
			</div> 
		</div>
	</div>
	
	<div class="col-md-12 col-lg-6">
		<div class="main-card mb-3 card">
			
			<div class="card-header">
				하루 평균 습도 
			</div>
			
			 <div class="tab-content">
				<figure class="highcharts-figure">
    <div id="dayhumid" class="chart-container"></div>
				</figure>
				<button type="button" id="PopoverCustomT-1"
									class="btn btn-primary btn-sm" >Details</button>
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
                                    <div class="card-body"><h5 class="card-title">Table bordered</h5>
                                        <table class="mb-0 table table-bordered">
                                            <thead>
                                            <tr>
                                                <th class='backslash'><div>시간</div>센서</th>
                                                <th>01:00</th>
                                                <th>03:00</th>
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
                                            </tr>
                                           </thead>
                                          <tbody id="htable">
                                            
                   
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            </div>


<div class="row">
	<div class="col-md-6 col-xl-4">
		<div class="card mb-3 widget-content">
			<div class="widget-content-outer">
				<div class="widget-content-wrapper">
					<div class="widget-content-left">
						<div class="widget-heading">Total Orders</div>
						<div class="widget-subheading">Last year expenses</div>
					</div>
					<div class="widget-content-right">
						<div class="widget-numbers text-success">1896</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-xl-4">
		<div class="card mb-3 widget-content">
			<div class="widget-content-outer">
				<div class="widget-content-wrapper">
					<div class="widget-content-left">
						<div class="widget-heading">Products Sold</div>
						<div class="widget-subheading">Revenue streams</div>
					</div>
					<div class="widget-content-right">
						<div class="widget-numbers text-warning">$3M</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-xl-4">
		<div class="card mb-3 widget-content">
			<div class="widget-content-outer">
				<div class="widget-content-wrapper">
					<div class="widget-content-left">
						<div class="widget-heading">Followers</div>
						<div class="widget-subheading">People Interested</div>
					</div>
					<div class="widget-content-right">
						<div class="widget-numbers text-danger">45,9%</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-xl-none d-lg-block col-md-6 col-xl-4">
		<div class="card mb-3 widget-content">
			<div class="widget-content-outer">
				<div class="widget-content-wrapper">
					<div class="widget-content-left">
						<div class="widget-heading">Income</div>
						<div class="widget-subheading">Expected totals</div>
					</div>
					<div class="widget-content-right">
						<div class="widget-numbers text-focus">$147</div>
					</div>
				</div>
				<div class="widget-progress-wrapper">
					<div class="progress-bar-sm progress-bar-animated-alt progress">
						<div class="progress-bar bg-info" role="progressbar"
							aria-valuenow="54" aria-valuemin="0" aria-valuemax="100"
							style="width: 54%;"></div>
					</div>
					<div class="progress-sub-label">
						<div class="sub-label-left">Expenses</div>
						<div class="sub-label-right">100%</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="main-card mb-3 card">
			<div class="card-header">
				Active Users
				<div class="btn-actions-pane-right">
					<div role="group" class="btn-group-sm btn-group">
						<button class="active btn btn-focus">Last Week</button>
						<button class="btn btn-focus">All Month</button>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table
					class="align-middle mb-0 table table-borderless table-striped table-hover">
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th>Name</th>
							<th class="text-center">City</th>
							<th class="text-center">Status</th>
							<th class="text-center">Actions</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center text-muted">#345</td>
							<td>
								<div class="widget-content p-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left mr-3">
											<div class="widget-content-left">
												<img width="40" class="rounded-circle"
													src="assets/images/avatars/4.jpg" alt="">
											</div>
										</div>
										<div class="widget-content-left flex2">
											<div class="widget-heading">John Doe</div>
											<div class="widget-subheading opacity-7">Web Developer</div>
										</div>
									</div>
								</div>
							</td>
							<td class="text-center">Madrid</td>
							<td class="text-center">
								<div class="badge badge-warning">Pending</div>
							</td>
							<td class="text-center">
								<button type="button" id="PopoverCustomT-1"
									class="btn btn-primary btn-sm">Details</button>
							</td>
						</tr>
						<tr>
							<td class="text-center text-muted">#347</td>
							<td>
								<div class="widget-content p-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left mr-3">
											<div class="widget-content-left">
												<img width="40" class="rounded-circle"
													src="assets/images/avatars/3.jpg" alt="">
											</div>
										</div>
										<div class="widget-content-left flex2">
											<div class="widget-heading">Ruben Tillman</div>
											<div class="widget-subheading opacity-7">Etiam sit amet
												orci eget</div>
										</div>
									</div>
								</div>
							</td>
							<td class="text-center">Berlin</td>
							<td class="text-center">
								<div class="badge badge-success">Completed</div>
							</td>
							<td class="text-center">
								<button type="button" id="PopoverCustomT-2"
									class="btn btn-primary btn-sm">Details</button>
							</td>
						</tr>
						<tr>
							<td class="text-center text-muted">#321</td>
							<td>
								<div class="widget-content p-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left mr-3">
											<div class="widget-content-left">
												<img width="40" class="rounded-circle"
													src="assets/images/avatars/2.jpg" alt="">
											</div>
										</div>
										<div class="widget-content-left flex2">
											<div class="widget-heading">Elliot Huber</div>
											<div class="widget-subheading opacity-7">Lorem ipsum
												dolor sic</div>
										</div>
									</div>
								</div>
							</td>
							<td class="text-center">London</td>
							<td class="text-center">
								<div class="badge badge-danger">In Progress</div>
							</td>
							<td class="text-center">
								<button type="button" id="PopoverCustomT-3"
									class="btn btn-primary btn-sm">Details</button>
							</td>
						</tr>
						<tr>
							<td class="text-center text-muted">#55</td>
							<td>
								<div class="widget-content p-0">
									<div class="widget-content-wrapper">
										<div class="widget-content-left mr-3">
											<div class="widget-content-left">
												<img width="40" class="rounded-circle"
													src="assets/images/avatars/1.jpg" alt="">
											</div>
										</div>
										<div class="widget-content-left flex2">
											<div class="widget-heading">Vinnie Wagstaff</div>
											<div class="widget-subheading opacity-7">UI Designer</div>
										</div>
									</div>
								</div>
							</td>
							<td class="text-center">Amsterdam</td>
							<td class="text-center">
								<div class="badge badge-info">On Hold</div>
							</td>
							<td class="text-center">
								<button type="button" id="PopoverCustomT-4"
									class="btn btn-primary btn-sm">Details</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="d-block text-center card-footer">
				<button class="mr-2 btn-icon btn-icon-only btn btn-outline-danger">
					<i class="pe-7s-trash btn-icon-wrapper"> </i>
				</button>
				<button class="btn-wide btn btn-success">Save</button>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6 col-lg-3">
		<div
			class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card">
			<div class="widget-content">
				<div class="widget-content-outer">
					<div class="widget-content-wrapper">
						<div class="widget-content-left pr-2 fsize-1">
							<div class="widget-numbers mt-0 fsize-3 text-danger" id=dustavg></div>
						</div>
						<div class="widget-content-right w-100">
							<div class="progress-bar-xs progress">
								<div class="progress-bar bg-danger" role="progressbar"
									aria-valuenow="71" aria-valuemin="0" aria-valuemax="100"
									style="width: 50%;"></div>
							</div>
						</div>
					</div>
					<div class="widget-content-left fsize-1">
						<div class="text-muted opacity-6">Income Target</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-lg-3">
		<div
			class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card">
			<div class="widget-content">
				<div class="widget-content-outer">
					<div class="widget-content-wrapper">
						<div class="widget-content-left pr-2 fsize-1">
							<div class="widget-numbers mt-0 fsize-3 text-success">54%</div>
						</div>
						<div class="widget-content-right w-100">
							<div class="progress-bar-xs progress">
								<div class="progress-bar bg-success" role="progressbar"
									aria-valuenow="54" aria-valuemin="0" aria-valuemax="100"
									style="width: 54%;"></div>
							</div>
						</div>
					</div>
					<div class="widget-content-left fsize-1">
						<div class="text-muted opacity-6">Expenses Target</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-lg-3">
		<div
			class="card-shadow-warning mb-3 widget-chart widget-chart2 text-left card">
			<div class="widget-content">
				<div class="widget-content-outer">
					<div class="widget-content-wrapper">
						<div class="widget-content-left pr-2 fsize-1">
							<div class="widget-numbers mt-0 fsize-3 text-warning">32%</div>
						</div>
						<div class="widget-content-right w-100">
							<div class="progress-bar-xs progress">
								<div class="progress-bar bg-warning" role="progressbar"
									aria-valuenow="32" aria-valuemin="0" aria-valuemax="100"
									style="width: 32%;"></div>
							</div>
						</div>
					</div>
					<div class="widget-content-left fsize-1">
						<div class="text-muted opacity-6">Spendings Target</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-lg-3">
		<div
			class="card-shadow-info mb-3 widget-chart widget-chart2 text-left card">
			<div class="widget-content">
				<div class="widget-content-outer">
					<div class="widget-content-wrapper">
						<div class="widget-content-left pr-2 fsize-1">
							<div class="widget-numbers mt-0 fsize-3 text-info">89%</div>
						</div>
						<div class="widget-content-right w-100">
							<div class="progress-bar-xs progress">
								<div class="progress-bar bg-info" role="progressbar"
									aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"
									style="width: 89%;"></div>
							</div>
						</div>
					</div>
					<div class="widget-content-left fsize-1">
						<div class="text-muted opacity-6">Totals Target</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
