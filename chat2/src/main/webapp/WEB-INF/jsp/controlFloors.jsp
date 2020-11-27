<div class="main-card mb-3 card">
	<div class="card-header">
		<i class="header-icon lnr-gift icon-gradient bg-grow-early"> </i>The Floor View
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
					<div class="floor_1_A col-md-3">
						<div>Area A</div>
						<div>Air Conditioner</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_A_D_AIR">OFF</button>
						</div>
						<div>Humidifier</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_A_D_HUM">OFF</button>
						</div>
						<div>Air Cleaner</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_A_D_AIRCL">OFF</button>
						</div>
						<div>LED</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_A_D_LED">OFF</button>
						</div>
						<div>Electricity</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_A_D_ELEC">OFF</button>
						</div>
						<div>Water</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_A_D_WAT">OFF</button>
						</div>
						<div>Gas</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_A_D_GAS">OFF</button>
						</div>
					</div>
					
					<div class="floor_1_B col-md-3">
						<div>Area B</div>
						<div>Air Conditioner</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_B_D_AIR">OFF</button>
						</div>
						<div>Humidifier</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_B_D_HUM">OFF</button>
						</div>
						<div>Air Cleaner</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_B_D_AIRCL">OFF</button>
						</div>
						<div>LED</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_B_D_LED">OFF</button>
						</div>
						<div>Electricity</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_B_D_ELEC">OFF</button>
						</div>
						<div>Water</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_B_D_WAT">OFF</button>
						</div>
						<div>Gas</div>
						<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
							<button type="button" class="btn btn-alternate" id="1_B_D_GAS">OFF</button>
						</div>
					</div>
				</div>
			</div>

			
			<div class="tab-pane" id="tab-eg4-1" role="tabpanel">
				<div class="floor_2_A col-md-3">
					<div>Area A</div>
					<div>Air Conditioner</div>
					<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
						<button type="button" class="btn btn-alternate" id="2_A_D_AIR">OFF</button>
					</div>
					<div>Humidifier</div>
					<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
						<button type="button" class="btn btn-alternate" id="2_A_D_HUM">OFF</button>
					</div>
					<div>Air Cleaner</div>
					<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
						<button type="button" class="btn btn-alternate" id="2_A_D_AIRCL">OFF</button>
					</div>
					<div>LED</div>
					<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
						<button type="button" class="btn btn-alternate" id="2_A_D_LED">OFF</button>
					</div>
					<div>Electricity</div>
					<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
						<button type="button" class="btn btn-alternate" id="2_A_D_ELEC">OFF</button>
					</div>
					<div>Water</div>
					<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
						<button type="button" class="btn btn-alternate" id="2_A_D_WAT">OFF</button>
					</div>
					<div>Gas</div>
					<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
						<button type="button" class="btn btn-alternate" id="2_A_D_GAS">OFF</button>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>


<script>

	// ON, OFF AJAX
	function execAjax(stat, area){
		$.ajax({
			url : stat,
			data : {"area" : area},
			success : function(data) {
			}
		});
	};
	$(document).ready(function() {
		var stat;
		var area;
		$('#1_A_D_AIR').click(function(){
			area = "1_A_D_";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#1_A_TEMP').text("OFF");
			}else{
				stat = "ON";
				$('#1_A_TEMP').text("ON");
			}
			execAjax(stat, area);
		});
		$('#1_B_TEMP').click(function(){
			area = "1_B_TEMP";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#1_B_TEMP').text("OFF");
			}else{
				stat = "ON";
				$('#1_B_TEMP').text("ON");
			}
			execAjax(stat, area);
		});
		$('#1_A_HUM').click(function(){
			area = "1_A_HUM";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#1_A_HUM').text("OFF");
			}else{
				stat = "ON";
				$('#1_A_HUM').text("ON");
			}
			execAjax(stat, area);
		});
		$('#1_B_HUM').click(function(){
			area = "1_B_HUM";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#1_B_HUM').text("OFF");
			}else{
				stat = "ON";
				$('#1_B_HUM').text("ON");
			}
			execAjax(stat, area);
		});
		$('#1_A_DUST').click(function(){
			area = "1_A_DUST";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#1_A_DUST').text("OFF");
			}else{
				stat = "ON";
				$('#1_A_DUST').text("ON");
			}
			execAjax(stat, area);
		});
		$('#1_B_DUST').click(function(){
			area = "1_B_DUST";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#1_B_DUST').text("OFF");
			}else{
				stat = "ON";
				$('#1_B_DUST').text("ON");
			}
			execAjax(stat, area);
		});
		$('#1_A_LED').click(function(){
			area = "1_A_LED";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#1_A_LED').text("OFF");
			}else{
				stat = "ON";
				$('#1_A_LED').text("ON");
			}
			execAjax(stat, area);
		});
		$('#1_B_LED').click(function(){
			area = "1_B_LED";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#1_B_LED').text("OFF");
			}else{
				stat = "ON";
				$('#1_B_LED').text("ON");
			}
			execAjax(stat, area);
		});
		
	});
	
</script>