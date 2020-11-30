<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
< <style>
  #historycontainer {
	width: 380px;
	height: 380px;
	
} 
 

.highcharts-figure, .highcharts-data-table table {
    min-width: 400px; 
    max-width: 500px;
    margin: 1em auto;
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




</style>


<script type="text/javascript" >
 function display(data){
	Highcharts.chart('historycontainer', {
	    chart: {
	    	plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            
	        type: 'pie'
	    },
	    title: {
	        text: '온도'
	    },
	  

	    accessibility: {
	        announceNewData: {
	            enabled: true
	        },
	        point: {
	            valueSuffix: '%'
	        }
	    },

	    plotOptions: {
	        series: {
	            dataLabels: {
	                enabled: true,
	                format: '{point.name}: {point.y:.1f}%',
	                style: {
	                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                 }
	            }
	        },
	    pie:{
	    	 innerSize: 100,
             depth: 45
	    }
	    },

	    tooltip: {
	        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
	    },

	    series:[{
	    	data:data
	   
	    }] 
	    
	});
} 

function getData(){
	
	$.ajax({
		url:'getdata1.mc',
		//alert(123)
		success:function(data){
			
			display(data);
			
		},
		error:function(){
			
			}
		
	});
	display();
}
 
$(document).ready(function(){
 	  getData();
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
			<div class="d-inline-block dropdown">
				<button type="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"
					class="btn-shadow dropdown-toggle btn btn-info">
					<span class="btn-icon-wrapper pr-2 opacity-7"> <i
						class="fa fa-business-time fa-w-20"></i>
					</span> Buttons
				</button>
				<div tabindex="-1" role="menu" aria-hidden="true"
					class="dropdown-menu dropdown-menu-right">
					<ul class="nav flex-column">
						<li class="nav-item"><a href="javascript:void(0);"
							class="nav-link"> <i class="nav-link-icon lnr-inbox"></i> <span>
									Inbox </span>
								<div class="ml-auto badge badge-pill badge-secondary">86</div>
						</a></li>
						<li class="nav-item"><a href="javascript:void(0);"
							class="nav-link"> <i class="nav-link-icon lnr-book"></i> <span>
									Book </span>
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
			
			<div class="card-header">
				이력조회  :: 차트 
			</div>
			
			 <div class="tab-content">
				<figure class="highcharts-figure">
					<div id="historycontainer"></div>
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
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                            </tbody>
                                        </table>
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

