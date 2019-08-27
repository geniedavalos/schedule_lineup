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
  <link rel="stylesheet" href="style.css" />

  <style>
    body {
    background: #304D6D;
    color: white;
  }

  nav a, .footer a, .footer{
    color: #A7CCED;
  }

  .navbar-brand {
    font-size: 2rem;
  }

  .white {
    background: white;
    color: black;
  }

  section {
    padding: 2%;
  }

  .center {
    text-align: center;
  }

  .green {
    color: green !important;
  }

  .red {
    color: red !important ;
  }
  .center {
    text-align: center;
  }

  .selected_day, .selected_week {
    padding: 2% 1%;
  }
</style>
</head>
<body>
  <nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="/">LineUp</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Schedule</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="#addStaffMember">Add</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="#editAccess">Edit</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="#allStaffMembers">All</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="#">Sign Out</a>
        </li>
      </ul>
    </div>
  </nav>

  <section class="white">
	<div class="container">
	<div id="addStaffMember">
	<h3>Add Staff</h3>
		<form:form action="/schedule/addStaff" method="POST" modelAttribute="employee">
			<form:label path="firstName">First Name</form:label>
			<form:input path="firstName"/>
			<form:label path="lastName">Last Name</form:label>
			<form:input path="lastName"/>
			<form:label path="email">Email</form:label>
			<form:input path="email"/>
			<form:label path="password">Password</form:label>
			<form:password path="password"/>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
		
		<div id="editAccess">
		<h3>Edit Access</h3>
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
	
	
	<div id="allStaffMembers">
	<h3>All Staff</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Staff name</th>
					<th scope="col">Position</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allEmployees}" var="emp">
					<tr>
						<td><c:out value="${emp.firstName} ${emp.lastName}"/></td>
						<td>
						<c:choose>
							<c:when test="${schedule.employee.accessLevel==9}">Manager</c:when>
							<c:when test="${schedule.employee.accessLevel==1}">Employee</c:when>
						</c:choose>
						</td>
						<td>
							<a href="#" class="btn btn-primary">Edit</a>
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
	</div>
		
</section>
</body>
</html>
