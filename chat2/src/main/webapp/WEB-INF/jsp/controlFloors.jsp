<div class="main-card mb-3 card">
	<div class="card-header">
		<i class="header-icon lnr-gift icon-gradient bg-grow-early"> </i>The
		Floor View
		<div class="btn-actions-pane-right">
			<div class="nav">
				<a data-toggle="tab" href="#tab-eg4-0"
					class="border-0 btn-pill btn-wide btn-transition active btn btn-outline-danger">F1</a>
				<a data-toggle="tab" href="#tab-eg4-1"
					class="mr-1 ml-1 btn-pill btn-wide border-0 btn-transition  btn btn-outline-danger">F2</a>
			</div>
		</div>
	</div>

	<!-- tab contents (Real-time Data, ON/OFF Button) -->
	<div class="card-body">
		<div class="tab-content">
			<div class="tab-pane active" id="tab-eg4-0" role="tabpanel">

				<div class="row">
					<div class="col-md-6">
						<h5>Area A</h5>
						<div class="row text-center">
							<div>
								<h5>TEMP</h5>
								<div class="sensors m-2" id="1_A_S_TEMP"></div>
							</div>
							<div>
								<h5>HUM</h5>
								<div class="sensors m-2" id="1_A_S_HUM"></div>
							</div>
							<div>
								<h5>DUST</h5>
								<div class="sensors m-2" id="1_A_S_DUST"></div>
							</div>
							<div>
								<h5>ILLM</h5>
								<div class="sensors m-2" id="1_A_S_ILLM"></div>
							</div>
						</div>
						<div class="divider"></div>
						<h5>Area B</h5>
						<div class="row text-center">
							<div>
								<h5>TEMP</h5>
								<div class="sensors m-2" id="1_B_S_TEMP"></div>
							</div>
							<div>
								<h5>HUM</h5>
								<div class="sensors m-2" id="1_B_S_HUM"></div>
							</div>
							<div>
								<h5>DUST</h5>
								<div class="sensors m-2" id="1_B_S_DUST"></div>
							</div>
							<div>
								<h5>ILLM</h5>
								<div class="sensors m-2" id="1_B_S_ILLM"></div>
							</div>
						</div>
					</div>

					<div class="floor_1_A col-md-3">
						<div>Area A</div>
						<div>Air Conditioner</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_A_D_AIR">OFF</button>
						</div>
						<div>Humidifier</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_A_D_HUM">OFF</button>
						</div>
						<div>Air Cleaner</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_A_D_AIRCL">OFF</button>
						</div>
						<div>LED</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_A_D_LED">OFF</button>
						</div>
						<div>Electricity</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_A_D_ELEC">OFF</button>
						</div>
						<div>Water</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_A_D_WAT">OFF</button>
						</div>
						<div>Gas</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_A_D_GAS">OFF</button>
						</div>
					</div>

					<div class="floor_1_B col-md-3">
						<div>Area B</div>
						<div>Air Conditioner</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_B_D_AIR">OFF</button>
						</div>
						<div>Humidifier</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_B_D_HUM">OFF</button>
						</div>
						<div>Air Cleaner</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_B_D_AIRCL">OFF</button>
						</div>
						<div>LED</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_B_D_LED">OFF</button>
						</div>
						<div>Electricity</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_B_D_ELEC">OFF</button>
						</div>
						<div>Water</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_B_D_WAT">OFF</button>
						</div>
						<div>Gas</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="1_B_D_GAS">OFF</button>
						</div>
					</div>
				</div>
			</div>


			<div class="tab-pane" id="tab-eg4-1" role="tabpanel">
				<div class="row">
					<div class="col-md-6">
						<h5>Area A</h5>
						<div class="row text-center">
							<div>
								<h5>TEMP</h5>
								<div class="sensors m-2" id="2_A_S_TEMP"></div>
							</div>
							<div>
								<h5>HUM</h5>
								<div class="sensors m-2" id="2_A_S_HUM"></div>
							</div>
							<div>
								<h5>DUST</h5>
								<div class="sensors m-2" id="2_A_S_DUST"></div>
							</div>
							<div>
								<h5>ILLM</h5>
								<div class="sensors m-2" id="2_A_S_ILLM"></div>
							</div>
						</div>
					</div>

					<div class="floor_2_A col-md-6">
						<div>Area A</div>
						<div>Air Conditioner</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="2_A_D_AIR">OFF</button>
						</div>
						<div>Humidifier</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="2_A_D_HUM">OFF</button>
						</div>
						<div>Air Cleaner</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="2_A_D_AIRCL">OFF</button>
						</div>
						<div>LED</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="2_A_D_LED">OFF</button>
						</div>
						<div>Electricity</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="2_A_D_ELEC">OFF</button>
						</div>
						<div>Water</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="2_A_D_WAT">OFF</button>
						</div>
						<div>Gas</div>
						<div class="btn-group-lg btn-group btn-group-toggle"
							data-toggle="buttons">
							<button type="button" class="btn btn-alternate d_btn"
								id="2_A_D_GAS">OFF</button>
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

		$('.d_btn').click(function() {
			device = $(this).attr('id');
			if ($(this).hasClass("active")) {
				stat = 'OFF';
				$(this).text('OFF');
				$(this).css('background-color', '#794c8a'); // off ìì
				$(this).css('border-color', '#794c8a');
			} else {
				stat = 'ON';
				$(this).text('ON');
				$(this).css('background-color', '#3ac47d'); // on ìì
				$(this).css('border-color', '#3ac47d');
			}
			execAjax(stat, device);
		});

	});
</script>

<style>
.sensors {
	background-color: #dcdcdc;
	width: 60px;
	height: 60px;
	overflow: auto;
	text-align:center;
}

.sensors h5 {
	color: #fff;
	text-align: center;
}


</style>