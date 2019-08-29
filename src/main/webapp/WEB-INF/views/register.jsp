<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Welcome to LineUp</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Leckerli+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="/">LineUp</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </nav>
    <!-- NAVBAR ENDS -->
    <!-- LOGIN / REG -->
    <div class="container mt-3 signin">
        <!-- <h1 class="text-center display-4 heading">LineUP</h1> -->
    
        <!--mini_content STARTS -->
        <div class="mx-auto">
            <h2 class="login d-lg-none text-center text-warning">login</h2>
            <form class="login d-lg-none align-top" action="/login" method="post">
                <div class="form-group">
                    <label for="email">Email </label>
                    <input type="text" name="email" class="form-control shadow">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control shadow">
                </div>
                <input type="submit" value="Log In" class="btn btn-outline-info shadow font-weight-bold">
            </form>
    
            <h2 class="text-center d-lg-none">-or-</h2>
            <h2 class="register d-lg-none text-center text-warning">register</h2>
            <form:form class="register d-lg-none" action='/register' method="POST" modelAttribute="employee">
                <div class="form-group">
                    <form:label path="firstName">First Name</form:label>
                    <form:input type="text" path="firstName" class="form-control col-10 shadow"/>
                </div>
                <div class="form-group">
                    <form:label path="lastName">Last Name</form:label>
                    <form:input type="text" path="lastName" class="form-control col-10 shadow"/>
                </div>
                <div class="form-group">
                    <form:label path="email">Email</form:label>
                    <form:input type="text" path="email" class="form-control col-10 shadow"/>
                </div>
                <div class="form-group">
                    <form:label path="password">Password</form:label>
                    <form:input type="password" path="password" class="form-control col-10 shadow"/>
                </div>
                <div class="form-group">
                    <form:label path="passwordConfirmation">Confirm Password</form:label>
                    <form:input type="password" path="passwordConfirmation" class="form-control col-10 shadow"/>
                </div>
                <input type="submit" value="Register" class="btn btn-outline-info shadow font-weight-bold">
            </form:form>
        </div>
        <!--mini_content ENDS -->
   
        <form:form class="d-none d-lg-inline-block col-7" action='/register' method="POST" modelAttribute="employee">
            <h2 class="text-warning">register</h2>
            <div class="form-group">
                <form:label path="firstName">First Name <br><form:errors path="firstName" class="text-danger"/></form:label>
                <form:input type="text" path="firstName" class="form-control col-10 shadow"/>
            </div>
            <div class="form-group">
                <form:label path="lastName">Last Name <br><form:errors path="lastName" class="text-danger"/></form:label>
                <form:input type="text" path="lastName" class="form-control col-10 shadow"/>
            </div>
            <div class="form-group">
                <form:label path="email">Email <br><form:errors path="email" class="text-danger"/></form:label>
                <form:input type="text" path="email" class="form-control col-10 shadow"/>
            </div>
            <div class="form-group">
                <form:label path="password">Password <br><form:errors path="password" class="text-danger"/></form:label>
                <form:input type="password" path="password" class="form-control col-10 shadow"/>
            </div>
            <div class="form-group">
                <form:label path="passwordConfirmation">Confirm Password <br><form:errors path="passwordConfirmation" class="text-danger"/></form:label>
                <form:input type="password" path="passwordConfirmation" class="form-control col-10 shadow"/>
            </div>
            <input type="submit" value="Register" class="btn btn-outline-info shadow font-weight-bold">
        </form:form>
    
        <form class="d-none d-lg-inline-block align-top col-4" action="/login" method="post">
            <h2 class="text-warning">login</h2>
            <p class="text-danger m-0"><c:out value="${error}"/></p>
            <div class="form-group">
                <label for="email">Email </label>
                <input type="text" name="email" class="form-control shadow">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control shadow">
            </div>
            <input type="submit" value="Log In" class="btn btn-outline-info shadow font-weight-bold">
        </form>
    </div>
    
    <div id="footer">
        <div class="row social justify-content-center">
          <a href="#" class="fa fa-facebook"></a>
          <a href="#" class="fa fa-twitter"></a>
          <a href="#" class="fa fa-youtube"></a>
          <a href="#" class="fa fa-skype"></a>
        </div>
    <div class="text-center text-white">© Copyright 2019 LineUp </div>
  </div>
    <!-- LOGIN / REG ENDS-->
    <script src="/js/app.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>
