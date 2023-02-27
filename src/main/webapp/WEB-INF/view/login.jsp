<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>

<style type="text/css">
	#p{
		text-align : center;
		margin-top : 80px;
	}
	#parent{
		margin-top : 50px;
		height : 380px;
		width : 280px;
		border : 5px solid black;
		margin-left : 530px;
		border-radius : 8px;
		text-align : center;
	}
	#header{
		background-color :  #ff3399;
		height : 40px;
		width : 280px;
	}
	img{
		height : 80px;
		width : 180px;
	}
	h2{
		color : blue;
	}
	form{
		margin-top : 30px;
	}
	label{
		font-weight : bolder;
	}
	input{
		 padding: 8px;
         width: 200px;
         border-radius: 8px;
         margin-top : 5px;
	}
	button{
		background-color : blue;
		color : white;
		font-weight:bolder;
		height : 30px;
		width : 80px;
		border-radius : 5px;
		margin-top : 5px;
	}
	button:hover{
		cursor : pointer;
		background-color : #3377ff;	
	}
	#footer{
		background-color :  #ff3399;
		margin-top : 36px;
		height : 40px;
		width : 280px;
	}
	#msg{
		margin-top : 50px;
		text-align : center;
	}
</style>
</head>
<body>
	<div id="p">
	<p>Infotech Solutions</p>
	</div>
	<div id="parent"> 
		<div id="header">
			
		</div>
			<h2>Log in</h2>
			<form action="login" method="post">
				<label>Username</label>
				<input type="text" name="username" value="Admin" readonly="readonly"><br><br>
				<label>Password</label>
				<input type="password" name="password" id="pass"><br><br>
				<a href=""><button id="login">Login</button></a>
			
			</form>
		<div id="footer">
			
		</div>
	</div>
	<div id="msg">
			<h4>${wrong}</h4>
	</div>

</body>
</html>