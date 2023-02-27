<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<style>

	div{
	background-color : #b3f0ff;
	border:5px solid black;
	width : 50%;
	height : 300px;
	margin-top:140px;
	margin-left:350px;
	box-shadow : 18px 22px 25px black;
	border-radius : 15px;
	}
	h1,h3{
	text-align : center;
	}
	button{
  background-color: #008CBA;
  transition-duration: 0.4s;
  font-size: 16px;
  padding: 14px 40px;
  border: 4x solid black;
  border-radius: 8px;
  padding: 15px 50px;
  text-align: center;
  margin-top:70px;
  margin-left : 100px;
  font-weight : bold;
  color : white;
}
	button:hover {
  	background-color: #002080;
  	cursor : pointer;
  	
	}


</style>
</head>
<body>

	<div>

	<h1>Welcome to Infotech Solutions</h1>
	<h3>Students who is Eligible for Internship</h3>
	
	<a href="registerForm"><button>Add Student</button></a>
	<a href="stuList"><button>Student Data</button></a>
	
	</div>

</body>
</html>