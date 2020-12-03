<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script type="text/javascript" src="./assets/scripts/main_ws.js"></script></body>

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
			        max: 200,
			        title: {
			            text: 'Speed'
			        }
			    },
			    credits: {
			        enabled: false
			    },
			    series: [{ 
			        name: 'Speed',
			        data:data,
			        dataLabels: {
			            format:
			                '<div style="text-align:center">' +
			                '<span style="font-size:25px">{y}</span><br/>' +
			                '<span style="font-size:12px;opacity:0.4">km/h</span>' +
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
			        max: 200,
			        title: {
			            text: 'Speed'
			        }
			    },
			    credits: {
			        enabled: false
			    },
			    series: [{ 
			        name: 'Speed',
			        data:data,
			        dataLabels: {
			            format:
			                '<div style="text-align:center">' +
			                '<span style="font-size:25px">{y}</span><br/>' +
			                '<span style="font-size:12px;opacity:0.4">km/h</span>' +
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
			            text: 'Speed'
			        }
			    },
			    credits: {
			        enabled: false
			    },
			    series: [{ 
			        name: 'Speed',
			        data:data,
			        dataLabels: {
			            format:
			                '<div style="text-align:center">' +
			                '<span style="font-size:25px">{y}</span><br/>' +
			                '<span style="font-size:12px;opacity:0.4">km/h</span>' +
			                '</div>'
			        },
			        tooltip: {
			            valueSuffix: ' km/h'
			        }
			    }]
			}
		)
	); 
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
			        max: 200,
			        title: {
			            text: 'Speed'
			        }
			    },
			    credits: {
			        enabled: false
			    },
			    series: [{ 
			        name: 'Speed',
			        data:data,
			        dataLabels: {
			            format:
			                '<div style="text-align:center">' +
			                '<span style="font-size:25px">{y}</span><br/>' +
			                '<span style="font-size:12px;opacity:0.4">km/h</span>' +
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
 function getDustSat(){
		$.ajax({
			url:'getdata2.mc',
			success:function(data){
			/* console.log(data[2].y);
			datas = data[2].y; */
				displayDustSat(data);
				//alert(data2);
			},
			error:function(){
			}
		});
		displayDustSat();
}
function getTempAvg(){
		$.ajax({
			url:'getdata3.mc',
			//alert(123)
			success:function(data){
				displayTempAvg(data);
			},
			error:function(){
				}
		});
		displayTempAvg();
	}

function getHumAvg(){
	$.ajax({
		url:'getdata1.mc',
		//alert(123)
		success:function(data){
			displayHumAvg(data);
		},
		error:function(){
			}
	});
	displayHumAvg();
}
function getLightAvg(){
	$.ajax({
		url:'getdata2.mc',
		//alert(123)
		success:function(data){
			
			displayLightAvg(data);
			
		},
		error:function(){
		}
	});
	displayLightAvg();
}
 $(document).ready(function(){
	  getTempAvg();
	  getHumAvg();
	  getDustSat();
	  getLightAvg();
	});
</script>
<div class="row">
	<div class="col-md-12 col-lg-6">
		<div class="main-card mb-3 card">
			<div class="card-header">
				현재 실내 온도 
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
				현재 실내 습도 
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
				현재 실내 미세먼지 농도  
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
				현재 실내 조도
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
		<div class="card mb-3 widget-content bg-arielle-smile">
			<div class="widget-content-wrapper text-white">
				<div class="widget-content-left">
					<div class="widget-heading">Clients</div>
					<div class="widget-subheading">Total Clients Profit</div>
				</div>
				<div class="widget-content-right">
					<div class="widget-numbers text-white">
						<span>$ 568</span>
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
	<div class="col-md-12">
		<div class="main-card mb-3 card">
			<!-- 실시간 차트 영역 -->
			<div class="card-header">
				실시간차트 :: 지진 모니터링 
			</div>
			<div class="tab-content">
				<figure class="highcharts-figure">
					<div id="hcontainer"></div>
				</figure>
			</div>
			<div class="tab-content">
				데모 데이터 전송 : <input id="chatting" value='{ "tmp":"28", "hum":"80" }'>
				<button onclick="send()" id="sendBtn">보내기</button>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12 col-lg-6">
		<div class="mb-3 card">
			<div class="card-header-tab card-header-tab-animation card-header">
				<div class="card-header-title">
					<i class="header-icon lnr-apartment icon-gradient bg-love-kiss">
					</i> Sales Report
				</div>
				<ul class="nav">
					<li class="nav-item"><a href="javascript:void(0);"
						class="active nav-link">Last</a></li>
					<li class="nav-item"><a href="javascript:void(0);"
						class="nav-link second-tab-toggle">Current</a></li>
				</ul>
			</div>
			<div class="card-body">
				<div class="tab-content">
					<div class="tab-pane fade show active" id="tabs-eg-77">
						<div class="card mb-3 widget-chart widget-chart2 text-left w-100">
							<div class="widget-chat-wrapper-outer">
								<div
									class="widget-chart-wrapper widget-chart-wrapper-lg opacity-10 m-0">
									<canvas id="canvas"></canvas>
								</div>
							</div>
						</div>
						<h6
							class="text-muted text-uppercase font-size-md opacity-5 font-weight-normal">Top
							Authors</h6>
						<div class="scroll-area-sm">
							<div class="scrollbar-container">
								<ul
									class="rm-list-borders rm-list-borders-scroll list-group list-group-flush">
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<img width="42" class="rounded-circle"
														src="assets/images/avatars/9.jpg" alt="">
												</div>
												<div class="widget-content-left">
													<div class="widget-heading">Ella-Rose Henry</div>
													<div class="widget-subheading">Web Developer</div>
												</div>
												<div class="widget-content-right">
													<div class="font-size-xlg text-muted">
														<small class="opacity-5 pr-1">$</small> <span>129</span> <small
															class="text-danger pl-2"> <i
															class="fa fa-angle-down"></i>
														</small>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<img width="42" class="rounded-circle"
														src="assets/images/avatars/5.jpg" alt="">
												</div>
												<div class="widget-content-left">
													<div class="widget-heading">Ruben Tillman</div>
													<div class="widget-subheading">UI Designer</div>
												</div>
												<div class="widget-content-right">
													<div class="font-size-xlg text-muted">
														<small class="opacity-5 pr-1">$</small> <span>54</span> <small
															class="text-success pl-2"> <i
															class="fa fa-angle-up"></i>
														</small>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<img width="42" class="rounded-circle"
														src="assets/images/avatars/4.jpg" alt="">
												</div>
												<div class="widget-content-left">
													<div class="widget-heading">Vinnie Wagstaff</div>
													<div class="widget-subheading">Java Programmer</div>
												</div>
												<div class="widget-content-right">
													<div class="font-size-xlg text-muted">
														<small class="opacity-5 pr-1">$</small> <span>429</span> <small
															class="text-warning pl-2"> <i
															class="fa fa-dot-circle"></i>
														</small>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<img width="42" class="rounded-circle"
														src="assets/images/avatars/3.jpg" alt="">
												</div>
												<div class="widget-content-left">
													<div class="widget-heading">Ella-Rose Henry</div>
													<div class="widget-subheading">Web Developer</div>
												</div>
												<div class="widget-content-right">
													<div class="font-size-xlg text-muted">
														<small class="opacity-5 pr-1">$</small> <span>129</span> <small
															class="text-danger pl-2"> <i
															class="fa fa-angle-down"></i>
														</small>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<img width="42" class="rounded-circle"
														src="assets/images/avatars/2.jpg" alt="">
												</div>
												<div class="widget-content-left">
													<div class="widget-heading">Ruben Tillman</div>
													<div class="widget-subheading">UI Designer</div>
												</div>
												<div class="widget-content-right">
													<div class="font-size-xlg text-muted">
														<small class="opacity-5 pr-1">$</small> <span>54</span> <small
															class="text-success pl-2"> <i
															class="fa fa-angle-up"></i>
														</small>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-6">
		<div class="mb-3 card">
			<div class="card-header-tab card-header">
				<div class="card-header-title">
					<i class="header-icon lnr-rocket icon-gradient bg-tempting-azure">
					</i> Bandwidth Reports
				</div>
				<div class="btn-actions-pane-right">
					<div class="nav">
						<a href="javascript:void(0);"
							class="border-0 btn-pill btn-wide btn-transition active btn btn-outline-alternate">Tab
							1</a> <a href="javascript:void(0);"
							class="ml-1 btn-pill btn-wide border-0 btn-transition  btn btn-outline-alternate second-tab-toggle-alt">Tab
							2</a>
					</div>
				</div>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade active show" id="tab-eg-55">
					<div class="widget-chart p-3">
						<div style="height: 350px">
							<canvas id="line-chart"></canvas>
						</div>
						<div class="widget-chart-content text-center mt-5">
							<div class="widget-description mt-0 text-warning">
								<i class="fa fa-arrow-left"></i> <span class="pl-1">175.5%</span>
								<span class="text-muted opacity-8 pl-1">increased server
									resources</span>
							</div>
						</div>
					</div>
					<div class="pt-2 card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="widget-content">
									<div class="widget-content-outer">
										<div class="widget-content-wrapper">
											<div class="widget-content-left">
												<div class="widget-numbers fsize-3 text-muted">63%</div>
											</div>
											<div class="widget-content-right">
												<div class="text-muted opacity-6">Generated Leads</div>
											</div>
										</div>
										<div class="widget-progress-wrapper mt-1">
											<div
												class="progress-bar-sm progress-bar-animated-alt progress">
												<div class="progress-bar bg-danger" role="progressbar"
													aria-valuenow="63" aria-valuemin="0" aria-valuemax="100"
													style="width: 63%;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="widget-content">
									<div class="widget-content-outer">
										<div class="widget-content-wrapper">
											<div class="widget-content-left">
												<div class="widget-numbers fsize-3 text-muted">32%</div>
											</div>
											<div class="widget-content-right">
												<div class="text-muted opacity-6">Submitted Tickers</div>
											</div>
										</div>
										<div class="widget-progress-wrapper mt-1">
											<div
												class="progress-bar-sm progress-bar-animated-alt progress">
												<div class="progress-bar bg-success" role="progressbar"
													aria-valuenow="32" aria-valuemin="0" aria-valuemax="100"
													style="width: 32%;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="widget-content">
									<div class="widget-content-outer">
										<div class="widget-content-wrapper">
											<div class="widget-content-left">
												<div class="widget-numbers fsize-3 text-muted">71%</div>
											</div>
											<div class="widget-content-right">
												<div class="text-muted opacity-6">Server Allocation</div>
											</div>
										</div>
										<div class="widget-progress-wrapper mt-1">
											<div
												class="progress-bar-sm progress-bar-animated-alt progress">
												<div class="progress-bar bg-primary" role="progressbar"
													aria-valuenow="71" aria-valuemin="0" aria-valuemax="100"
													style="width: 71%;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="widget-content">
									<div class="widget-content-outer">
										<div class="widget-content-wrapper">
											<div class="widget-content-left">
												<div class="widget-numbers fsize-3 text-muted">41%</div>
											</div>
											<div class="widget-content-right">
												<div class="text-muted opacity-6">Generated Leads</div>
											</div>
										</div>
										<div class="widget-progress-wrapper mt-1">
											<div
												class="progress-bar-sm progress-bar-animated-alt progress">
												<div class="progress-bar bg-warning" role="progressbar"
													aria-valuenow="41" aria-valuemin="0" aria-valuemax="100"
													style="width: 41%;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
							<div class="widget-numbers mt-0 fsize-3 text-danger">71%</div>
						</div>
						<div class="widget-content-right w-100">
							<div class="progress-bar-xs progress">
								<div class="progress-bar bg-danger" role="progressbar"
									aria-valuenow="71" aria-valuemin="0" aria-valuemax="100"
									style="width: 71%;"></div>
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
