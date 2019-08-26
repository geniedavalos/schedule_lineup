<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Calendar</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Leckerli+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/app.css">
</head>
<body>
<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.html">LineUP</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login_reg.html">Login/Register</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<!-- NAVBAR ENDS -->

<div class="container mt-2 col-lg-5">
    <div class="card border-0">
        <h3 class="card-header bg-danger text-white text-center" id="monthAndYear"></h3>
        <table class="table table-bordered" id="calendar">
            <thead>
            <tr>
                <th>Sun</th>
                <th>Mon</th>
                <th>Tue</th>
                <th>Wed</th>
                <th>Thu</th>
                <th>Fri</th>
                <th>Sat</th>
            </tr>
            </thead>

            <!-- Calendar BODY -->
            <tbody id="calendar-body" class="text-center"></tbody>
        </table>

        <form class="form-inline">
            <button class="btn btn-outline-primary mr-auto m-2" id="previous" onclick="previous()">Previous</button>
            <label class="lead mr-2 ml-2" for="month">Jump To: </label>
            <select class="form-control mx-2" name="month" id="month" onchange="jump()">
                <option value=0>Jan</option>
                <option value=1>Feb</option>
                <option value=2>Mar</option>
                <option value=3>Apr</option>
                <option value=4>May</option>
                <option value=5>Jun</option>
                <option value=6>Jul</option>
                <option value=7>Aug</option>
                <option value=8>Sep</option>
                <option value=9>Oct</option>
                <option value=10>Nov</option>
                <option value=11>Dec</option>
            </select>


            <label for="year"></label>
                <select class="form-control mx-2" name="year" id="year" onchange="jump()">
                    <option value=2019>2019</option>
                    <option value=2020>2020</option>
                    <option value=2021>2021</option>
                    <option value=2022>2022</option>
                    <option value=2023>2023</option>
                    <option value=2024>2024</option>
                    <option value=2025>2025</option>
                    <option value=2026>2026</option>
                    <option value=2027>2027</option>
                    <option value=2028>2028</option>
                    <option value=2029>2029</option>
                    <option value=2030>2030</option>
                </select>
            <button class="btn btn-outline-primary ml-auto m-2" id="next" onclick="next()">Next</button>            
        </form>
    </div>
</div>

<!-- DROPDOWN SCHEDULE FOR SINGLE DAY VIEW -->
<div class="container col-5 mt-2 dayview">
    <h3 class="pop mb-0"><strong>1/<span class="show-date">1</span>/2019</strong> store# 7976 <a href="">hide</a></h3>
    <table class="col-6 table table-light">
        <tbody>
            <tr>
                <td>
                    <p class="d-inline-block initials align-top">YA</p>
                    <ul class="d-inline-block">
                        <p class="mb-0">Pedro M</p>
                        <li>8:00 AM - 3:00 PM</li>
                        <p>Associate Manager</p>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="d-inline-block initials align-top">TE</p>
                    <ul class="d-inline-block">
                        <li>2:00 PM - 6:00 PM</li>
                        <p>Bartender</p>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="d-inline-block initials align-top">AM</p>
                    <ul class="d-inline-block">
                        <li>5:00 PM - 10:00 PM</li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
</div>

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

<div class="container request mt-2">
    <div class="shift-swap d-inline-block bg-light p-3 text-center">
        <h3>Shift Swap Request</h3>
        <form action="#" method="get">
            <table>
                <tbody>
                    <tr>
                        <td>
                            <p class="mb-0 text-success">* My Scheduled Shift *</p>
                            <p class="text-success">5:00 PM - 10:00 PM</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="shift" id="">
                            <label for="">Shift 1 8:00 AM - 3:00 PM</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="shift" id="">
                            <label for="">Shift 1 2:00 AM - 6:00 PM</label>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Submit!" class="btn btn-outline-info mt-2 d-block mx-auto">
        </form>
    </div>
    <div class="day-off d-inline-block bg-light">
        <h3>Day Off Request</h3>
    </div>
</div>


<!-- <button name="jump" onclick="jump()">Go</button> -->
<script src="/js/calendar.js"></script>

<!-- Optional JavaScript for bootstrap -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous"></script>
</body>
</html>
