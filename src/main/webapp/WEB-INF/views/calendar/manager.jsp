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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Leckerli+One&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../css/app.css">
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

  <style>
    body {
    background: #304D6D;
  }

.green {
color: green;}

.red {
color: red;}
  .fa {
    padding: 10px;
    margin: 10px;
    font-size: 30px;
    width: 50px;
    text-align: center;
    border-radius: 8%;
    text-decoration: none;
    border: 1px white solid;
  }

  .social {
    vertical-align: middle;
}
  .fa-skype {
    background: #00aff0;
    color: white;
  }
  .fa-youtube {
    background: #bb0000;
    color: white;
  }
  .fa-facebook {
    background: #3B5998;
    color: white;
  }

  .fa-twitter {
    background: #55ACEE;
    color: white;
  }

  #footer {
  background: #304D6D;
  }

  .row {
  background : white;
  }

  nav a, .footer a, .footer{
    color: #A7CCED;
  }

  .navbar-brand {
    font-size: 2rem;
  }

  section {
    padding: 2%;
  }

  .center {
    text-align: center;
  }

  .col-5 {
    text-align: center;
  }

	  body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	  }

	  #calendar {
	    max-width: 900px;
	    margin: 0 auto;
	  }
	  
	  .white {
	  background: white;
	  }
	  
	  section {
	  margin: 1%;
	  }
	</style>

</head>

<body>

  <!-- NAVBAR -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.html">LineUP</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
  <section class="top_info">
    <div class="row">
      <div class="container mt-2 col-10">
        <div id="calendar"></div>
      </div>
    </div>
  </section>

  <section class="bottom_info white">
    <div class="container">
      <h3>Pending Request</h3>
      <div class="pending_items">
        <ul class="center">
          <li>
            <strong>{schedule.first_name}</strong> - {schedule.time} <a href="#" class="green"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></a>
            <a href="#" class="red"><i class="fa fa-calendar-times-o" aria-hidden="true"></i></a>
          </li>
          <li>
            <strong>{schedule.first_name}</strong> - {schedule.time} <a href="#" class="green"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></a>
            <a href="#" class="red"><i class="fa fa-calendar-times-o" aria-hidden="true"></i></a>
          </li>
          <li>
            <strong>{schedule.first_name}</strong> - {schedule.time} <a href="#" class="green"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></a>
            <a href="#" class="red"><i class="fa fa-calendar-times-o" aria-hidden="true"></i></a>
          </li>
        </ul>
      </div>
    </div>
  </section>
  
  <section class="schedule white">
    <div class="container">
      <h3>Schedule View</h3>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
        <label class="form-check-label" for="exampleRadios1">
          Day
        </label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
        <label class="form-check-label" for="exampleRadios1">
          Week
        </label>
      </div>
      <a href="#" class="btn btn-primary">Submit</a>


      <div class="selected_day">
        <h4>Day</h4>
        <div class="row">
          <div class="col-4">
            <h3 class="title">{event.date}</h3>
          </div>
          <div class="col-8">
            <p> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</p>
            <p> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</p>
            <p> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</p>

          </div>
        </div>
      </div>

      <div class="selected_week">
        <h4>Week</h4>
        <div class="row">
          <ul class="col-4">
            <h3 class="title">{event.date}</h3>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
          </ul>
          <ul class="col-4">
            <h3 class="title">{event.date}</h3>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
          </ul>
          <ul class="col-4">
            <h3 class="title">{event.date}</h3>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
          </ul>
          <ul class="col-4">
            <h3 class="title">{event.date}</h3>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
          </ul>
          <ul class="col-4">
            <h3 class="title">{event.date}</h3>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
          </ul>
          <ul class="col-4">
            <h3 class="title">{event.date}</h3>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
          </ul>
          <ul class="col-4">
            <h3 class="title">{event.date}</h3>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
            <li> <strong>{schedule.employee.name}</strong> - {schedule.employee.time}</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  
  <section class="addSchedule white">
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
  </section>

  <script src="/js/calendar.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>

</html>
