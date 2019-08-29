<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Calendar</title>

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <link href="https://fonts.googleapis.com/css?family=Leckerli+One&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/app.css">
  <link href='/fullcalendar/packages/core/main.css' rel='stylesheet' />
  <link href='/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
  <link href='/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
  <link href='/fullcalendar/packages/list/main.css' rel='stylesheet' />

  <script src='/fullcalendar/packages/core/main.js'></script>
  <script src='/fullcalendar/packages/daygrid/main.js'></script>
  <script src='/fullcalendar/packages/interaction/main.js'></script>
  <script src='/fullcalendar/packages/timegrid/main.js'></script>
  <script src='/fullcalendar/packages/list/main.js'></script>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var dateToSchedule;
        
        var data = [
    		<c:forEach items="${schedules}" var="schedule" varStatus="loop">
    			{
    			'title': '${schedule.employee.firstName} ${schedule.employee.lastName}',
    			'start': '<fmt:formatDate pattern="yyyy-MM-dd" value="${schedule.workDate}"/>T<fmt:formatDate pattern="hh:mm:ss" value="${schedule.startHour}"/>'
    			}${!loop.last ? ',': ''}
    		</c:forEach>
    		]
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
          plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek'
          },
          navLinks: true, // can click day/week names to navigate views
          businessHours: true, // display business hours
          editable: true,
          selectable:true,
          dateClick:function(info){
        	 
        	dateToSchedule = info.dateStr;
        	var string = '<input id="workDate" type="hidden" value="'+ dateToSchedule+'" name="workDate" />';
        	document.getElementById("dateInput").innerHTML= string;
        	$('#exampleModal').modal('show');
          },
          events:data
        });
        calendar.render();
      });
    </script>

</head>

<body>

	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Schedule Employee</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form:form action="/schedule/addSchedule" method="post" modelAttribute="schedule">
        	<form:select path="employee">
				<c:forEach items="${allEmployees}" var="emp">
					<form:option value="${emp.id}" label="${emp.firstName} ${emp.lastName}"/>
				</c:forEach>
			</form:select>
			<div id="dateInput"></div>
			<form:label path="startHour">Start time</form:label>
			<form:input type="time" path="startHour"/>
			<form:label path="endHour">End time</form:label>
			<form:input type="time" path="endHour"/>
			<button type="submit" class="btn btn-success">Submit</button>
        </form:form>
      </div>
    </div>
  </div>
</div>

  <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">LineUp</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
       <li class="nav-item active">
          <a class="nav-link" href="/schedule/settings">Settings</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/logout">Sign Out</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- NAVBAR ENDS -->
  <div class="container">
  <section class="top_info">
    <div class="row">
      <div class="container mt-2 col-10">
        <div id="calendar"></div>
      </div>
    </div>
  </section>


  <section class="bottom_info white">
    <div class="container table-responsive">
      <h3>Pending Request</h3>
      <div class="pending_items">
      <table class="table text-center">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Requested Dates</th>
					<th scope="col">Reason</th>
					<th scope="col">Action</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="req" items="${requests}">
        	<c:if test="${req.approved == null}">
				<tr>
					<td><c:out value="${req.sender.firstName} ${req.sender.lastName}"/></td>
					<td><fmt:formatDate pattern="E, MM/dd/yy" value="${req.start}"/> - <fmt:formatDate pattern="MM/dd/yy" value="${req.end}"/></td>
					<td><c:out value="${req.description}"/></td>
					<td><div class="block"><a href="/schedule/request/${req.id}/accepted" class="green">
					<i class="fa fa-calendar-check-o" id="green" aria-hidden="true"></i> 
					<a href="/schedule/request/${req.id}/denied" class="red">
					<i class="fa fa-calendar-times-o" id="red" aria-hidden="true"></i></a></div>
					</td>
				</tr>
        	</c:if>
        	</c:forEach>
			</tbody>
		</table>
      </div>
    </div>
  </section>
  
 
  
<%--   <section class="addSchedule white">
  <div class="container">
  <h3>Add someone to schedule</h3>
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
  </section> --%>
  
  <section class="viewSchedule white">
  <div class="container table-responsive">
	<h3>Schedules</h3>
		<table class="table table-striped text-center">
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
				<c:forEach items="${schedules}" var="schedule">
				<tr>
					<td><c:out value="${schedule.employee.firstName} ${schedule.employee.lastName}"/></td>
					<td>
						<c:choose>
							<c:when test="${schedule.employee.accessLevel==9}">Manager</c:when>
							<c:when test="${schedule.employee.accessLevel==1}">Employee</c:when>
						</c:choose>
					</td>
					<td><fmt:formatDate pattern="MM/dd/yyyy" value = "${schedule.workDate}"/></td>
					<td><fmt:formatDate pattern="hh:mm a" value = "${schedule.startHour}"/></td>
					<td><fmt:formatDate pattern="hh:mm a" value = "${schedule.endHour}"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</section>
		
		
	<div id="footer">
		<div class="row social justify-content-center">
	          <a href="#" class="fa fa-facebook"></a>
	          <a href="#" class="fa fa-twitter"></a>
	          <a href="#" class="fa fa-youtube"></a>
	          <a href="#" class="fa fa-skype"></a>
	       </div>
	    	<div class="text-center text-white">© Copyright 2019 LineUp </div>
  	</div>
  	</div>

  <script src="/js/calendar.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
