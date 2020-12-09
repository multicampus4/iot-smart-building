<div class="main-card mb-1 card m-10">
	<div class="card-header">
		<i class="header-icon lnr-gift icon-gradient bg-grow-early"> </i>The
		Floor View
		<div class="btn-actions-pane-right">
			<div class="nav">
				<a data-toggle="tab" href="#tab-eg4-0"
					class="border-0 btn-pill btn-wide btn-transition active btn btn-outline-danger">Floor 1</a>
				<a data-toggle="tab" href="#tab-eg4-1"
					class="mr-1 ml-1 btn-pill btn-wide border-0 btn-transition  btn btn-outline-danger">Floor 2</a>
			</div>
		</div>
	</div>

	<!-- tab contents (Real-time Data, ON/OFF Button) -->
	<div class="card-body">
		<div class="tab-content">

			<!-- 1층 -->
			<div class="tab-pane active" id="tab-eg4-0" role="tabpanel">
				<div class="row">
					<div class="col-md-12">

						<!-- A구역 실시간 데이터 -->
						<div class="mb-1 mr-1 badge badge-pill bg-asteroid text-white">Area  A</div>
						<div class="row text-center">
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">TEMPERATURE</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_TEMP">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">HUMIDITY</div>
											<div class="widget-subheading">(&#37;)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_HUM">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">FINE DUST</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_DUST">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">AMBIENT LIGHT</div>
											<div class="widget-subheading">(lx)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_1_A_S_ILLM">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- A구역 제어 버튼 -->
						<div class="main-card mb-1 text-center">
							<div class="card-body table-responsive">
								<table class="mb-0 table">
									<thead>
										<tr>
											<th>AIR CONDITIONER</th>
											<th>HUMIDIFIER</th>
											<th>AIR CLEANER</th>
											<th>LED</th>
											<th>ELECTRICITY</th>
											<th>WATER</th>
											<th>GAS</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_A_D_AIR"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_A_D_HUM"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_A_D_AIRCL"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_A_D_LED"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_A_D_ELEC"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_A_D_WAT"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_A_D_GAS"> <span class="slider round"></span>
												</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="divider"></div>

						<!-- B구역 실시간 데이터 -->
						<div class="mb-1 mr-1 badge badge-pill bg-asteroid text-white">Area  B</div>
						<div class="row text-center">
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">TEMPERATURE</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_1_B_S_TEMP">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">HUMIDITY</div>
											<div class="widget-subheading">(&#37;)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_1_B_S_HUM">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">FINE DUST</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_1_B_S_DUST">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">AMBIENT LIGHT</div>
											<div class="widget-subheading">(lx)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_1_B_S_ILLM">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- B구역 제어 버튼 -->
						<div class="main-card mb-1 text-center">
							<div class="card-body table-responsive pb-0">
								<table class="mb-0 table">
									<thead>
										<tr>
											<th>AIR CONDITIONER</th>
											<th>HUMIDIFIER</th>
											<th>AIR CLEANER</th>
											<th>LED</th>
											<th>ELECTRICITY</th>
											<th>WATER</th>
											<th>GAS</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_B_D_AIR"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_B_D_HUM"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_B_D_AIRCL"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_B_D_LED"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_B_D_ELEC"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_B_D_WAT"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="1_B_D_GAS"> <span class="slider round"></span>
												</label>
											</td>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
				
				<!-- 평면도 -->
				<div class="fp-wrap">
					<div class="fp-image">
						<img src="images/floorPlan.jpg" alt="">
					</div>

					<!-- 1_A tooltip-->
					<div class="Area_1A">
						<div class="con-tooltip right" id="tt_1_A">
							<div class="tooltip">
								TEMPERATURE :
								<p id="1_A_S_TEMP"></p>
								HUMIDITY :
								<p id="1_A_S_HUM"></p>
								FINE DUST :
								<p id="1_A_S_DUST"></p>
								AMBIENT LIGHT :
								<p id="1_A_S_ILLM"></p>
							</div>
						</div>
					</div>
					
					<!-- 1_B tooltip-->
					<div class="Area_1B">
						<div class="con-tooltip right" id="tt_1_B">
							<div class="tooltip">
								TEMPERATURE :
								<p id="1_B_S_TEMP"></p>
								HUMIDITY :
								<p id="1_B_S_HUM"></p>
								FINE DUST :
								<p id="1_B_S_DUST"></p>
								AMBIENT LIGHT :
								<p id="1_B_S_ILLM"></p>
							</div>
						</div>
					</div>
					
				</div> <!-- End wrap -->
			</div> <!-- End tab-eg4-0 -->

			<!-- 2층 -->
			<div class="tab-pane" id="tab-eg4-1" role="tabpanel">
				<div class="row">
					<div class="col-md-12">
						
						<!-- A구역 실시간 데이터 -->
						<div class="mb-1 mr-1 badge badge-pill bg-asteroid text-white">Area  A</div>
						<div class="row text-center">
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">TEMPERATURE</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_2_A_S_TEMP">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">HUMIDITY</div>
											<div class="widget-subheading">(&#37;)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_2_A_S_HUM">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">FINE DUST</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_2_A_S_DUST">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">AMBIENT LIGHT</div>
											<div class="widget-subheading">(lx)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers text-white" id="P_2_A_S_ILLM">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- A구역 제어 버튼 -->
						<div class="main-card mb-1 text-center">
							<div class="card-body table-responsive">
								<table class="mb-0 table">
									<thead>
										<tr>
											<th>AIR CONDITIONER</th>
											<th>HUMIDIFIER</th>
											<th>AIR CLEANER</th>
											<th>LED</th>
											<th>ELECTRICITY</th>
											<th>WATER</th>
											<th>GAS</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<label class="switch"> <input type="checkbox"
													id="2_A_D_AIR"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="2_A_D_HUM"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="2_A_D_AIRCL"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="2_A_D_LED"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="2_A_D_ELEC"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="2_A_D_WAT"> <span class="slider round"></span>
												</label>
											</td>
											<td>
												<label class="switch"> <input type="checkbox"
													id="2_A_D_GAS"> <span class="slider round"></span>
												</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>



<script>
	// ON, OFF AJAX
	function execAjax(stat, device) {
		$.ajax({
			url : stat,
			data : {
				"device" : device
			},
			success : function(data) {
			}
		});
	};

	$(document).ready(function() {

		var stat;
		var device;

		// on, off button control
		$("input[type='checkbox']").click(function(){
			device = $(this).attr('id');
			if ($(this).is(":checked")) {
				stat = 'ON';
			}else{
				stat = 'OFF';
			}
			execAjax(stat, device);
		});

	});
</script>

<style>
.sensordata {
	background-color: #f1f3f5;
}

/* on, off 토글 버튼 css */
/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .2s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

/* 평면도 css */
.fp-wrap {
	width: 40%;
	margin: 10px auto;
	border: 1px solid #000000;
	position: relative;
}
.fp-wrap img {
	width: 100%;
	vertical-align: middle;
}

/* 구역별 css - 위치 설정 */
.Area_1A {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 25%;
	left: 55%;
	transform: translate( -30%, -50% );
}
.Area_1B {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 60%;
	left: 20%;
	transform: translate( -30%, -50% );
}

/*tooltip Box*/
.con-tooltip {

  width: 20px;
  height: 20px;
  border-radius: 50%;
  cursor: pointer;
  float: left;
  transition: all 0.2s;

}

/*tooltip */
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
  
  visibility: hidden;
  z-index: 1;
  opacity: .40;
  
  width: 400%;
  padding: 0px 20px;

  background: #333;
  color: #E086D3;
  
  position: absolute;
  top:-140%;
  left: -25%;
  
  border-radius: 9px;
  font: 16px;

  transform: translateY(9px);
  transition: all 0.3s ease-in-out;
  
  box-shadow: 0 0 3px rgba(56, 54, 54, 0.86);
}

/* tooltip  after*/
.tooltip::after {
  content: " ";
  width: 0;
  height: 0;
  
  border-style: solid;
  border-width: 12px 12.5px 0 12.5px;
  border-color: #333 transparent transparent transparent;

  position: absolute;
  left: 40%;

}

/* tooltip 보이기 */
.con-tooltip:hover .tooltip{
  visibility: visible;
  transform: translateY(-10px);
  opacity: 1;
  transition: .3s linear;
  animation: odsoky 1s ease-in-out infinite  alternate;

}

/* tooltip 방향 (오른쪽 ) */
.right .tooltip { top:-130%; left:115%; }

.right .tooltip::after{
  top:40%;
  left:-12%;
  transform: rotate(90deg);
}


/* 색상 변경 애니메이션 css */
.con-tooltip:nth-child(1) {
  background: #3399ff;
  animation: k1 1.75s 1s ease-out infinite;
}

/* 센서 기준치 : 정상 (파랑색) */
@keyframes k1 {
  0% {
    box-shadow: 0 0 8px 6px rgba(26, 140, 255, 0), 0 0 0px 0px transparent, 0 0 0px 0px rgba(26, 140, 255, 0);
  }
  10% {
    box-shadow: 0 0 8px 6px #1a8cff, 0 0 12px 10px transparent, 0 0 12px 14px #1a8cff;
  }
  100% {
    box-shadow: 0 0 6px 4px rgba(26, 140, 255, 0), 0 0 0px 20px transparent, 0 0 0px 20px rgba(26, 140, 255, 0);
  }
}

/* 센서 기준치 : 비정상 (빨강색) */
@keyframes k2 {
  0% {
    box-shadow: 0 0 8px 6px rgba(255, 0, 0, 0), 0 0 0px 0px transparent, 0 0 0px 0px rgba(255, 0, 0, 0);
  }
  10% {
    box-shadow: 0 0 8px 6px #ff0000, 0 0 12px 10px transparent, 0 0 12px 14px #ff0000;
  }
  100% {
    box-shadow: 0 0 6px 4px rgba(255, 0, 0, 0), 0 0 0px 20px transparent, 0 0 0px 20px rgba(255, 0, 0, 0);
  }
}
<!-- 크롬 기준이므로 webkit(safari), moz(firefox) 제외함-->
</style>