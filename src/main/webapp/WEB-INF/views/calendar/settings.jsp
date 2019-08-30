<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>LineUp</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="/css/app.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/schedule/home">LineUp</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
       <li class="nav-item active">
          <a class="nav-link" href="/schedule/manager">Dashboard</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/logout">Sign Out</a>
        </li>
      </ul>
    </div>
  </nav>

<div class="container">
  <section class="white" id="addStaffMember">
	<div class="container">
	<h3>Add Staff</h3>
		<form:form action="/schedule/addStaff" method="POST" modelAttribute="employee">
		  <div class="form-group">
			<form:label path="firstName">First Name</form:label>
			<form:input path="firstName" class="form-control"/>
			</div>
			  <div class="form-group">
			<form:label path="lastName">Last Name</form:label>
			<form:input path="lastName" class="form-control"/>
				</div>
			  <div class="form-group">
			<form:label path="email">Email</form:label>
			<form:input path="email" class="form-control"/>
				</div>
			  <div class="form-group">
			<form:label path="password">Password</form:label>
			<form:password path="password" class="form-control"/>
				</div>
			<button type="submit" class="btn btn-primary d-block mx-auto">Submit</button>
		</form:form>
	</div>
</section>

  <section class="white">
		<div id="editAccess" class="container table-responsive">
		<h3>Edit Access <button class="btn btn-outline-primary float-right mb-2" id="addStaff">Add Staff</button></h3>
		<table class="table table-striped text-center">
		<thead>
			<tr>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Position</th>
				<th scope="col">Access Level</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allEmployees}" var="emp">
				<tr>
					<td><c:out value="${emp.firstName} "/></td>
					<td><c:out value="${emp.lastName} "/></td>
					<td>
				<c:choose>
					<c:when test="${emp.accessLevel==9}">Manager</c:when>
					<c:when test="${emp.accessLevel==1}">Employee</c:when>
				</c:choose>
				</td>
					<td>
						<form action="/schedule/${emp.id}/changeAccess" method="POST" class="form-inline">
							<select name="accessLvl" class="custom-select col-8">
								<option value="1" label="Employee"/>
								<option value="9" label="Manager"/>
							</select>
							
							<button type="submit" class="btn btn-success col-3 ml-2">Update</button>
						</form>
					</td>
					<td>
						<form action="/schedule/employees/${emp.id}" method="post" class="d-inline">
							<input type="hidden" name="_method" value="delete">
							<input class="btn btn-danger" type="submit" value="Delete"/>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</section>

   <div id="footer">
        <div class="row social justify-content-center">
          <a href="https://www.facebook.com" class="fa fa-facebook" target="_blank"></a>
          <a href="https://www.twitter.com" class="fa fa-twitter" target="_blank"></a>
          <a href="https://www.youtube.com" class="fa fa-youtube" target="_blank"></a>
          <a href="https://www.skype.com" class="fa fa-skype"target="_blank"></a>
        </div>
    <div class="text-center text-white">© Copyright 2019 LineUp </div>
  </div>
 </div>
 <script src="/js/app.js"></script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
</body>
</html>
