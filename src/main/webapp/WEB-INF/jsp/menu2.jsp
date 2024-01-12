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

<style>
	body{
		background: #999;
		margin: 0;
	}

	.navbar {
		width: 100%;
		background: #6699cc;
		box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
	}
	
	ul{
		text-align: left;
		display: inline;
		margin: 0;
		padding: 0;
		list-style: none;
	}
	
	ul li {
		font: bold; 12px/18px sans-serif;
		display: inline-block;
		position: relative;
		padding: 25px 20px;
		background: #6699cc;
	}
	
	ul li a{
		text-decoration: none;
		padding: 25px 20px;
		color: white;
		font-size: 18px;
	}
	
	ul li:hover {
		background: #4dd0e1;
		color: white;
	}
	
	ul li ul{
		padding: 0;
		position: absolute;
		top: 70px;
		left:0; 
		width: 250px;
		display: none;
		visibility: hidden;
		box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
	}
	
	ul li ul li{
		background: #00acc1;
		display: block;
	}
	
	ul li ul li:hover{
		background: #4dd0e1;
	}
	
	ul li:hover ul{
		display: block;
		opacity: 1;
		visibility: visible;
	}
	
	ul ul ul li{
		display: none;
	}
	
	ul ul li:hover li {
		display: block;
	}
	
	ul ul ul {
		left: 100%;
		top:0;
	}
	
</style>



<script type="text/javascript">


</script>

</head>
<body>


<p>Web Master</p>
<div class="navbar">
<ul>
    <li><a href="#"><i class="fas fa-qrcode"></i>Home</a></li>
    <li><a href="#"><i class="fas fa-link"></i>About</a></li>
    <li><a href="#"><i class="fas fa-eye"></i>Services &nbsp&#8681 </a>
    	<ul>
    		<li> <a href="#"> web design </a> </li>
    		<li> <a href="#"> web development </a> </li>
    		<li> <a href="#"> web hosting </a> </li>
    		<li> <a href="#"> Graphic Design &nbsp&#8680</a> 
    			<ul>
    				<li> <a href="#"> Photoshop </a> </li>
		    		<li> <a href="#"> PageMaker </a> </li>
		    		<li> <a href="#"> Adobe indesign </a> </li>
		    		<li> <a href="#"> Illustrator </a> 
    			</ul>
    		</li>
 		</ul>
   </li>
   <li> <a href="#"> blog </a> </li>
   <li> <a href="#"> contact </a> </li>
   
</ul>     
</div> 

      <div class="social-links">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-youtube"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-linkedin"></i></a>
      </div>
    


</body>
</html>

    