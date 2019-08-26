<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Test Query Page</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<h1>Query sorted by day</h1>
	
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Position</th>
					<th scope="col">Day scheduled</th>
					<th scope="col">Start time</th>
					<th scope="col">End time</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${byDay}" var="schedule">
				<tr>
					<td><c:out value="${schedule.employee.firstName} ${schedule.employee.lastName}"/></td>
					<td>
						<c:choose>
							<c:when test="${schedule.employee.accessLevel==9}">Manager</c:when>
							<c:when test="${schedule.employee.accessLevel==1}">Employee</c:when>
						</c:choose>
					</td>
					<td><fmt:formatDate pattern="E, MM/dd/yyyy" value = "${schedule.workDate}"/></td>
					<td><fmt:formatDate pattern="hh:mm a" value = "${schedule.startHour}"/></td>
					<td><fmt:formatDate pattern="hh:mm a" value = "${schedule.endHour}"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>