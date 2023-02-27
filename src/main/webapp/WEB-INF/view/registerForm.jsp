<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored = "false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
var i = ${len};
$(document).ready(function(){
	
  $('#course-Add').click(function(){
	  
	  let input = $('.courseName').last().val();
	  if(input === '')
		 {}
	  else{
		  i++;
		  $('.courseName').last().css("border", "2px solid black");
	 	 var v = $('#tab').append('<tr id="row"><td><input class="courseName" name="course['+i+'].courseName" required="true"/></td><td><input class ="completion" type="date" name="course['+i+'].completion" onBlur="duration(this)" /></td><td><select class="courseDetail" name="course['+i+'].Experience"><option value="Fresher">Fresher</option><option value="1 Year">1 Year</option><option value="2 Years">2 Years</option><option value="3 Years">3 Years</option><option value="3+ Years">3+ Years</option></select></td><td><select class="courseDetail" name="course['+i+'].Grade"><option value="A+">A+</option><option value="A">A</option><option value="B">B</option><option value="C">C</option><option value="F">F</option></select></td><td><input class="duration" placeholder="0 Days" name="course['+i+'].duration" readonly="readonly"/></td><td><button class="dlt-row" type="button" onclick="rowUpdate(this)">X</button></td><tr>.');
	 	 input = "";
	  }
	  });
  
  $('#email').blur(function(){
	  	var id = $('#id').val();
		var email = $('#email').val();
		$.ajax({
			url : "/springMvc/validateStudent",
			data : {"id": id, "email":email},
			success : function(result){
				if(result== 'existed'){
					$('#p').html('Email Already Registered !!!');
					$('#email').focus();
					$('#submit').prop("disabled",true);
				}else{
					$('#p').html('');
					$('#submit').prop("disabled",false);
				}
			}
		});
	});
});

function rowUpdate(v)
{	
	if($(v).parent().parent().index() === 0){
	$(".courseName").first().val("");
	$('#e option:first').prop('selected',true);
	$('#g option:first').prop('selected',true);
	$('#c').val('reset');
	$('#d').val('0 Days');
	
	}
	else{
		$(v).parent().parent().remove(); 
	}	
}

function duration(v){
  	var regDate = $('#regDate').val();
  	var compDate = $(v).val();
  	var day1 = new Date(regDate);
  	var day2 = new Date(compDate);
  	
  	var millisBetween = day2.getTime() - day1.getTime();
  	var days = millisBetween / (1000 * 3600 * 24); 
  	if(days>-1){
  	$(v).closest('tr').find('.duration').val(days+" Days"); 
  	}
}

</script>

<style>
body {
            margin: 100px 0 0 230px;
            font-family: sans-serif;
        }

        #container {
            width: 900px;
            border-radius: 6px;
            box-shadow: 18px 22px 15px rgb(0 0 0 / 80%);
            background-color: whitesmoke;
        }

        h2 {
        	margin-top: 10px;
            margin-left: 20px;
            
        }

        #parent {
            width: 900px;
            height: 123px;
            display: flex;
        }

        div {
            width: 290px;
        }

        .table {
           margin-left : 30px;
        }

        input {
            padding: 8px;
            width: 220px;
            border-radius: 8px;
            margin-bottom: 8px;
        }
        textarea {
            max-width: 250px;
            max-height: 90px;
            border-radius: 8px;
            border: 2px solid black;
        }
        button {
            top: 10px;
            left: 420px;
            padding: 5px;
            font-weight: bolder;
            border-radius: 5px;
            cursor: pointer;
        }

        label {
            font-weight: bolder;
            top: -2px;
        }
        select{
        	width : 180px;
        	height : 100px;
        }
        #cour{
        	margin : 0px 38px;
        }
        .exp{margin : 0px 0px 0px 40px;}
        .gc{ margin : 0px 0px 0px 41px;}
        #dur{
        	margin-left : 60px;
        }
        #cou{
        	width : 684px;
        	margin-top : 30px;
        	margin-left : 50px;
        	padding : 10px;
        }
        .courseName{
        	 padding: 8px;
            width: 155px;
            border-radius: 8px;
            margin-bottom: 8px;
            margin-left : 5px;
            margin-right : 16px;
            margin-top : 15px;
        }
        .courseDetail{
        	padding: 8px;
            width: 92px;
            height : 40px;
            border-radius: 8px;
            margin : 8px 10px 0px 10px;
            border : 2px solid black;
        }
        .completion{
        	padding: 8px;
        	margin : 8px 10px 0px 10px;
        	width : 100px;
        }
        .duration{
        	padding: 8px;
        	margin : 8px 10px 0px 10px;
        	width : 80px;
        }
        #submit {
            background-color: rgba(0, 0, 255, 0.8);
            margin: 33px 0px 40px 425px;
            color: white;
        }
        #submit:hover {
            background-color: black;
            color: white;
        }
        #course-Add{
        	position : absolute;
        	margin : 296px 0px 0px 600px;
        	width : 80px;
        	background-color : yellow;
        }
        .dlt-row{
        	background-color : red;
        	margin: 0px 0px 10px 10px;
        }
        #p{
        	position : absolute;
        	margin : 0px 0px 20px 10px;
        	color : red;
        }
        .duration:hover{
        	cursor : no-drop;
        }
        
</style>

</head>
<body>
	<div id="container">
	<button id="course-Add" >Add</button>
	<form:form  action="addStu" method="post" modelAttribute="student">
        <h2>${form}</h2>
        <form:input  id="id" path="id" hidden="true"/>
        <div id="parent">
            <div>
                <table class="table">
                    <tr>
                        <td>
                            <label>Name*</label><br>
                            <form:input type="text" placeholder="Enter Name" path="name" required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Email*</label><br>
                            <form:input type="email" id="email" placeholder="Enter Email" path="email" required="true"/>
                            <p id="p"></p>
                        </td>
                    </tr>
                </table>
            </div>
           
			 <div>
                <table class="table">
                    <tr>
                        <td>
                            <label>Phone*</label><br>
                            <form:input type="text" placeholder="Enter Phone" path="phone" required="true" pattern="[0-9]{10}" title="Enter 10 Digit Contact Number"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Date*</label><br>
                            <form:input id="regDate" type="date" placeholder="dd/mm/yy" path="date" required="true"/>
                        </td>
                    </tr>
                </table>
            </div>
            <table class="table">
            <tr>
                <td>
                    <label>Address</label><br>
                    <form:textarea path="address" cols="100" rows="6" placeholder="Enter Address"></form:textarea>
                </td>
            </tr>
        </table>
            
        </div>
        
        <div id="cou">
            	<label id="cour">Course Name*</label>
            	<label class="gc">Completion</label>
            	<label class="exp">Experience</label>
            	<label class="gc">Grade</label> 
            	<label id="dur">Duration</label><br>
            <table id="tab">
            	<c:forEach var ="i" begin="0" end="${len}">
            	<form:input path="course[${i}].id" hidden="true"/>
            	<tr id="row">
            		<td>
               			<form:input class="courseName" id="couName" path="course[${i}].courseName" required="true"/>
               		</td>
               		<td>
                            <form:input class="completion" id="c" type="date" path="course[${i}].completion" onBlur="duration(this)" />
                    </td>
               		<td>
              			<form:select class="courseDetail" id="e" path="course[${i}].Experience">
               				<form:option value="Fresher">Fresher</form:option>
               				<form:option value="1 Year">1 Year</form:option>
               				<form:option value="2 Years">2 Years</form:option>
               				<form:option value="3 Years">3 Years</form:option>
               				<form:option value="3+ Years">3+ Years</form:option>
               			</form:select>
               		</td>
               		<td>
              			<form:select class="courseDetail" id="g" path="course[${i}].Grade">
               				<form:option value="A+">A+</form:option>
               				<form:option value="A">A</form:option>
               				<form:option value="B">B</form:option>
               				<form:option value="C">C</form:option>
               				<form:option value="F">F</form:option>
               			</form:select>
               		</td>
               		
                    <td>
                            <form:input class="duration" placeholder="0 Days" path="course[${i}].duration"  id="d" readonly="true"/>
                    </td>
               		<td>
               			<button class="dlt-row" type="button" onClick="rowUpdate(this)">X</button>
               		</td>
               	<tr> 
               	</c:forEach>
          	</table>
        </div>
        
        <a href=""><form:button id="submit">Submit</form:button></a>
	</form:form>
    </div>
</body>
</html>