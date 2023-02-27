<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Certificate</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored = "false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<script>
	$(document).ready(function(){
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth()+1;
		var y = date.getFullYear();
		console.log(d+'/'+m+'/'+y);
		$('#date').text(d+'/'+m+'/'+y);
		
		$('#print-button').click(function(){
			$('#print-button').hide();
			window.print();
		})
	
	})

</script>
<style>
	
	#container{
	 font-size : 20px;
	 margin : auto;
	 height : 950px;
	 width : 700px;
	 border : 1px solid black;
	}
	#header{
		text-align : center;
	}
	#dp{
		margin : 40px 0px 0px 30px;;
	}
	#h3{
		text-align : center;
	}
	#paragraph{
		margin-left : 30px;
		margin-right : 30px;
	}
	#h4{
		text-align : center;
	}
	h4{
		display : inline-block;
		margin : 0px 50px;
	}
	#courses{
		position : relative;
	}
	#course-name{
		margin-left : 154px;
		position : absolute;
		
	}
	#course-grade{
		position : absolute;
		margin-left : 328px;
	}
	#course-duration{
		margin-left : 409px;
	}
	#AS{
		margin : 120px 0px 0px 30px;
	}
	#button{
		margin-top : 20px;
		text-align : center;
	}
	#print-button{
		background-color : blue;
		color : white;
		border-radius : 5px;
	}
	#print-button:hover{
		cursor : pointer;
	}

</style>
</head>
<body>
	<div id="container">
		<div id="header"><h2>Infotech Solutions</h2></div>
		
		<div id="dp">
			Date: <span id="date"></span><br>
			Place: Bangalore
		</div>
		<div id="h3"><h3>TO WHOM IT MAY CONCERN</h3></div>
		<div>
			<p id="paragraph">This is to certify that <strong>${student.name}</strong>&nbsp;has completed the course at <strong>Infotech Solutions</strong>.
				We found him sincere,hardworking,technically sound,and result oriented. He worked well 
				as part of team during his tenure. We take this oppurtunity to thank him and wish him all the best
				for the future.</p><br><br>
			<div id="h4"><h4>Course</h4><h4> Grade </h4><h4>Duration</h4></div>
				<c:forEach var ="i" begin="0" end="${len}">
					<div id="courses">
						<p><span id="course-name">${course[i].courseName}</span> <span id="course-grade">${course[0].grade}</span> <span id="course-duration"> ${student.date}&nbsp;-&nbsp;${course[0].completion}</span></p>
					</div>
				</c:forEach>
			
			<div id="AS">	
				<p>Authorized Signatory</p>
			</div>
				
		</div>
		
	</div>
	<div id="button">
		<button type="button" id="print-button" value="Print" >print</button>
	</div>

</body>
</html>