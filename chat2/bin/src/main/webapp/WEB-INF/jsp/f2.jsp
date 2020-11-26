<div class="main-card mb-3 card">
	<div class="card-header">
		<i class="header-icon lnr-gift icon-gradient bg-grow-early"> </i>Floor 2
		<div class="btn-actions-pane-right">
			<div class="nav">
				<a data-toggle="tab" href="#tab-eg4-0"
					class="border-0 btn-pill btn-wide btn-transition active btn btn-outline-danger">TEMPERATURE</a> 
					<a data-toggle="tab" href="#tab-eg4-1"
					class="mr-1 ml-1 btn-pill btn-wide border-0 btn-transition  btn btn-outline-danger">HUMIDITY</a> 
					<a data-toggle="tab" href="#tab-eg4-2"
					class="border-0 btn-pill btn-wide btn-transition  btn btn-outline-danger">FINE DUST</a> 
					<a data-toggle="tab" href="#tab-eg4-3"
					class="border-0 btn-pill btn-wide btn-transition btn btn-outline-danger">LED</a> 
					<a data-toggle="tab" href="#tab-eg4-4"
					class="border-0 btn-pill btn-wide btn-transition btn btn-outline-danger">ELECTRICITY</a> 
					<a data-toggle="tab" href="#tab-eg4-5"
					class="border-0 btn-pill btn-wide btn-transition btn btn-outline-danger">WATER</a> 
					<a data-toggle="tab" href="#tab-eg4-6"
					class="border-0 btn-pill btn-wide btn-transition btn btn-outline-danger">GAS</a>
			</div>
		</div>
	</div>
	
	<!-- tab contents (Real-time Data, ON/OFF Button) -->
	<div class="card-body">
		<div class="tab-content">
			<div class="tab-pane active" id="tab-eg4-0" role="tabpanel">
				<div>F2 - Area A</div>
				<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-alternate" id="2_A_TEMP">OFF</button>
				</div>
			</div>
			<div class="tab-pane" id="tab-eg4-1" role="tabpanel">
				<div>F2 - Area A</div>
				<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-alternate" id="2_A_HUM">OFF</button>
				</div>
			</div>
			<div class="tab-pane" id="tab-eg4-2" role="tabpanel">
				<div>F2 - Area A</div>
				<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-alternate" id="2_A_DUST">OFF</button>
				</div>
			</div>
			<div class="tab-pane" id="tab-eg4-3" role="tabpanel">
				<div>F2 - Area A</div>
				<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-alternate" id="2_A_LED">OFF</button>
				</div>
			</div>
			<div class="tab-pane" id="tab-eg4-4" role="tabpanel">
				<div>F2 - Area A</div>
				<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-alternate" id="2_A_ELEC">OFF</button>
				</div>
			</div>
			<div class="tab-pane" id="tab-eg4-5" role="tabpanel">
				<div>F2 - Area A</div>
				<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-alternate" id="2_A_WAT">OFF</button>
				</div>
			</div>
			<div class="tab-pane" id="tab-eg4-6" role="tabpanel">
				<div>F2 - Area A</div>
				<div class="btn-group-lg btn-group btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-alternate" id="2_A_GAS">OFF</button>
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
		$('#2_A_TEMP').click(function(){
			area = "2_A_TEMP";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#2_A_TEMP').text("OFF");
			}else{
				stat = "ON";
				$('#2_A_TEMP').text("ON");
			}
			execAjax(stat, area);
		});
		$('#2_A_HUM').click(function(){
			area = "2_A_HUM";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#2_A_HUM').text("OFF");
			}else{
				stat = "ON";
				$('#2_A_HUM').text("ON");
			}
			execAjax(stat, area);
		});
		$('#2_A_DUST').click(function(){
			area = "2_A_DUST";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#2_A_DUST').text("OFF");
			}else{
				stat = "ON";
				$('#2_A_DUST').text("ON");
			}
			execAjax(stat, area);
		});
		$('#2_A_LED').click(function(){
			area = "2_A_LED";
			if($(this).hasClass("active")){
				stat = "OFF";
				$('#2_A_LED').text("OFF");
			}else{
				stat = "ON";
				$('#2_A_LED').text("ON");
			}
			execAjax(stat, area);
		});
	});
	
</script>