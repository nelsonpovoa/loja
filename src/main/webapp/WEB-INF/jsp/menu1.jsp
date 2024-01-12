<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

	
<!DOCTYPE html>
<html>
<head>
    <title>Neumorphism Sidebar Menu Using HTML and CSS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


<script type="text/javascript">
	
* {
    margin: 0;
    padding: 0;
    list-style: none;
    text-decoration: none;
  }
  body{
    height: 100vh;
    background: #dde1e7;
    font-family: Arial;
    font-weight: 600;
  }
  #check {
    display: none;
  }
  label #btn,
  label #cancle {
    position: absolute;
    cursor: pointer;
    background: #dde1e7;
    box-shadow: -3px -3px 7px #ffffff73,
                2px 2px 5px rgba(128, 135, 148, 0.562);
    color: rgb(4, 145, 216);
    border-radius: 3px;
  }
   
  label #btn {
    left: 40px;
    top: 25px;
    font-size: 35px;
    color: rgb(14, 186, 243);
    padding: 6px 12px;
    transition: all 0.5s;
  }
  #cancle {
    z-index: 1111;
    left: -195px;
    top: 17px;
    font-size: 30px;
    color: #0a5275;
    padding: 4px 9px;
    transition: all 0.5s;
  }
  /* active side bar */
  .sidebar {
    position: absolute;
    left: -250px;
    width: 250px;
     
     
    background: #dde1e7;
    box-shadow: -3px -3px 7px #ffffff73,
                2px 2px 5px rgba(128, 135, 148, 0.562);
    transition: all 0.5s ease;
     
     
  }
  #check:checked ~ .sidebar {
    left: 0;
  }
  #check:checked ~ label #btn {
    left: 250px;
    opacity: 0;
    pointer-events: none;
  }
  #check:checked ~ label #cancle {
    left: 245px;
  }
  #check:checked ~ section {
    margin-left: 250px;
  }
  .sidebar header img {
    border-radius: 50%;
    width: 120px;
    height: 120px;
    margin-top: 10px;
    box-shadow: 
     
  0px 0px 2px #5f5f5f,
  0px 0px 0px 7px #ecf0f3,
  8px 8px 15px #a7aaaf,
  -8px -8px 15px #ffffff
  ;
  }
  .sidebar header {
    font-size: 24px;
    color: rgb(57, 57, 57);
    text-align: center;
    line-height: 30px;
    background: #dde1e7;
     
    user-select: none;
  }
  .sidebar header p {
    padding: 15px;
  }
   
  .sidebar ul a {
    display: block;
    height: 100%;
    width: 100%;
    line-height: 56px;
    font-size: 18px;
    color: rgb(68, 68, 68);
    padding-left: 40px;
    box-sizing: border-box;
    margin-top: 10px;
    box-shadow: -3px -3px 7px #ffffff,
                2px 2px 5px rgba(128, 135, 148, 0.562);
     
    transition: 0.4s;
  }
  .sidebar ul a i {
    margin-right: 16px;
  }
  /* hover effect */
  ul li:hover a {
    padding-left: 70px;
    color: rgb(0, 158, 216);
    box-shadow: inset -1px -1px 2px #dde1e7;
  }
         
  /* Social Links */
  .social-links i {
    padding: 10px;
    margin-left: 16px;
    margin-top: 10px;
    color: rgb(4, 61, 118);
    background: #dde1e7;
    font-size: 20px;
    box-shadow: -3px -3px 7px #ffffff,
                2px 2px 5px rgba(128, 135, 148, 0.562);
  }
  /* icons hover effect */
  .social-links i:hover {
    color: rgb(0, 170, 255);
  }


</script>

</head>
<body>
  <input type="checkbox" id="check">
  <label for="check">
<i class="fa fa-bars" id="btn"></i>
<i class="fa fa-times" id="cancle"></i>
</label>
  <div class="sidebar">
<header><img src="pic.jpg">
<p>Web Master</p>
</header>
<ul>
    <li><a href="#"><i class="fas fa-qrcode"></i>Dashboard</a></li>
    <li><a href="#"><i class="fas fa-link"></i>Shortcuts</a></li>
    <li><a href="#"><i class="fas fa-eye"></i>Overview</a></li>
    <li><a href="#"><i class="fas fa-question-circle"></i>About</a></li>
    <li><a href="#"><i class="fas fa-cog"></i>Services</a></li>
    <li><a href="#"><i class="fas fa-phone"></i>Contact</a></li>
 </ul>
   <li>
      <div class="social-links">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-youtube"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-linkedin"></i></a>
      </div>
    </li>
</div>
<section></section>  
    </div>
</body>
</html>

    