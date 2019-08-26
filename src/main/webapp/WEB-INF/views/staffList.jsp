<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>All Staff</h1>
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
							<a href="#">Edit</a>
							<form action="/schedule/employees/${emp.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input class="btn btn-danger" type="submit" value="Delete"/>
							</form>
						</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<a href="/schedule/addStaff">Add Staff</a>
	</div>
</body>
</html>