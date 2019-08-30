<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>LineUp</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
  <body data-spy="scroll" data-target="#main-nav" id="home">
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="main-nav">
   
      <a href="/" class="navbar-brand">LineUp</a>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
    aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">

        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="#explore" class="nav-link">Explore</a>
          </li>
          <li class="nav-item">
            <a href="#pricing" class="nav-link">Pricing</a>
          </li>
        </ul>
      </div>
  </nav>

  <!-- HOME SECTION -->
  <header id="home-section">
    <div class="dark-overlay">
      <div class="home-inner container">
        <div class="row">
          <div class="d-lg-block ml-3">
            <h1 class="display-4 title">Better <span class="emphasis">Scheduling</span> System.
            </h1>
            <div class="d-flex">
              <div class="p-3">
              <h3 class="col-lg-10">
               	Simplify employee management with LineUp, an interactive and easy to use calendar scheduling system.
                </h3>
              </div>
            </div>
        </div>
      </div>
    </div>
  </header>

  <!-- EXPLORE HEAD -->
  <section id="explore" class="blue">
    <div class="container">
        <div class="text-center py-5">
          <h1 class="display-4 my-4">Explore</h1>
          <h3>
          	Request a demo of <span class="emphasis">LineUp</span>, our interactive calendar including</h3>
          	<h3><span class="highlight">Click-to-Schedule</span>, <span class="highlight">Time-Off-Request</span>, and <span class="highlight">Autofill Calendar</span>!
          </h3>
          <a href="/" class="btn btn-outline-light btn-lg my-3">Find Out More</a>
        </div>
      </div>
  </section>

  <!-- EXPLORE SECTION -->
  <section id="explorebody">
     <div class="container">
      <div class="row justify-content-around">
        <div class="col-md-6">
          <img src="/img/alejandro-escamilla-Dl6jeyfihLk-unsplash.jpg" alt="" class="img-fluid my-3">
        </div>
        <div class="col-md-6 my-3">
          <h2>Get Connected</h2>
           <p class="main-description">
            LineUp promotes open channel communication between management and employees:
          </p>
          <div class="d-flex">
            <div class="p-3 align-self-start">
              <i class="fa fa-check-square-o emphasis" aria-hidden="true"></i>
            </div>
            <div class="p-3 align-self-end">
              <p class="main-description">Painless Time Off Requests</p>
            </div>
          </div>

          <div class="d-flex">
            <div class="p-3 align-self-start">
              <i class="fa fa-check-square-o emphasis" aria-hidden="true"></i>
            </div>
            <div class="p-3 align-self-end">
            <p class="main-description">Real Time Updates </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

 

  <!-- PRICING HEAD -->
  <section id="pricing" class="blue">
    <div class="container text-center">
          <h1 class="display-4 my-4">Pricing Options</h1>
      <div class="row">
        <div class="plans-column col-lg-6 mb-4">
          <div class="card">
            <div class="card-header">
              <h3>Free Trial</h3>
            </div>
            <div class="card-body">
              <h3>Free</h3>
              <p class="main-description">Schedule Management</p>
              <p class="main-description">Employee Management</p>
             <p class="main-description">Technical Support</p>
              <a href="/" class="btn btn-primary btn-block btn-lg">Sign Up</a>
            </div>
          </div>
        </div>

        <div class="plans-column col-lg-6 mb-4">
          <div class="card">
            <div class="card-header">
              <h3>Premium Tier</h3>
            </div>
            <div class="card-body">
              <h3>$999/month</h3>
             <p class="main-description">Enhanced Schedule Management</p>
              <p class="main-description">Employee Management</p>
              <p class="main-description">Technical Support</p>
              
              <a href="/" class="btn btn-primary btn-block btn-lg">Sign Up</a>
            </div>
          </div>
        </div>
      </div>
        </div>
  </section>

  <section id="sharebody" class="py-5">
    <div class="container">
      <div class="row justify-content-around">
        <div class="col-md-6 order-2">
          <img src="/img/kaleidico-kt6fQoFlY4E-unsplash.jpg" alt="Photo by Kaleidico on Unsplash" class="img-fluid my-3">
        </div>
        <div class="col-md-6 order-1 my-3">
          <h2>Contact Us</h2>
          <p class="main-description">
       Questions? We always have answers for you. Whether you want a personal demo or have questions about how our prouduct can help your organization, our team is ready to talk to you.
          </p>
         
         <div class="contactus text-center row">
         <div class="col-6">
         <h4><span><i class="fa fa-phone emphasis" aria-hidden="true"></i></span></h4> 
         <p class="main-description">888-888-8888</p>
         </div>
          <div class="col-6">
           <h4><span><i class="fa fa-envelope emphasis" aria-hidden="true"></i></span></h4> 
         <p class="main-description">support@lineup.com</p>
         </div>
         </div>
      </div>
       </div>
        </div>
  </section>


 <div id="footer">
        <div class="row social justify-content-center">
         <a href="https://www.facebook.com" class="fa fa-facebook" target="_blank"></a>
          <a href="https://www.twitter.com" class="fa fa-twitter" target="_blank"></a>
          <a href="https://www.youtube.com" class="fa fa-youtube" target="_blank"></a>
          <a href="https://www.skype.com" class="fa fa-skype"target="_blank"></a>
        </div>
    <div class="text-center text-white">© Copyright 2019 LineUp </div>
  </div>
  
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());
    // Init Scrollspy
    $('body').scrollspy({
      target: '#main-nav'
    });
   /*  // Smooth Scrolling
    $('#main-nav a').on('click', function(event) {
      if (this.hash !== "") {
        event.preventDefault();
        const hash = this.hash;
        $('html, body').animate({
          scrollTop: $(hash).offset().top
        }, 800, function() {
          window.location.hash = hash;
        });
      }
    }); */
  </script>
</body>
</html>
