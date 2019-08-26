<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Swap Page</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
</head>
<body>
	<h1>Swap shifts</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Day Scheduled</th>
				<th scope="col">Start Time</th>
				<th scope="col">End Time</th>
				<th scope="col">Swap With: </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mySchedules}" var="schedule">
				<tr>
					<td><fmt:formatDate pattern="E, MM/dd/yyyy" value = "${schedule.workDate}"/></td>
					<td><fmt:formatDate pattern="hh:mm a" value = "${schedule.startHour}"/></td>
					<td><fmt:formatDate pattern="hh:mm a" value = "${schedule.endHour}"/></td>
					<td>
						<form:form action="/schedule/${schedule.id}/swap" method="POST" modelAttribute="scheduleObj">
							<input type="hidden" name="_method" value="put">
							<form:select path="employee">
								<c:forEach items="${allStaff}" var="emp">
									<form:option value="${emp.id}" label="${emp.firstName} ${emp.lastName}"/>
								</c:forEach>
							</form:select>
							<button type="submit" class="btn btn-info">Swap</button>
						</form:form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href="/schedule">Go home</a>
</body>
</html>