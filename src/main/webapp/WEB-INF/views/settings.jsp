<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Manager Settings</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="#">ProjName</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarText">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item">
		        <a class="nav-link" href="#">Settings</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Logout</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		
		<div class="body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Access Level</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allEmployees}" var="emp">
						<tr>
							<td><c:out value="${emp.firstName} ${emp.lastName}"/></td>
							<td>
								<form action="/schedule/${emp.id}/changeAccess" method="POST">
									<select name="accessLvl">
										<option value="1" label="Employee"/>
										<option value="9" label="Manager"/>
									</select>
									<button type="submit" class="btn btn-success">Update</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</div>
	</div>
</body>
</html>