<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Schedule</title>
</head>
<body>
	<div class="container">
		<h1>Add someone to schedule</h1>
		<form:form action="/schedule/addSchedule" method="POST" modelAttribute="schedule">
			<form:select path="employee">
				<c:forEach items="${allEmployees}" var="emp">
					<form:option value="${emp.id}" label="${emp.firstName} ${emp.lastName}"/>
				</c:forEach>
			</form:select>
			<form:label path="workDate"> Day of Work</form:label>
			<form:input type="date" path="workDate"/>
			<form:label path="startHour">Start time</form:label>
			<form:input type="time" path="startHour"/>
			<form:label path="endHour">End time</form:label>
			<form:input type="time" path="endHour"/>
			<button type="submit" class="btn btn-success">Submit</button>
		</form:form>
	</div>
</body>
</html>