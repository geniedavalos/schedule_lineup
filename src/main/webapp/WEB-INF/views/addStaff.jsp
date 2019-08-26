<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Staff</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>Admin Add Staff</h1>
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
	</div>
</body>
</html>