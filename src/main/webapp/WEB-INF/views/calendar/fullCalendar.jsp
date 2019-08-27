<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	  }
	
	  #calendar {
	    max-width: 900px;
	    margin: 0 auto;
	  }

	</style>
	
</head>
<body>
	<div id="calendar"></div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>