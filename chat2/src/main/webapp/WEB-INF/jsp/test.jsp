<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" type="text/css" href="css/admin.css">
<link rel="stylesheet" type="text/css" href="css/admin.custom.css"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.disabled
{
    background-color: #DDD;
    color: #999;
}

* on, off 토글 버튼 css */
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
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('input').click(function (event) {
	    if ($(this).hasClass('disabled')) {
	        alert('CLICKED, BUT DISABLED!!');
	    } else {
	        alert('Not disabled. =)');
	    }
	});


});



</script>

<body>
<h1>AAAAAA</h1>
<input type="button" class="disabled" value="click" />


<label class="switch"> <input type="checkbox" id="1_A_D_AIR">
	<span class="slider round"></span>
</label>


<button type="button" class="btn btn-default" data-toggle="tooltip22" data-placement="left" title="Hasdfsdf">Hello...</button>

<div class="page-title-actions">
<button type="button" data-toggle="tooltip" title="Example Tooltip" data-placement="bottom" class="btn-shadow mr-3 btn btn-dark">
                                        <i class="fa fa-star"></i>
                                    </button>
                                    </div>


</body>
</html>

