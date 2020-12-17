<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main-card mb-1 card m-10">
	<div class="card-header ch_height">
		<i class="header-icon lnr-gift icon-gradient bg-grow-early"> </i><h3>
		층별제어</h3>
		<div class="btn-actions-pane-right">

			<div class="nav nav_ml">
				<a data-toggle="tab" href="#tab-eg4-0"
					class="border-0 btn-pill btn-wide btn-transition active btn btn-outline-danger"><h6 class="mb-0">1층</h6></a>
				<a data-toggle="tab" href="#tab-eg4-1"
					class="mr-1 ml-1 btn-pill btn-wide border-0 btn-transition  btn btn-outline-danger"><h6 class="mb-0">2층</h6></a>
			</div>
			
			<!-- 비활성화 제어 버튼 -->
			<div class="nav Dis_content">
				<div class="Dis_title">디바이스 비활성화 : </div>
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
					
					<div class="col-md-6 pr-0 pl-2">
						<!-- 평면도 -->
						<div class="fp-wrap">
							<div class="fp-image">
								<img src="images/floorPlan7.jpg" alt="">
							</div>
							
							<!-- 비상대피로 -->
							<!-- 길표시 -->
							<div class="escape_road_container1">
								<div class="escape_road1"></div>
							</div>
							<div class="escape_road2"></div>

							<div class="escape_road_container3">
								<div class="escape_road3"></div>
							</div>
							<div class="escape_road4"></div>

							<div class="escape_road_container5">
								<div class="escape_road5"></div>
							</div>
							<div class="escape_road6"></div>
							
							<div class="escape_road_container7">
								<div class="escape_road7"></div>
							</div>

							<div class="escape_road8"></div>
							
							<div class="escape_road9"></div>
							
							<!-- 비상구 표시 -->
							<a class="intro-banner-vdo-play-btn pinkBg" target="_blank">
							<i class="fas fa-door-open"></i>
							<span class="ripple pinkBg"></span>
							<span class="ripple pinkBg"></span>
							<span class="ripple pinkBg"></span>
							
							</a>

							<!-- 길 애니메이션 -->
							<div class="escape_ani infinite">infinite</div>
							

							<!-- 1_A tooltip-->
							<div class="Area_1A">
								<div class="con-tooltip right" id="tt_1_A">
									<div class="tooltip">
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
									</div>
								</div>
							</div>
	
							<!-- 1_B tooltip-->
							<div class="Area_1B">
								<div class="con-tooltip right" id="tt_1_B">
									<div class="tooltip">
										<div class="border_rd mb-2">B구역</div>
										<div class="tooltip_inbl">
											온도&nbsp:&nbsp
											<div id="1_B_S_TEMP">17.12</div><br>
											습도&nbsp:&nbsp
											<div id="1_B_S_HUM">88.50</div><br>
											미세먼지&nbsp:&nbsp
											<div id="1_B_S_DUST">63.27</div><br>
											조도&nbsp:&nbsp
											<div id="1_B_S_ILLM">282</div>
										</div>
										
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
											<div class="widget-heading">온도</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_TEMP">
												<span>21.34</span>
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
											<div class="widget-heading">습도</div>
											<div class="widget-subheading">(&#37;)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_HUM">
												<span>67.0</span>
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
											<div class="widget-heading">미세먼지</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_DUST">
												<span>17.23</span>
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
											<div class="widget-heading">조도</div>
											<div class="widget-subheading">(lx)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_A_S_ILLM">
												<span>348</span>
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
											<th>냉난방기</th>
											<th>가습기</th>
											<th>공기청정기</th>
											<th>조명</th>
											<th>전기</th>
											<th>수도</th>
											<th>가스</th>
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
											<div class="widget-heading">온도</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_B_S_TEMP">
												<span>17.12</span>
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
											<div class="widget-heading">습도</div>
											<div class="widget-subheading">(&#37;)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_B_S_HUM">
												<span>88.50</span>
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
											<div class="widget-heading">미세먼지</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_B_S_DUST">
												<span>63.27</span>
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
											<div class="widget-heading">조도</div>
											<div class="widget-subheading">(lx)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_1_B_S_ILLM">
												<span>282</span>
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
											<th>냉난방기</th>
											<th>가습기</th>
											<th>공기청정기</th>
											<th>조명</th>
											<th>전기</th>
											<th>수도</th>
											<th>가스</th>
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
				
					<div class="col-md-6 pr-0 pl-2">
						<!-- 평면도 -->
						<div class="fp-wrap">
							<div class="fp-image">
								<img src="images/floorPlan7_2.jpg" alt="">
							</div>
		
							<!-- 2_A tooltip-->
							<div class="Area_2A">
								<div class="con-tooltip right" id="tt_2_A">
									<div class="tooltip">
										<div class="tooltip_inbl mb-2">
											온도&nbsp:&nbsp
											<div id="2_A_S_TEMP"></div><br>
											습도&nbsp:&nbsp
											<div id="2_A_S_HUM"></div><br>
											미세먼지&nbsp:&nbsp
											<div id="2_A_S_DUST"></div><br>
											조도&nbsp:&nbsp
											<div id="2_A_S_ILLM"></div>
										</div>
									</div>
								</div>
							</div>
						</div> <!-- End wrap -->
					</div> <!-- End col-md -->
				
					<div class="col-md-6">
						
						<!-- A구역 실시간 데이터 -->
						<div class="mb-1 mr-1 badge badge-pill bg-asteroid text-white">A구역</div>
						<div class="row text-center">
							<div class="col-lg-6 col-xl-3 sensordata_div">
								<div class="card mb-1 widget-content sensordata">
									<div class="widget-content-wrapper">
										<div class="widget-content-left">
											<div class="widget-heading">온도</div>
											<div class="widget-subheading">(&#186;C)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_2_A_S_TEMP">
												<span>22.41</span>
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
											<div class="widget-heading">습도</div>
											<div class="widget-subheading">(&#37;)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_2_A_S_HUM">
												<span>65.1</span>
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
											<div class="widget-heading">미세먼지</div>
											<div class="widget-subheading">(&#181;m)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_2_A_S_DUST">
												<span>27.11</span>
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
											<div class="widget-heading">조도</div>
											<div class="widget-subheading">(lx)</div>
										</div>
										<div class="widget-content-right">
											<div class="widget-numbers" id="P_2_A_S_ILLM">
												<span>357</span>
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
											<th>냉난방기</th>
											<th>가습기</th>
											<th>공기청정기</th>
											<th>조명</th>
											<th>전기</th>
											<th>수도</th>
											<th>가스</th>
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

<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

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
		
		 // 비상대피로 표시 테스트  ----------------------------------------
		 /*
	     $(".escape_road_container1").css("display","block");
	     $(".escape_road2").css("display","block");
	     setTimeout(function() {
	        $(".escape_road_container3").css("display","block");
	     }, 1000);
	     setTimeout(function() {
	        $(".escape_road_container5").css("display","block");
	     }, 2500);
	     setTimeout(function() {
		    $(".escape_road_container7").css("display","block");
		 }, 3600);
	     */
		 //---------- 경보 알림 테스트
		 /*	   
		 toastr.options = {
					"closeButton" : true,
					"debug" : false,
					"newstOnTop" : false,
					"positionClass" : "toast-top-full-width",
					"onclick" : null,
					"showDuration" : 300,
					"Hide Duration" : 1000,
					"showEasing" : "swing",
					"hideEasing" : "linear",
					"fadeIn" : 300,
					"fadeOut" : 1000,
					"timeOut" : 100000, // toastr가 보여지는 시간
					"extendedTimeOut" : 1000,
					"showMethod" : "slideDown",
					"hideMethod" : "fadeOut"
		}
		// toastr 띄우기(error 타입)
		toastr.error("<div class='text-center'>대피로 개방</div>","<div class='text-center'>지진 경보</div>");
		*/
		// ------------------- 테스트 끝 -----------------------------

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
	font-size: 100%;
}
.widget-content .widget-content-wrapper{
	display: block;
}
th {
	/*font-size: 77%;*/
}
.border_rd{
	border: 1px groove #fff;
	border-radius: 5px;
	text-align: center;
	padding: 1px;
}

.tooltip_inbl div{
	display: inline-block;
	margin-bottom: 3px;
}
.sensordata_div{
	height: 147px;
}

/* on, off 토글 버튼 css */
/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 42px;
	height: 20px;
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
	height: 15px;
	width: 13px;
	left: 4px;
	bottom: 2.6px;
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
	transform: translateX(21px);
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
	z-index:1;
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 61.5%;
	left: 16%;
	transform: translate( -30%, -50% );
}
.Area_1B {
	z-index:1;
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 23.4%;
	left: 70%;
	transform: translate( -30%, -50% );
}
.Area_2A {
	z-index:1;
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 27%;
	left: 40%;
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
  
	width: 330%;
	padding-top: 10px;
	padding-bottom: 0px;
	padding: 13px;

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
.right .tooltip { top:-150%; left:115%; }

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
	margin-left: 48%;
}

/* 비상대피로 */
/* 길표시*/
.escape_road_container1{
  position:absolute;
  width:2%;
  height: 15%;
  margin-left:-50px;

  top: 48%;
  left: 25.6%;
  display: none;
  animation-name: road_key1;
  animation-timing-function: linear;
  animation-duration: 0.5s;
  animation-fill-mode: forwards;
}
.escape_road1{
  width:100%;
  height: 100%;
  background-color: #ffef2a;
  /* border-radius: 7px 7px 7px 7px / 7px 7px 7px 7px; */
}

.escape_road2{
  position:absolute;
  height: 3%;
  margin-left:-50px;
  background-color: #ffef2a;
  display: none;
  
  top:48%;
  left: 25.6%;
  
  animation-name: road_key2;
  animation-timing-function: linear;
  animation-duration: 0.5s;
  animation-fill-mode: forwards;
  animation-delay: 0.4s;
}
.escape_road_container3{
  position:absolute;
  width:2%;
  height: 7%;
  margin-left:-50px;

  top: 43%;
  left: 35.6%;
  display: none;
  animation-name: road_key1;
  animation-timing-function: linear;
  animation-duration: 0.5s;
  animation-fill-mode: forwards;
}
.escape_road3{
  width:100%;
  height: 100%;
  background-color: #ffef2a;
}

.escape_road4{
  position:absolute;
  height: 3%;
  margin-left:-50px;
  background-color: #ffef2a;
  /*display: none;*/
  
  top:43%;
  left: 37%;
  
  animation-name: road_key3;
  animation-timing-function: linear;
  animation-duration: 0.9s;
  animation-fill-mode: forwards;
  animation-delay: 1.8s;
}

.escape_road_container5{
  position:absolute;
  width:2%;
  height: 9%;
  margin-left:-50px;

  top: 35%;
  left: 97%;
  display: none;
  animation-name: road_key1;
  animation-timing-function: linear;
  animation-duration: 0.5s;
  animation-fill-mode: forwards;
}
.escape_road5{
  width:100%;
  height: 100%;
  background-color: #ffef2a;
}

.escape_road6{
  position:absolute;
  height: 3%;
  margin-left:-50px;
  background-color: #ffef2a;
  /*display: none;*/
  
  top:35%;
  left: 97%;
  
  animation-name: road_key6;
  animation-timing-function: linear;
  animation-duration: 0.5s;
  animation-fill-mode: forwards;
  animation-delay: 3.3s;
}

.escape_road_container7{
  position:absolute;
  width:2%;
  height: 10%;
  margin-left:-50px;

  top: 27%;
  left: 103.7%;
  display: none;
  animation-name: road_key1;
  animation-timing-function: linear;
  animation-duration: 0.5s;
  animation-fill-mode: forwards;
}
.escape_road7{
  width:100%;
  height: 100%;
  background-color: #ffef2a;
}

.escape_road8{
  position:absolute;
  height: 3%;
  margin-left:-50px;
  background-color: #ffef2a;
  /*display: none;*/
  
  top:27%;
  left: 103.7%;
  
  animation-name: road_key8;
  animation-timing-function: linear;
  animation-duration: 0.3s;
  animation-fill-mode: forwards;
  animation-delay: 4.5s;
}

.escape_road9{
  position:absolute;
  width: 2%;
  margin-left:-50px;
  background-color: #ffef2a;
  /*display: none;*/
  
  top:23%;
  left: 79.6%;
  
  animation-name: road_key9;
  animation-timing-function: linear;
  animation-duration: 0.3s;
  animation-fill-mode: forwards;
  animation-delay: 2.3s;
}

@keyframes road_key1 {
   from{
       padding-top: 7%;
     }
     to{
      padding-top: 0%;
     }
}
 
@keyframes road_key2 {
   from{
       width: 0%;
     }
     to{
      width: 12%;
     }
}
 
@keyframes road_key3 {
   from{
       width: 0%;
     }
     to{
      width: 62%;
     }
}

@keyframes road_key6 {
   from{
       width: 0%;
     }
     to{
      width: 8.7%;
     }
}

@keyframes road_key8 {
   from{
       width: 0%;
     }
     to{
      width: 4%;
     }
}

@keyframes road_key9 {
   from{
       height: 0%;
     }
     to{
      height: 22.5%;
     }
}
.Area_escape {
	z-index:1;
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 28%;
	left: 97%;
	transform: translate( -30%, -50% );
	
	width: 30px;
	height: 30px;
	border-radius: 50%;
	cursor: pointer;
	float: left;
	transition: all 0.2s;
	
	background: #f6ff60;
	animation: kescp 1.75s 1s ease-out infinite;
}

/* 비상구 표시 */
.pinkBg {
    background-color: #ed184f!important;
    background-image: linear-gradient(90deg, #fd5581, #fd8b55);
}
.intro-banner-vdo-play-btn{
    height:40px;
    width:40px;
    position:absolute;
    top:32%;
    left:100%;
    text-align:center;
    margin:-30px 0 0 -30px;
    border-radius:100px;
    z-index:1;
    display: none;
}
.intro-banner-vdo-play-btn i{
    line-height:56px;
    font-size:30px
}
.intro-banner-vdo-play-btn .ripple{
    position:absolute;
    width:160px;
    height:160px;
    z-index:-1;
    left:50%;
    top:50%;
    opacity:0;
    margin:-80px 0 0 -80px;
    border-radius:100px;
    -webkit-animation:ripple 1.8s infinite;
    animation:ripple 1.8s infinite
}

@-webkit-keyframes ripple{
    0%{
        opacity:1;
        -webkit-transform:scale(0);
        transform:scale(0)
    }
    100%{
        opacity:0;
        -webkit-transform:scale(1);
        transform:scale(1)
    }
}
@keyframes ripple{
    0%{
        opacity:1;
        -webkit-transform:scale(0);
        transform:scale(0)
    }
    100%{
        opacity:0;
        -webkit-transform:scale(1);
        transform:scale(1)
    }
}
.intro-banner-vdo-play-btn .ripple:nth-child(2){
    animation-delay:.3s;
    -webkit-animation-delay:.3s
}
.intro-banner-vdo-play-btn .ripple:nth-child(3){
    animation-delay:.6s;
    -webkit-animation-delay:.6s
}

.intro-banner-vdo-play-btn i{
	transform: translate( -40%, -50% );
	width: 50% !important;
	height: 50% !important;
	color: #fff;
}


/* 길 따라 움직이는 애니메이션 */
.escape_ani{
  position:absolute;
  left:100px;
  width:100px;
  height:50px;
  margin-left:-50px;
  background-color:#000;
  color:#fff;
  display: none;
  /*animation-name:iteration-count; */
  animation-timing-function:linear;
  animation-duration:2s;
  
}
.infinite{
  top:140px;
  animation-name: road_key2;
  animation-iteration-count:infinite;
}
@keyframes road_key123 {
     from{
       left:100px;
     }
     to{
       left:300px;
     }
}


/* 경보 alert창 */

<!-- 크롬 기준이므로 webkit(safari), moz(firefox) 제외함-->
</style>