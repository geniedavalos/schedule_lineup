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
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
        var calendar = new FullCalendar.Calendar(calendarEl, {
          plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
          },
          defaultDate: '2019-08-29',
          navLinks: true, // can click day/week names to navigate views
          businessHours: true, // display business hours
          editable: true,
          selectable:true,
          dateClick:function(info){
        	console.log(info);
          },
          events: [
            {
              title: 'Business Lunch',
              start: '2019-08-03T13:00:00',
              constraint: 'businessHours'
            },
            {
              title: 'Meeting',
              start: '2019-08-13T11:00:00',
              constraint: 'availableForMeeting', // defined below
              color: '#257e4a'
            },
            {
              title: 'Conference',
              start: '2019-08-18',
              end: '2019-08-20'
            },
            {
              title: 'Party',
              start: '2019-08-29T20:00:00'
            },
            // areas where "Meeting" must be dropped
            {
              groupId: 'availableForMeeting',
              start: '2019-08-11T10:00:00',
              end: '2019-08-11T16:00:00',
              rendering: 'background'
            },
            {
              groupId: 'availableForMeeting',
              start: '2019-08-13T10:00:00',
              end: '2019-08-13T16:00:00',
              rendering: 'background'
            },
            // red areas where no events can be dropped
            {
              start: '2019-08-24',
              end: '2019-08-28',
              overlap: false,
              rendering: 'background',
              color: '#ff9f89'
            },
            {
              start: '2019-08-06',
              end: '2019-08-08',
              overlap: false,
              rendering: 'background',
              color: '#ff9f89'
            }
          ]
        });
        calendar.render();
      });
    </script>
</head>

<body>

  <!-- NAVBAR -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">LineUp</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Sign Out</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- NAVBAR ENDS -->
  <section class="top_info">
    <div class="row">
      <div class="container mt-2 col-10">
        <div id="calendar"></div>
      </div>
    </div>
  </section>

  <section class="bottom_info">
    <div class="row">
      <div class="col-5 container mt-2">
        <h4>Shift Schedule</h4>
        <h5 class="center"> {schedule.workDate}</h5>

        <div class="form-check center">
          <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
          <label class="form-check-label" for="exampleRadios1">
            <strong>{schedule.workDate.first_name}</strong> : {schedule.workDate.startHour} - {schedule.workDate.endHour}
          </label>
        </div>

        <div class="form-check center">
          <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
          <label class="form-check-label" for="exampleRadios1">
            <strong>{schedule.workDate.first_name}</strong> : {schedule.workDate.startHour} - {schedule.workDate.endHour}
          </label>
        </div>
        <div class="center">
          <a href="#" class="btn btn-primary">Submit</a>

        </div>
      </div>

      <div class="col-5 container">
        <h4>Day Off Request</h4>
        <h5>Date</h5>
        <form:form action="/schedule/requestOff" method="post" modelAttribute="request">
        	<form:hidden path="sender" value="${emp_id}"/>
        	<form:label path="start">Start Date</form:label>
        	<form:input type="date" path="start"/>
        	<form:label path="end">End Date</form:label>
        	<form:input type="date" path="end"/>
		<form:label path="type">Type</form:label>
        	<form:select path="type">
        		<form:option value="paid" label="PTO"/>
        		<form:option value="sick" label="Sick"/>
        		<form:option value="pto" label="Others"/>
        	</form:select>
        	<form:label path="description">Description</form:label>
        	<form:input type="textarea" path="description"/>
        	<button type="submit" class="btn btn-primary">submit</button>
        </form:form>
        
      </div>
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


  <!-- <button name="jump" onclick="jump()">Go</button> -->
  <script src="/js/calendar.js"></script>

  <!-- Optional JavaScript for bootstrap -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
