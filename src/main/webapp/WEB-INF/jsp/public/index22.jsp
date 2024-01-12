<%@page import="com.example.teste3.controllers.HomeController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<% System.out.println("ola"); %>

<%
	short evento = com.example.teste3.controllers.HomeController.ImagensEventos.NATAL;
	com.example.teste3.controllers.HomeController home = new com.example.teste3.controllers.HomeController();
%>

    
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link rel="apple-touch-icon" sizes="180x180" href="/img/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="/img/favicon/site.webmanifest">
    <link rel="mask-icon" href="/img/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <link rel="shortcut icon" href="/img/favicon/favicon.ico">
	<meta name="msapplication-TiteColor" content="#da53c">
    <meta name="msapplication-config" content="/img/favicon/browserconfig.xml">
    <meta name="theme-color" color="#ffffff">
    
    
    <title>Entrada - Pronto-a-Vestir Heroina</title>

	<link rel="preload" href="https://assets.prenatal-pt.prenatal-services.com/fonts/Effra Bold.ttf" as="font" type="font/ttf" crossorigin>
        <link rel="preload" href="https://assets.prenatal-pt.prenatal-services.com/fonts/Effra Heavy.ttf" as="font" type="font/ttf" crossorigin>
        <link rel="preload" href="https://assets.prenatal-pt.prenatal-services.com/fonts/Effra Medium.ttf" as="font" type="font/ttf" crossorigin>
        <link rel="preload" href="https://assets.prenatal-pt.prenatal-services.com/fonts/Effra.ttf" as="font" type="font/ttf" crossorigin>
        
    <!-- Custom fonts for this template-->
<!--     <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

	<link rel="stylesheet" href="/css/style.css"/>
	<link rel="stylesheet" href="/css/lounge.css"/>
	<link rel="stylesheet" href="/css/lounge2.css"/>
<!-- 	<link rel="stylesheet" href="/css/lounge-main.css"/> -->

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      
<!--       <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->

<!-- <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->

<style>

    .hero-image-logo-menu {
        background-image: url("/img/loja-logo.jpg");
        position: relative;
        top: 10px;
        left: 10px;
        /*background-position: center; */
        background-repeat: no-repeat;
        background-size: cover;
        height: 50px;
        width: 50px;
        border-radius: 10px;
    }
        
	.pagination > .disabled > a, .pagination > .disabled > a:focus, .pagination > .disabled > a:hover, .pagination > .disabled > span, .pagination > .disabled > span:focus, .pagination > .disabled > span:hover {
		color: #777;
		cursor: not-allowed;
		background-color: #fff;
		border-color: #ddd;
	}
  
	.pagination > li > a, .pagination > li > span {
	  position: relative;
	  float: left;
	  padding: 6px 12px;
	  margin-left: -1px;
	  line-height: 1.42857143;
	  color: #337ab7;
	  text-decoration: none;
	  background-color: #fff;
	  border: 1px solid #ddd;
	    border-top-color: rgb(221, 221, 221);
	    border-right-color: rgb(221, 221, 221);
	    border-bottom-color: rgb(221, 221, 221);
	    border-left-color: rgb(221, 221, 221);
	}
  
</style>



<style type="text/css">


html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline
}

body { line-height: 1 }

ol, ul { list-style: none }

blockquote, q { quotes: none }

blockquote:before, blockquote:after, q:before, q:after {
  content: '';
  content: none
}

table {
  border-collapse: collapse;
  border-spacing: 0
}



a { text-decoration: none; }

/**
 * Hidden fallback
 */


/**
 * Styling navigation
 */

header {
  margin-right: auto;
  margin-left: auto;
  max-width: 22.5rem;
  margin-top:150px;
  box-shadow: 0 3px 12px rgba(0, 0, 0, 0.25);
}

/**
 * Styling top level items
 */

.nav a, .nav label {
  display: block;
 padding: .85rem;
  color: #fff;
  background-color: #151515;
  box-shadow: inset 0 -1px #1d1d1d;
  -webkit-transition: all .25s ease-in;
  transition: all .25s ease-in;
}

.nav a:focus, .nav a:hover, .nav label:focus, .nav label:hover {
  color: rgba(255, 255, 255, 0.5);
  background: #030303;
}

.nav label { cursor: pointer; }

/**
 * Styling first level lists items
 */

.group-list a, .group-list label {
  padding-left: 2rem;
  background: #252525;
  box-shadow: inset 0 -1px #373737;
}

.group-list a:focus, .group-list a:hover, .group-list label:focus, .group-list label:hover { background: #131313; }

/**
 * Styling second level list items
 */

.sub-group-list a, .sub-group-list label {
  padding-left: 2rem;
  background: #353535;
  box-shadow: inset 0 -1px #474747;
}

.sub-group-list a:focus, .sub-group-list a:hover, .sub-group-list label:focus, .sub-group-list label:hover { background: #232323; }

/**
 * Styling third level list items
 */

.sub-sub-group-list a, .sub-sub-group-list label {
  padding-left: 6rem;
  background: #454545;
  box-shadow: inset 0 -1px #575757;
}

.sub-sub-group-list a:focus, .sub-sub-group-list a:hover, .sub-sub-group-list label:focus, .sub-sub-group-list label:hover { background: #333333; }

/**
 * Hide nested lists
 */

.group-list, .sub-group-list, .sub-sub-group-list {
  height: 100%;
  max-height: 0;
  overflow: hidden;
  -webkit-transition: max-height .5s ease-in-out;
  transition: max-height .5s ease-in-out;
}

.nav__list input[type=checkbox]:checked + label + ul { /* reset the height when checkbox is checked */
max-height: 1000px; }

/**
 * Rotating chevron icon
 */

label > span {
  float: right;
  -webkit-transition: -webkit-transform .65s ease;
  transition: transform .65s ease;
}

.nav__list input[type=checkbox]:checked + label > span {
  -webkit-transform: rotate(90deg);
  -ms-transform: rotate(90deg);
  transform: rotate(90deg);
}
</style>

<style type="text/css">

#accordian {
		background: #004050;
		/*width: 250px;
		*/
		/*margin: 50px auto 0 auto; */
		color: white;
		box-shadow: 0 5px 15px 1px rgba(0, 0, 0, 0.6), 0 0 200px 1px rgba(255, 255, 255, 0.5);
}

#accordian h3 {
		background: #003040;
		background: linear-gradient(#003040, #002535);
}

#accordian h3 a {
		padding: 0 10px;
		font-size: 12px;
		line-height: 34px;
		display: block;
		color: white;
		text-decoration: none;
}

#accordian h3:hover {
		text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
}

i {
		margin-right: 10px;
}

#accordian li {
		list-style-type: none;
}

#accordian ul ul li a,
#accordian h4 {
		color: white;
		text-decoration: none;
		font-size: 11px;
		line-height: 27px;
		display: block;
		padding: 0 15px;
		transition: all 0.15s;
		position: relative;
}

#accordian ul ul li a:hover {
		background: #003545;
		border-left: 5px solid lightgreen;
}

#accordian ul ul {
		display: none;
}

#accordian li.active>ul {
		display: block;
}

#accordian ul ul ul {
		margin-left: 15px;
		border-left: 1px dotted rgba(0, 0, 0, 0.5);
}

#accordian a:not(:only-child):after {
		content: "\f104";
		font-family: fontawesome;
		position: absolute;
		right: 10px;
		top: 0;
		font-size: 14px;
}

#accordian .active>a:not(:only-child):after {
		content: "\f107";
}

</style>


<style type="text/css">

	.ttt {
	  display: block;
	  position: absolute;
	  bottom: 16px;
	  right: 26px;
	}
  
  
	.modal-resizable .modal-dialog {
        overflow: hidden;
        width: auto !important;
        max-width: 90%;
    }

    .modal-resizable .modal-content {
        width: 100%;
        height: 100%;
        overflow: auto;
    }
      
      
      
        footer {
  padding:50px 0 65px
}
footer .list-inline {
  margin:0;
  padding:0
}
footer .copyright {
  font-size:14px;
  margin-bottom:0;
  text-align:center
}
</style>

<!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>
    
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="/js/main.6700dedd9b90aef0.js"></script>


<script type="text/javascript">
	function goPage(page, subTipo) {
		//$("#spinner").style.display = "block";
		var x = document.getElementById("spinner");
		if (x.style.display === "none") {
		  x.style.display = "block";
		  //alert('block')
		} else {
		  x.style.display = "none";
		}
		
		location.href="/s/"+page+"/"+subTipo;
	}
	
	function goPage2(page) {
		//$("#spinner").style.display = "block";
		var x = document.getElementById("spinner");
		if (x.style.display === "none") {
		  x.style.display = "block";
		} else {
		  x.style.display = "none";
		}
		
		location.href=page;
	}

	
	function novoContacto(){
		
		//$("#exampleModalCenterTitle").html("Novo Contacto");
		$('.modal-body-contact').html("");
		
		$.ajax({
		      url: '/contacts/newcontact',
		      type: 'GET',
		      success: function(response) {
		        $('.modal-body-contact').html(response);
		        //alert($("#nome"))
		        //console.log($("#nome"))
		        //$("#nome").focus();
		        //$('#myModal').modal('show');
		        $(this).find('input:text:visible:first').focus();
		        
		        setTimeout(function() {
		        	$("#nome").focus();
		        }, 1000);
		      }
		    });

		//$('#contactModal').modal('show');
		
		
	    $('#contactModal').modal({
	        backdrop: 'static',   // This prevents clicking outside the modal to close it
	            //keyboard: false      // This prevents pressing the Escape key to close it
	        	focus: true
          });
	}
	
	$(document).ready(function() {
		$('#closeModalContact').click(function() {
		    $('#contactModal').modal('hide');
		  });
		
		$("#accordian a").click(function() {
				var link = $(this);
				var closest_ul = link.closest("ul");
				var parallel_active_links = closest_ul.find(".active")
				var closest_li = link.closest("li");
				var link_status = closest_li.hasClass("active");
				var count = 0;

				closest_ul.find("ul").slideUp(function() {
						if (++count == closest_ul.find("ul").length)
								parallel_active_links.removeClass("active");
				});

				if (!link_status) {
						closest_li.children("ul").slideDown();
						closest_li.addClass("active");
				}
		})
		
		
	  $('#myBtnFechar').click(function() {
		    $('#myModal').modal('hide');
		  });
})

	

	function showPopup(id){
		
		$("#exampleModalCenterTitle").html("Imagem");
		$('.modal-body').html("");
		
		$.ajax({
		      url: '/products/show/'+id,
		      type: 'GET',
		      success: function(response) {
		        $('.modal-body').html(response);
		        
		        //$('#myModal').modal('show');
		      }
		    });

	    $('#myModal').modal('show');
	}
	
</script>

</head>

<body id="page-top">



    <!-- Page Wrapper -->
    <div id="wrapper">

	<div id="spinner" class="loading" style="display: none;width: 150px;text-align: center;vertical-align: bottom;">
		A Carregar...
	</div>
	
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center " href="#" onclick="goPage(0)">
				<div>
                    <!-- i class="fas fa-laugh-wink"></i -->
                     <div>
            				<img class="hero-image-logo-menu">
       				 </div>
                </div>
                <div class="sidebar-brand-text mx-3">Pronto-a-Vestir </div>
                
            </a>
			
			<br><br>
			<li>
				
			</li>
			
			
            <!-- Divider -->
            <hr class="sidebar-divider my-0">


            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="#" onclick="goPage(0,0)">
<!--                     <i class="fas fa-fw fa-tachometer-alt"></i> -->
                    <i class="fa-sharp fa-regular fa-sun fa-beat"> </i>
                    <span>
                    	Novidades
                    </span>
                </a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider">


<!-- Heading -->
            <!-- div class="sidebar-heading">
                Interface
            </div -->

 


<!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages1"
                    aria-expanded="true" aria-controls="collapsePages2">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Menu 1</span>
                </a>
                <div id="collapsePages1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    

					<div id="accordian">
							<ul>



	<c:set var="idpai" value="0"/>
	<c:set var="descricao" value=""/>
	<c:set var="fecharTriploNivel" value="false"/>
	
	<c:forEach var="m" items="${menu}" varStatus="i">
	
		<!-- Para colocar titulo na pagina abaixo deste foreach -->
		<c:if test="${m.id == subtipo}">
			<c:set var="descricao" value="${m.descricao}"/>
		</c:if>
	<%
// m.idPai: ${m.idPai} cc:${m.idPai != idpai} | idpai:${idpai} | i:${i.count} fecharTriploNivel:${fecharTriploNivel}
%>

		<c:if test="${m.idPai != idpai and i.count > 1}">
			
		
			</ul></li>
			
			<c:if test="${m.id==5}">
				</ul></li>
			</c:if>
		</c:if>
			<c:if test="${fecharTriploNivel && m.idPai == null && m.id!=5 && m.id!=6}">
				<c:set var="fecharTriploNivel" value="false"/>
				
				</ul>
				</li>
			</c:if>

	
		<c:choose>
		<c:when test="${((m.idPai == null || m.idPai != idpai) && !m.link) || m.idPai == idpai && !m.link}">
			<!-- c:out value="${subtipo}"/ -->
			<li> <h3> <a href="#"> ${m.descricao} <sub>(${m.numProducts})</sub> 
				
				<%-- c:choose>
					<c:when test="${m.idPai == null}">
						&nbsp&#8681
					</c:when>
					<c:otherwise>
						&nbsp&#8680
					</c:otherwise>
				</c:choose --%>
				  
				</a> </h3>
				 <ul>


			<c:if test="${m.idPai == idpai && !m.link}">
				<c:set var="fecharTriploNivel" value="true"/>
			</c:if>
			

			<c:set var="idpai" value="${m.id}"/>
			
			<c:set var="ulAberto" value="true"/>
			
			
		</c:when>
		<c:otherwise>
	    		<li <c:if test="${m.id == subtipo}"> class="active"</c:if>> <a href="#" onclick="goPage(0, ${m.id})"> ${m.descricao} 
	    		
	    			<c:if test="${m.link && m.numProducts >0}">
	    				<sub>(${m.numProducts})</sub>
	    			</c:if>
	    			</a>
	    			
	    		 </li>
			<c:set var="idpai" value="${m.idPai}"/>
		</c:otherwise>
		</c:choose>
	
	</c:forEach>

</ul></li>




									
							</ul>
					</div>

	</div>
                </div>
            </li>


            
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2"
                    aria-expanded="true" aria-controls="collapsePages2">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Menu 2</span>
                </a>
                <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    
                    

					
    <c:set var="idpai" value="0"/>
	<c:set var="descricao" value=""/>
	<c:set var="fecharTriploNivel" value="false"/>
	
	<c:forEach var="m" items="${menu}" varStatus="i">
	
		<!-- Para colocar titulo na pagina abaixo deste foreach -->
		<c:if test="${m.id == subtipo}">
			<c:set var="descricao" value="${m.descricao}"/>
		</c:if>
	<%
// m.idPai: ${m.idPai} cc:${m.idPai != idpai} | idpai:${idpai} | i:${i.count} fecharTriploNivel:${fecharTriploNivel}
%>

		<c:if test="${m.idPai != idpai and i.count > 1}">
			
		
			
			
		</c:if>
			<c:if test="${fecharTriploNivel && m.idPai == null && m.id!=5 && m.id!=6}">
				<c:set var="fecharTriploNivel" value="false"/>
				
				
			</c:if>

	
		<c:choose>
		<c:when test="${((m.idPai == null || m.idPai != idpai) && !m.link) || m.idPai == idpai && !m.link}">
			
			<h6 class="collapse-header">
			
			 ${m.descricao} <sub>(${m.numProducts})</sub> 
				<c:choose>
					<c:when test="${m.idPai == null}">
						&nbsp&#8681
					</c:when>
					<c:otherwise>
						&nbsp&#8680
					</c:otherwise>
				</c:choose>
				  </h6>
				  

			<c:if test="${m.idPai == idpai && !m.link}">
				<c:set var="fecharTriploNivel" value="true"/>
			</c:if>
			

			<c:set var="idpai" value="${m.id}"/>
			
			<c:set var="ulAberto" value="true"/>
			
			
		</c:when>
		<c:otherwise>
				<a class="collapse-item" href="#" onclick="goPage(0, ${m.id})"> ${m.descricao}
				
	    			<c:if test="${m.link && m.numProducts >0}">
	    				<sub>(${m.numProducts})</sub>
	    			</c:if>
	    		</a>
	    		 
			<c:set var="idpai" value="${m.idPai}"/>
		</c:otherwise>
		</c:choose>
	
	</c:forEach>
                    
                    
                    
                   	</div>
                </div>
            </li>
            
            
            
<!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Páginas</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login:</h6>
                        <a class="collapse-item" href="/login">Entrar</a>
                        <a class="collapse-item" href="/register.html">Registar</a>
                        <a class="collapse-item" href="/recuperarsenha.html">Recuperar Senha</a>
                        <h6 class="collapse-header">Menu do Site:</h6>
                        <a class="collapse-item" href="/roupa/1/0">Menu Horizontal 1</a>
                        <a class="collapse-item" href="/roupaAdmin/1/0">Menu Horizontal 2</a>
                        <a class="collapse-item" href="/roupaAdminMenu/1/0">Menu Horizontal 3</a>
                    </div>
                </div>
            </li>
            

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

	<!-- div contactos -->
            <div class="text-center  d-md-inline" style="color: white;padding-top: 100px;padding-bottom: 20px">
            	<span style="font-weight: bold;">CONTACTOS </span> <br> <span style="font-size: 10pt">960271478 <br> 252601430</span> <br><br>
            	<span style="font-weight: bold;">HORÁRIO </span> <br> 8:00 - 12:30 <br> 14:00 - 20:00 
            </div>
			<div style="display: inline-block;text-align: center">

	            <a href="https://www.facebook.com/profile.php?id=100092634155633" target="_blank">
	              <span class="fa-stack fa-lg">
	                <svg class="svg-inline--fa fa-circle fa-w-16 fa-stack-2x" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
	                	<path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path>
	                </svg><!-- <i class="fas fa-circle fa-stack-2x"></i> Font Awesome fontawesome.com -->
	                <svg class="svg-inline--fa fa-facebook-f fa-w-10 fa-stack-1x fa-inverse" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="facebook-f" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg="">
	                	<path fill="currentColor" d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z">
	                	</path>
	                </svg>
	                <!-- <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i> Font Awesome fontawesome.com -->
	              </span>
	            </a>
          
			</div>
			
			<div>
			
				<a _ngcontent-serverapp-c52="" href="https://facebook.com/StartBootstrap" target="_blank" rel="noopener" title="Facebook" class="icon-list-social-link"><fa-icon _ngcontent-serverapp-c52="" class="ng-fa-icon"><svg role="img" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="facebook" class="svg-inline--fa fa-facebook" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256C504 119 393 8 256 8S8 119 8 256c0 123.78 90.69 226.38 209.25 245V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.28c-30.8 0-40.41 19.12-40.41 38.73V256h68.78l-11 71.69h-57.78V501C413.31 482.38 504 379.78 504 256z"></path></svg></fa-icon></a>
			</div>
	
		<div>
			<div class="connect"><h6 class="connect__heading">Log in with</h6><ul data-role="login-menu" class="services login-buttons"><li class="auth-disqus"><button type="button" data-action="auth:disqus" title="Disqus" class="connect__button" aria-label="Login with Disqus"><i class="icon-disqus"></i></button></li><li class="auth-facebook"><button type="button" data-action="auth:facebook" title="Facebook" class="connect__button" aria-label="Login with Facebook"><i class="icon-facebook-circle"></i></button></li><li class="auth-twitter"><button type="button" data-action="auth:twitter" title="Twitter" class="connect__button" aria-label="Login with Twitter"><i class="icon-twitter-circle"></i></button></li><li class="auth-google"><button type="button" data-action="auth:google" title="Google" class="connect__button" aria-label="Login with Google"><i class="icon-google-plus-circle"></i></button></li></ul></div>
		
		</div>
	
		
		
		
<%
	short _MENU = com.example.teste3.controllers.HomeController.ImagensEventos.MENU;
	com.example.teste3.controllers.HomeController.ImagensEventos imgMENU = new com.example.teste3.controllers.HomeController.ImagensEventos(_MENU, evento);
	String pathImageMENU = imgMENU.getImagem();
%>
			<img src="<%=pathImageMENU%>"/>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Procurar por..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Procurar por..." aria-label="Procura"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                       
                       
                       
                      
                        

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link" href="/login" id="userDropdown" role="button"
                                >
                                <span class="mr-2 d-none d-lg-inline text-gray-600">Entrar &nbsp;</span>
                                <img class="img-profile rounded-circle"
                                    src="/img/undraw_profile.svg">
                            </a>
                            
                            
                            <!-- Dropdown - User Information -->
                            <!-- div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Perfil
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Configurações
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Sair
                                </a>
                            </div -->
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">



<%
	short _TOP = com.example.teste3.controllers.HomeController.ImagensEventos.TOP;
	com.example.teste3.controllers.HomeController.ImagensEventos imgTOP = new com.example.teste3.controllers.HomeController.ImagensEventos(_TOP, evento);
	String pathImageTOP = imgTOP.getImagem();
%>

    <div class="hero-image">
 		<div class="hero-image-logo">
            <img src="<%=pathImageTOP%>" width="150%"/>
        </div>
         <div class="hero-image-text">
            Pronto-a-Vestir Heroína
        </div>
        <div class="hero-text">
            <h2>
                <a href="#" onclick="goPage(0, 0)"> Novidades </a> <br>
                <a href="#" onclick="goPage(1, 0)"> Homem </a> <br>
                <a href="#" onclick="goPage(2, 0)"> Senhora </a> <br>
                <a href="#" onclick="goPage(3, 0)"> Criança </a> <br>
                <a href="#" onclick="goPage(4, 0)"> Bebé </a> <br>
                <a href="#" onclick="goPage(5, 0)"> Têxteis lar </a> <br>
                <a href="#" onclick="novoContacto()"> Contactar </a>
            </h2>

        </div>
        
        <div class="hero-image-contacts">
            Contactos: 960271478 - 252601430
        </div>
    </div>

	<br/>
                    <!-- Page Heading -->
                    <!-- div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div -->


<div style="text-align: center; ">
        <h1 class="titulo-pagina"> 

        	<c:choose>
				<c:when test="${tipo == null or (tipo == 0 and subtipo == 0)}">
					Novidades
				</c:when>
				<c:when test="${tipo == 1}">
					Homem
				</c:when>
				<c:when test="${tipo == 2}">
					Senhora
				</c:when>
				<c:when test="${tipo == 3}">
					Criança
				</c:when>
				<c:when test="${tipo == 4}">
					Bebé
				</c:when>
				<c:when test="${tipo == 5}">
					Têxteis lar
				</c:when>
				<c:otherwise>
					<c:out value="${descricao}"/>
				</c:otherwise>
			</c:choose>
        	 
        </h1>
        
        <br> <br>
	</div>


<div>
				<footer>
				  <div class="container">
				    <div class="row">
				      <div class="col-lg-8 col-md-10 mx-auto">
				        <ul class="list-inline text-center">
				          
				          <li class="list-inline-item">
				            <a href="mailto:your-email@example.com">
				              <span class="fa-stack fa-lg">
				                <svg class="svg-inline--fa fa-circle fa-w-16 fa-stack-2x" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path></svg><!-- <i class="fas fa-circle fa-stack-2x"></i> Font Awesome fontawesome.com -->
				                <svg class="svg-inline--fa fa-envelope fa-w-16 fa-stack-1x fa-inverse" aria-hidden="true" focusable="false" data-prefix="far" data-icon="envelope" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path></svg><!-- <i class="far fa-envelope fa-stack-1x fa-inverse"></i> Font Awesome fontawesome.com -->
				              </span>
				            </a>
				          </li>
				          
				          
				          <li class="list-inline-item">
				            <a href="https://twitter.com/SBootstrap">
				              <span class="fa-stack fa-lg">
				                <svg class="svg-inline--fa fa-circle fa-w-16 fa-stack-2x" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path></svg><!-- <i class="fas fa-circle fa-stack-2x"></i> Font Awesome fontawesome.com -->
				                <svg class="svg-inline--fa fa-twitter fa-w-16 fa-stack-1x fa-inverse" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="twitter" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path></svg><!-- <i class="fab fa-twitter fa-stack-1x fa-inverse"></i> Font Awesome fontawesome.com -->
				              </span>
				            </a>
				          </li>
				          
				          
				          <li class="list-inline-item">
				            <a href="https://www.facebook.com/StartBootstrap">
				              <span class="fa-stack fa-lg">
				                <svg class="svg-inline--fa fa-circle fa-w-16 fa-stack-2x" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path></svg><!-- <i class="fas fa-circle fa-stack-2x"></i> Font Awesome fontawesome.com -->
				                <svg class="svg-inline--fa fa-facebook-f fa-w-10 fa-stack-1x fa-inverse" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="facebook-f" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg=""><path fill="currentColor" d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"></path></svg><!-- <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i> Font Awesome fontawesome.com -->
				              </span>
				            </a>
				          </li>
				          
				          
				          
				          <li class="list-inline-item">
				            <a href="https://github.com/StartBootstrap">
				              <span class="fa-stack fa-lg">
				                <svg class="svg-inline--fa fa-circle fa-w-16 fa-stack-2x" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path></svg><!-- <i class="fas fa-circle fa-stack-2x"></i> Font Awesome fontawesome.com -->
				                <svg class="svg-inline--fa fa-github fa-w-16 fa-stack-1x fa-inverse" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="github" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" data-fa-i2svg=""><path fill="currentColor" d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"></path></svg><!-- <i class="fab fa-github fa-stack-1x fa-inverse"></i> Font Awesome fontawesome.com -->
				              </span>
				            </a>
				          </li>
				          
				          
				        </ul>
				        
				      </div>
				    </div>
				  </div>
				</footer>
			
			</div>
 
 

 <!-- Content Row -->
 	<div id="mainpage">
 
 
 			
 
 
 
 
       <div class="row">
                    
                    
         <c:forEach var="prod" items="${listaprodutos}">
        

               <!-- Earnings (Monthly) Card Example -->
               <div class="col-xl-3 col-md-6 mb-4">
                   <div class="card border-left-primary shadow h-100 py-2" id="${prod.id}">
                       <div class="card-body">
                           <div class="row no-gutters align-items-center">
                               <div class="col mr-2">
                                   <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                   
                                   <c:choose>
                                   	<c:when test="${prod.thumbnailImage != null}">
                                   		<img src="${prod.thumbnailImage}" style="border-radius:10px" width="80%">	
                                   	</c:when>
                                   	<c:otherwise>
                                   		<img src="${prod.dadosImagem}" style="border-radius:10px" width="80%">
                                   	</c:otherwise>
                                   </c:choose>
                                   
                                   
					                <table width="100%" border="0">
					            		<tr>
					            			<td style="text-align: left;padding-top: 10px">
					            			<span style="font-weight: bold;">REFERENCIA:</span> &nbsp; <c:out value="${prod.referencia}"/>	
					            			</td>
					            		</tr>
					
					            		<tr>
					            			<td>
									             			
					            			</td>
					            		</tr>
					            	</table>
				       	
				       	
                                   </div>
                                   <div class="h5 mb-0 font-weight-bold text-gray-800" style="text-align: left; text-align: justify;text-justify: inter-word;"><c:out value="${prod.descricao}"/>   </div>
                               </div>
                             </div>
                       </div>
                             
	                   <div class="card-footer " style="text-align: right">
	                   		<div class="row">
	                   			<div class="col-6" style="text-align: left">
	                   			
		                   			<dl style="font-style: italic;color: #6699cc;font-size: 14px">
			       						<dt>Publicado</dt>
			       						<dd>${prod.dataCriacao.format( DateTimeFormatter.ofPattern("dd.MM.yyyy"))}</dd>
			       					</dl>
	                   			</div>
	                   			
	                   			<div class="col-6">
		                   			<a href="#${prod.id}" onclick="showPopup(<c:out value="${prod.id}"/>)">
					         			<img data-toggle="modal" data-target="#myModal" alt="Foto" src="/img/pesq4.png" width="50">
					         		</a>
	                   			</div>
	                   		</div>

		    			</div>
                               
                    </div>
                </div>	

   
		</c:forEach>
						
			 </div>		

      </div>
      <!-- End of Main Page -->    

                    

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Website 2023</span>
                    </div>
                     
                </div>
                
<%
	short _BOTTOM = com.example.teste3.controllers.HomeController.ImagensEventos.BOTTOM;
	com.example.teste3.controllers.HomeController.ImagensEventos imgBOTTOM = new com.example.teste3.controllers.HomeController.ImagensEventos(_BOTTOM, evento);
	String pathImageBOTTOM = imgBOTTOM.getImagem();
	
	if (pathImageBOTTOM.length()>0) {
%>
			<img src="<%=pathImageBOTTOM%>" width="100%"/>
                
 <% } %>               
                
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pronto para sair?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">Clique no botão Sair abaixo se pretende terminar a sessão.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-primary" href="/login.html">Sair</a>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Modal -->
<div class="modal fade modal-resizable" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Anúncio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" id="myBtnFechar" class="btn btn-primary" data-dismiss="modal">Fechar</button>
        <!-- button type="button" class="btn btn-primary">Save changes</button -->
      </div>
    </div>
  </div>
</div>

    
    <!-- Contacto Modal-->
    <div class="modal fade modal-resizable" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Novo Contacto</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body-contact"></div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" onclick="create()">Enviar</button>
                    <a class="btn btn-secondary" href="#" onclick="cancelarContacto()" id="closeModalContact">Sair</a>
                </div>
            </div>
        </div>
    </div>
    
    
    <!--
 <ins class="adsbygoogle adsbygoogle-noablate" data-adsbygoogle-status="done" style="display: block; width: 100% !important; height: 95px !important; bottom: 0px; clear: none !important; float: none !important; left: 0px; margin: 0px !important; max-height: none !important; max-width: none !important; opacity: 1; overflow: visible !important; padding: 0px !important; position: fixed; right: auto !important; top: auto !important; vertical-align: baseline !important; visibility: visible !important; z-index: 2147483647; background: rgb(250, 250, 250) !important;" data-anchor-status="displayed" data-ad-status="filled" data-anchor-shown="true">
 	<div class="grippy-host"></div>
 	
 	<ins style="inset: auto !important; clear: none !important; display: block !important; float: none !important; height: 5px !important; margin: 0px !important; max-height: none !important; max-width: none !important; opacity: 1 !important; overflow: visible !important; padding: 0px !important; position: relative !important; vertical-align: baseline !important; visibility: visible !important; width: auto !important; z-index: 1 !important; background-color: rgb(250, 250, 250) !important; box-shadow: rgba(0, 0, 0, 0.2) 0px -1px 5px -1px, rgba(0, 0, 0, 0.1) 0px 1px 2px -1px !important;" class="ee"><span style="display: block !important; width: 80px !important; height: 45px !important; bottom: 0px !important; left: 0% !important; pointer-events: none !important;"><svg style="margin: 0px !important; position: absolute !important; bottom: 0px !important; left: 0% !important; display: block !important; width: 80px !important; height: 30px !important; transform: none !important; pointer-events: initial !important;"><defs><filter id="dropShadowTop" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feComponentTransfer in="SourceAlpha" result="TransferredAlpha"><feFuncR type="discrete" tableValues="0.5"></feFuncR><feFuncG type="discrete" tableValues="0.5"></feFuncG><feFuncB type="discrete" tableValues="0.5"></feFuncB></feComponentTransfer><feGaussianBlur in="TransferredAlpha" stdDeviation="2"></feGaussianBlur><feOffset dx="0" dy="0" result="offsetblur"></feOffset><feMerge><feMergeNode></feMergeNode><feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter></defs><path d="M0,26 L0,6 A6,6 0 0,1 6,1 L50,1 A6,6 0 0,1 56,6 L56,20 A6,6 0 0,0 62,26 Z" stroke="#FAFAFA" stroke-width="1" fill="#FAFAFA" style="filter: url(&quot;#dropShadowTop&quot;);"></path><rect x="0" y="25" width="80" height="5" style="fill: rgb(250, 250, 250);"></rect><g class="down" stroke="#616161" stroke-width="2px" stroke-linecap="square"><line x1="22" y1="12" x2="28" y2="18"></line><line x1="28" y1="18" x2="34" y2="12"></line></g></svg></span></ins>
 	
 	<div id="aswift_1_host" style="border: medium !important; height: 90px !important; width: 100% !important; margin: 0px !important; padding: 0px !important; position: relative !important; visibility: visible !important; background-color: transparent !important; display: inline-block !important; inset: auto !important; clear: none !important; float: none !important; max-height: none !important; max-width: none !important; opacity: 1 !important; overflow: visible !important; vertical-align: baseline !important; z-index: auto !important;" tabindex="0" title="Advertisement" aria-label="Advertisement"><iframe id="aswift_1" name="aswift_1" style="width: 728px !important; height: 90px !important; display: block; margin: 0px auto;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="728" height="90" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/html/r20231207/r20110914/zrt_lookup_fy2021.html?fsb=1#RS-0-&amp;adk=1812271801&amp;client=ca-pub-5287323383309901&amp;fa=1&amp;ifi=2&amp;uci=a!2" data-google-container-id="a!2" data-google-query-id="CNm4opC2tIMDFbMB-wMdI8sL0Q" data-load-complete="true"></iframe>
 	</div>
 </ins>
 
 <iframe src="SB%20Admin%202%20-%20Free%20Bootstrap%20Admin%20Theme%20-%20Start%20Bootstrap_ficheiros/aframe.htm" width="0" height="0" style="display: none;"></iframe>
 <iframe id="google_esf" name="google_esf" src="SB%20Admin%202%20-%20Free%20Bootstrap%20Admin%20Theme%20-%20Start%20Bootstrap_ficheiros/zrt_lookup_fy2021_002.htm" style="display: none;"></iframe>
 -->
 
 
 <style>
 	.bottom-ads{
 	
 		--border-color:#eee;
 		
 		position:fixed;
 		bottom:0px;
 		width:100vw;
 		
 		
 		.bottom-ads-button:after{
 			cursor:pointer;
 			font-family:'FontAwesome';
 			
 			content: '\f078';
 			padding:10px 30px;
 			background:white;
 			border-top-left-radius: 5px;
 			border-top-right-radius: 5px;
 			border-top:1px solid var(--border-color);
 			border-left:1px solid var(--border-color);
 			border-right:1px solid var(--border-color);
 			display: inline-block;
    		margin-bottom: -1px;
    		margin-left:10px;
 		}
 		
 		
 		.bottom-ads-container{
 			transition: ease-in-out height 1s;
 			height:150px;
 			border-top:1px solid var(--border-color);
 			background:white;
 			padding:10px;
 		}
 	}
 	
 	.bottom-ads[data-status="closed"]{
 		
	 	.bottom-ads-button:after{
	 		content:'\f077';
	 	}
	 	
	 	.bottom-ads-container{
	 		height:0;
	 		padding:0px;
	 	}
 	}
 	
 </style>
 
 <script>
 
	 const toggleBottomAds = (_btnEl) => {
		 
		 const parent = _btnEl.parentElement;
		 const status = parent.dataset.status;
		 
		 if(status && status=='closed'){
			 parent.dataset.status='open';
		 }else{
			 parent.dataset.status='closed';
		 }
	 }
 
 </script>
 
 <div class="bottom-ads">
 	<span class="bottom-ads-button" onclick="toggleBottomAds(this)"></span>
 	<div class="bottom-ads-container">
 		---CONTEUDO--
 	</div>
 </div>
    

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>


</body>

</html>