<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Test</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<form:form class="form-horizontal" action='/register' method="POST" modelAttribute="employee">
	  <fieldset>
	  	<form:hidden path="accessLevel" value="9"/>
	    <div id="legend">
	      <legend>Register</legend>
	    </div>
	    <div class="control-group">
	      <!-- E-mail -->
	      <form:label class="control-label" path="email">E-mail</form:label>
	      <div class="controls">
	        <form:input type="text" id="email" path="email" class="input-xlarge"/>
	      </div>
	    </div>
	    
	    <div class="control-group">
	      <!-- First Name -->
	      <form:label class="control-label" path="firstName">First Name</form:label>
	      <div class="controls">
	        <form:input type="text" id="email" path="firstName" class="input-xlarge"/>
	      </div>
	    </div>
	    
	    <div class="control-group">
	      <!-- Last Name -->
	      <form:label class="control-label" path="lastName">Last Name</form:label>
	      <div class="controls">
	        <form:input type="text" id="email" path="lastName" class="input-xlarge"/>
	      </div>
	    </div>
	 
	    <div class="control-group">
	      <!-- Password-->
	      <form:label class="control-label" path="password">Password</form:label>
	      <div class="controls">
	        <form:password id="password" path="password" class="input-xlarge"/>

	      </div>
	    </div>
	 
	    <div class="control-group">
	      <!-- Password -->
	      <form:label class="control-label"  path="passwordConfirmation">Password (Confirm)</form:label>
	      <div class="controls">
	        <form:password id="password_confirm" path="passwordConfirmation" placeholder="" class="input-xlarge"/>
	      </div>
	    </div>
	 
	    <div class="control-group">
	      <!-- Button -->
	      <div class="controls">
	        <button type="submit" class="btn btn-success">Register</button>
	      </div>
	    </div>
	  </fieldset>
	</form:form>
</body>
</html>