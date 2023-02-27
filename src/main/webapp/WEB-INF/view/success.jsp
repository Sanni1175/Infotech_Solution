<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	body{
		background-color : #ff9999;
	}
	div{
	width : 50%;
	height : 300px;
	margin-top:140px;
	margin-left:350px;
	}
	h1{
	text-align : center;
	}
	button{
  background-color: #adebeb;
  font-size: 16px;
  padding: 14px 40px;
  width : 200px;
  height : 50;
  border: 4x solid black;
  border-radius: 8px;
  padding: 15px 50px;
  text-align: center;
  margin-top:70px;
  margin-left : 100px;
  transition-duration: 0.4s;
}

	button:hover {
  	background-color: #4CAF50;
	}
a{
	color: black;;
	text-decoration:none;
}
</style>
</head>
<body>

	<div>
		<h1>${result }</h1>
		
		<a href="/springMvc/home"><button>Home</button></a>
		<a href="/springMvc/stuList"><button>Student Data</button></a>
	</div>
	

</body>
</html>