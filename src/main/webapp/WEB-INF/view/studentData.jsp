<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Record</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

 $('document').ready(function(){
	 $('#list').change(function(){
		 var l = $('#list').val();
			$('#searchvalue').val("");
			$.ajax({
				type : 'GET',
				datatype : 'JSON',
				url : 'List',
				data : {"value": l},
				contextType : 'application/json',
				
				success : function(response){
						var data = JSON.parse(response);
						var len = data.length;
						$('tbody').find('tr').remove();
						for(let i=0;i<len;i++)
						{
							$('tbody').append('<tr ><td name="id">'+data[i].id+'</td><td>'+data[i].name+'</td><td>'+data[i].email+'</td><td>'+data[i].phone+'</td><td>'+data[i].date+'</td><td>'+data[i].address+'</td><td><button id="edit"><a href="editForm/'+data[i].id+'">Edit </a></button></td><td><button id="certificate"><a href="certificate/'+data[i].id+'"> View </a></button></td><td><button id="delete"><a href="deleteStudent/'+data[i].id+'"> Delete </a></button></td></tr>')
						}
			}
		 })
	 })
	 
	 $('#search').click(function(){
		 var search = $('#searchvalue').val();
			$.ajax({
				type : 'POST',
				data : {"search": search},
				datatype : 'JSON',
				url : 'searchStu',
				contextType : 'application/json',
				
				success : function(response){
						var data = JSON.parse(response);
						var len = data.length;
						$('tbody').find('tr').remove();
						for(let i=0;i<len;i++)
						{
							$('tbody').append('<tr ><td name="id">'+data[i].id+'</td><td>'+data[i].name+'</td><td>'+data[i].email+'</td><td>'+data[i].phone+'</td><td>'+data[i].date+'</td><td>'+data[i].address+'</td><td><button id="edit"><a href="editForm/'+data[i].id+'">Edit </a></button></td><td><button id="certificate"><a href="certificate/'+data[i].id+'"> View </a></button></td><td><button id="delete"><a href="deleteStudent/'+data[i].id+'"> Delete </a></button></td></tr>')
						}
						$('#list').val(''); 
					}
			})
		 
	 })
	 	
 });
 
 
 


</script>
<style>
	
	h1{
		display : inline-block;
		margin-left : 550px;
	}
	.searchBar{
		display:inline-block;
		margin-left : 270px;
	}
	.search{
		background-color : #3333ff;
		color : white;
		cursor : pointer;
	}
	#list{
		margin-left : 80px;
		background-color : black;
		color : white;
	}
	div{
		text-align:center;
	}
	.row{
	margin-top : 30px;
	margin-left : 80px;
	}
	table,th,td{
		border : 1px solid black;
		border-collapse: collapse;
		font-size : 20px;
	}
	table{
		width : 95%;
	}
	th,td{
		padding:10px;
	}
	#home{
		background-color: #008CBA;
  	transition-duration: 0.4s;
  	font-size: 16px;
  	border: 4x solid black;
  	border-radius: 8px;
  	padding: 15px 50px;
  	text-align: center;
  	margin-top:50px;
  	color : white;
  	font-weight : bold;
  	cursor : pointer;
	}
	#home:hover {
  		background-color: #002080;
	}

	#edit{
		background-color: #ffbf00;
  		transition-duration: 0.4s;
  		font-size: 15px;
  		border : 4px solid white;
  		padding: 6px;
  		border-radius: 8px;
  		text-align: center;
  		width : 70px;
	}
	#certificate{
		background-color: #4dff4d;
		border : 4px solid white;
  		transition-duration: 0.4s;
  		font-size: 15px;
  		padding: 6px;
  		border-radius: 8px;
  		text-align: center;
  		width : 70px;
	}
	#delete{
		background-color: #ff3300;
		border : 4px solid white;
  		transition-duration: 0.4s;
  		font-size: 15px;
  		padding: 6px;
  		border-radius: 8px;
  		text-align: center;
  		width : 70px;
	}
	.cur{
		font-weight : bold;
	}
	.cur:hover{
		cursor:pointer;
	}
</style>

</head>
<body>
		<h1>Student Record</h1>
		<div class="searchBar">
  			<input type="text" placeholder="Search Name..." id="searchvalue">
  			<input class="search" type="submit" value="search" id="search"/>
		</div>
		
		<select name="students" id="list">
  			<option value="ALL" class="li">ALL</option>
  			<option value="1" class="li">1</option>
  			<option value="5" class="li">5</option>
  			<option value="10" class="li">10</option>
		</select>
		
		<div>
		<div class="row">

			<table>
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Contact</th>
						<th scope="col">Date</th>
						<th scope="col">Address</th>
						<th scope="col">Edit</th>
						<th scope="col">Certificate</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="stu" items="${Student}" >
						<tr >
							<td name="id">${stu.id}</td>
							<td>${stu.name}</td>
							<td>${stu.email}</td>
							<td>${stu.phone}</td>
							<td>${stu.date}</td>
							<td>${stu.address}</td>
							
							<td><a href="editForm/${stu.id}"><button id="edit" class="cur">Edit</button> </a></td>
							<td><a href="certificate/${stu.id}"><button id="certificate" class="cur"> View </button></a></td>
							<td><a href="deleteStudent/${stu.id}"><button id="delete" class="cur"> Delete</button> </a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<a href="home"><button id="home">Home</button></a>
	</div>
	

</body>
</html>