<div class="main-card mb-1 card m-10">
	<div class="card-header ch_height">
		<i class="header-icon lnr-gift icon-gradient bg-grow-early"> </i><h3>The
		Floor View</h3>
		<div class="btn-actions-pane-right">

			<div class="nav nav_ml">
				<a data-toggle="tab" href="#tab-eg4-0"
					class="border-0 btn-pill btn-wide btn-transition active btn btn-outline-danger">Floor 1</a>
				<a data-toggle="tab" href="#tab-eg4-1"
					class="mr-1 ml-1 btn-pill btn-wide border-0 btn-transition  btn btn-outline-danger">Floor 2</a>
			</div>

			<!-- 비활성화 제어 버튼 -->
			
			<div class="nav Dis_content">
				<div class="Dis_title">DEVICE DISABLED : </div>
				<div class="toggle_Dis" id="switch_Dis">
					<div class="toggle-text-off">OFF</div>
					<div class="glow-comp"></div>
					<div class="toggle-button"></div>
					<div class="toggle-text-on">ON</div>
				</div>
			</div>

		</div>
	</div> <!-- End card-header -->

	<!-- tab contents (Real-time Data, ON/OFF Button) -->
	<div class="card-body">
		<div class="tab-content">

			<!-- 1층 -->
			<div class="tab-pane active" id="tab-eg4-0" role="tabpanel">
				<div class="row">
					
					<div class="col-md-6">
						<!-- 평면도 -->
						<div class="fp-wrap">
							<div class="fp-image">
								<img src="images/floorPlan7.jpg" alt="">
							</div>
	
							<!-- 1_A tooltip-->
							<div class="Area_1A">
								<div class="con-tooltip right" id="tt_1_A">
									<div class="tooltip">
<<<<<<< HEAD
										TEMPERATURE :<br>
										<div id="1_A_S_TEMP"></div>
										HUMIDITY :<br>
										<div id="1_A_S_HUM"></div>
										FINE DUST :<br>
										<div id="1_A_S_DUST"></div>
										AMBIENT LIGHT :<br>
										<div id="1_A_S_ILLM"></div>
=======
										<div class="border_rd mb-2">A구역</div>
										<div class="tooltip_inbl">
											온도&nbsp:&nbsp
											<div id="1_A_S_TEMP">21.34</div><br>
											습도&nbsp:&nbsp
											<div id="1_A_S_HUM">67.0</div><br>
											미세먼지&nbsp:&nbsp
											<div id="1_A_S_DUST">17.23</div><br>
											조도&nbsp:&nbsp
											<div id="1_A_S_ILLM">348</div>
										</div>
>>>>>>> 64a4d1d7b0eaa2e35935a253511271708900c212
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
	
						</div><!-- End wrap -->
					</div> <!-- End col-md -->
						
					<div class="col-md-6">
					
						<!-- A구역 실시간 데이터 -->
						<div class="mb-1 mr-1 badge badge-pill bg-asteroid text-white">Area  A</div>
						<div class="row text-center">
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">TEMPERATURE</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_TEMP">
												<span>12.12</span>
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_1_A_S_TEMP_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
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
										<div class="badge badge-pill badge-focus" id="P_1_A_S_HUM_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">FINE DUST</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_DUST">
<<<<<<< HEAD
												<span></span>
=======
												<span>17.23</span>
>>>>>>> 64a4d1d7b0eaa2e35935a253511271708900c212
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_1_A_S_DUST_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
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
										<div class="badge badge-pill badge-focus" id="P_1_A_S_ILLM_bdg">normal</div>
									</div>
								</div>
							</div>
						</div>

						<!-- A구역 제어 버튼 -->
						<div class="main-card mb-1 text-center">
							<div class="card-body table-responsive p-0 pb-0">
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

						<div class="divider mt-0 mb-2"></div>

						<!-- B구역 실시간 데이터 -->
						<div class="mb-1 mr-1 badge badge-pill bg-asteroid text-white">Area  B</div>
						<div class="row text-center">
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">TEMPERATURE</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_B_S_TEMP">
												<span>12.12</span>
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_1_B_S_TEMP_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">HUMIDITY</div>
											<div class="widget-subheading">(&#37;)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_B_S_HUM">
												<span></span>
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_1_B_S_HUM_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">FINE DUST</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_B_S_DUST">
												<span></span>
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_1_B_S_DUST_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">AMBIENT LIGHT</div>
											<div class="widget-subheading">(lx)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_B_S_ILLM">
												<span></span>
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_1_B_S_ILLM_bdg">normal</div>
									</div>
								</div>
							</div>
						</div>

						<!-- B구역 제어 버튼 -->
						<div class="main-card mb-1 text-center">
							<div class="card-body table-responsive p-0 pb-0">
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

					</div> <!-- End col-md -->
					
				</div> <!-- End row -->
			</div> <!-- End tab-eg4-0 -->

			<!-- 2층 -->
			<div class="tab-pane" id="tab-eg4-1" role="tabpanel">
				<div class="row">
				
					<div class="col-md-6">
						<!-- 평면도 -->
						<div class="fp-wrap">
							<div class="fp-image">
								<img src="images/floorPlan2.jpg" alt="">
							</div>
		
							<!-- 2_A tooltip-->
							<div class="Area_2A">
								<div class="con-tooltip right" id="tt_2_A">
									<div class="tooltip">
										TEMPERATURE :<br>
										<div id="2_A_S_TEMP"></div>
										HUMIDITY :<br>
										<div id="2_A_S_HUM"></div>
										FINE DUST :<br>
										<div id="2_A_S_DUST"></div>
										AMBIENT LIGHT :<br>
										<div id="2_A_S_ILLM"></div>
									</div>
								</div>
							</div>
						</div> <!-- End wrap -->
					</div> <!-- End col-md -->
				
					<div class="col-md-6">
						
						<!-- A구역 실시간 데이터 -->
						<div class="mb-1 mr-1 badge badge-pill bg-asteroid text-white">Area  A</div>
						<div class="row text-center">
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">TEMPERATURE</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_2_A_S_TEMP">
												<span>12.12</span>
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_2_A_S_TEMP_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">HUMIDITY</div>
											<div class="widget-subheading">(&#37;)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_2_A_S_HUM">
												<span></span>
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_2_A_S_HUM_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">FINE DUST</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_2_A_S_DUST">
<<<<<<< HEAD
												<span></span>
=======
												<span>27.11</span>
>>>>>>> 64a4d1d7b0eaa2e35935a253511271708900c212
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_2_A_S_DUST_bdg">normal</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">AMBIENT LIGHT</div>
											<div class="widget-subheading">(lx)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_2_A_S_ILLM">
<<<<<<< HEAD
												<span></span>
=======
												<span>357</span>
>>>>>>> 64a4d1d7b0eaa2e35935a253511271708900c212
											</div>
										</div>
										<div class="badge badge-pill badge-focus" id="P_2_A_S_ILLM_bdg">normal</div>
									</div>
								</div>
							</div>
						</div>


						<!-- A구역 제어 버튼 -->
						<div class="main-card mb-1 text-center">
							<div class="card-body table-responsive p-0 pb-0">
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

					</div> <!-- End col-md -->
				
				</div><!-- End row -->
			</div> <!-- End tab-eg4-0 -->
			
		</div> <!-- End tab-content -->
	</div><!-- End card-body -->
	
</div> <!-- End card-body -->


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
		
		// 비활성화 버튼 제어
		$(".toggle_Dis").click(function(){
			// UI 상태 변경
			$(this).toggleClass("toggle-on");
			
			// 비활성화 상태 on, off
			if($(this).hasClass("toggle-on")){
				$(".switch input").attr("disabled", true);
			}else{
				$(".switch input").attr("disabled", false);
			}
		});
		

	});
</script>

<style>
/* 기타 사이즈 조정 */
.ch_height{
	height: 7rem;
}
.sensordata {
	background-color: #f1f3f5;
	padding-left: 7px;
	padding-right: 7px;
	height: 80%;
}
.widget-numbers span{
	font-size: 77%;
}
.widget-content-left{
	font-size: 77%;
}
.widget-content .widget-content-wrapper{
	display: block;
}
th {
	font-size: 55%;
}
.sensordata_div{
	height: 147px;
}

/* on, off 토글 버튼 css */
/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
<<<<<<< HEAD
	width: 47px;
	height: 25px;
=======
	width: 42px;
	height: 20px;
>>>>>>> 64a4d1d7b0eaa2e35935a253511271708900c212
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
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: ""; /* off */
<<<<<<< HEAD
	height: 21.5px;
	width: 19px;
	left: 4px;
	bottom: 1.7px;
=======
	height: 15px;
	width: 13px;
	left: 4px;
	bottom: 2.6px;
>>>>>>> 64a4d1d7b0eaa2e35935a253511271708900c212
	background-color: white;
	transition: .2s;
}

input:checked + .slider {
	background-color: #2196F3;
}

input:focus + .slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
	transform: translateX(20px);
	content: ""; /* on */
}

/* Rounded sliders */
.slider.round {
	border-radius: 7px;
}

.slider.round:before {
	border-radius: 5px;
}

/* 평면도 css */
.fp-wrap {
	width: 100%;
	margin: 10px auto;
	/*border: 1px solid #000000;*/
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
	top: 58%;
	left: 80%;
	transform: translate( -30%, -50% );
}
.Area_1B {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 85%;
	left: 10%;
	transform: translate( -30%, -50% );
}
.Area_2A {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 37%;
	left: 15%;
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
	padding-top: 10px;
	padding-bottom: 0px;
	padding: 20px;

	background: #333;
	color: #fff;
  
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
.right .tooltip { top:-205%; left:115%; }

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

/* 활성화 버튼 */
#switch_Dis{
    width: 75px;
    height: 40px;
}

.toggle_Dis{
    position: relative;
    border: 2px solid #444249;
    border-radius: 20px;
    transition: border-color .6s  ease-out;
    box-sizing: border-box;
    margin-left: 5px;
}

.toggle_Dis.toggle-on{
    border-color: rgba(137, 194, 217, .4);
    transition: all .5s .15s ease-out;
}

.toggle-button{
    position: absolute;
    top: 4px;
    width: 28px;
    bottom: 4px;
    right: 39px;
    background-color: #444249;
    border-radius: 19px; 
    cursor: pointer;
    transition: all .3s .1s, width .1s, top .1s, bottom .1s;
}

.toggle-on .toggle-button{
    top: 3px;
    width: 65px;
    bottom: 3px;
    right: 3px;
    border-radius: 23px;
    background-color: #ABF200;
    box-shadow: 0 0 16px #ABF200;
    transition: all .2s .1s, right .1s;
}


.toggle-text-on{
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    line-height: 36px;
    text-align: center;
    font-family: 'Quicksand', sans-serif;
    font-size: 18px;
    font-weight: normal;
    cursor: pointer;
    color: rgba(0,0,0,0);
}

.toggle-on .toggle-text-on{
    color: #3b6a7d;
    transition: color .3s .15s ;
}

.toggle-text-off{
    position: absolute;
    top: 0;
    bottom: 0;
    right: 6px;
    line-height: 36px;
    text-align: center;
    font-family: 'Quicksand', sans-serif;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    color: #444249;
}

.toggle-on .toggle-text-off{
    color: rgba(0,0,0,0);
}

/* used for streak effect */
.glow-comp{
    position: absolute;
    opacity: 0;
    top: 10px;
    bottom: 10px;
    left: 10px;
    right: 10px;
    border-radius: 6px;
    background-color: rgba(75, 122, 141, .1);
    box-shadow: 0 0 12px rgba(75, 122, 141, .2);
    transition: opacity 4.5s 1s;
}

.toggle-on .glow-comp{
    opacity: 1;
    transition: opacity 1s;
}

/* 비활성화 버튼 div */
.Dis_content{
	margin-right: 30px;
    padding-top: 15px;
}
.Dis_title{
	padding-top: 10px;
    padding-right: 10px;
}
.nav_ml{
	margin-left: 90px;
}


<!-- 크롬 기준이므로 webkit(safari), moz(firefox) 제외함-->
</style>