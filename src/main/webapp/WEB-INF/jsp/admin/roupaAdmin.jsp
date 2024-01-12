<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%
	short evento = com.example.teste3.Teste3Application.EVENTO_EPOCA;
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

<!--     <link rel="apple-touch-icon" sizes="180x180" href="/img/favicon/apple-icon-180x180.png"> -->
<!--     <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png"> -->
<!--     <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon/favicon-16x16.png"> -->
<!--     <link rel="manifest" href="/img/favicon/site.webmanifest"> -->
<!--     <link rel="mask-icon" href="/img/favicon/safari-pinned-tab.svg" color="#5bbad5"> -->
    <link rel="shortcut icon" href="/img/favicon/favicon.ico">
	<meta name="msapplication-TiteColor" content="#da53c">
    <meta name="msapplication-config" content="/img/favicon/browserconfig.xml">
    <meta name="theme-color" color="#ffffff">
    
    <title>Entrada - Pronto-a-Vestir Heroina</title>

    <!-- Custom styles for this template -->
<!--     <link href="/css/sb-admin-2.min.css" rel="stylesheet"> -->

<!-- <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" /> -->


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
    crossorigin="anonymous" referrerpolicy="no-referrer" />


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">   
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="/css/style.css"/>

<style type="text/css">

@media (max-width: 768px) {
  .modal-content {
    width: 90%;    /* Adjust the width for smaller screens */
    height: auto;  /* Allow the height to adjust dynamically */
  }
}

@media (max-width: 5000px) {
  .modal-content {
    width: 90%;    /* Adjust the width for smaller screens */
    height: auto;  /* Allow the height to adjust dynamically */
  }
}

	.modal-content {
		width: 90%;    /* Adjust the width for smaller screens */
		height: auto;  /* Allow the height to adjust dynamically */
	}


	.infoDate {
	  display: inline-block;
	  position: relative;
	  bottom: 30px;
	  /*right: 20px; */
	  
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
	
	.sombra{
		box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
	}
	
/*  	body{  */

/*  background-image:linear-gradient(#383839,#121210)!important */
/* } */


</style>


<style type="text/css">

	/* ============ desktop view ============ */
	@media all and (min-width: 992px) {
	
		.dropdown-menu li{
			position: relative;
		}
		.dropdown-menu .submenu{ 
			display: none;
			position: absolute;
			left:100%; top:-7px;
		}
		.dropdown-menu .submenu-left{ 
			right:100%; left:auto;
		}
	
		.dropdown-menu > li:hover{ background-color: #f1f1f1 }
		.dropdown-menu > li:hover > .submenu{
			display: block;
		}
	}	
	/* ============ desktop view .end// ============ */
	
	/* ============ small devices ============ */
	@media (max-width: 991px) {
	
		.dropdown-menu .dropdown-menu{
				margin-left:0.7rem; margin-right:0.7rem; margin-bottom: .5rem;
		}
	
	}	
	/* ============ small devices .end// ============ */

.product-entry-actions{

	padding:2px;
	z-index:9999;
	background:white;
}

    footer {
	  padding:50px 0 0px
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


<script type="text/javascript">
//	window.addEventListener("resize", function() {
//		"use strict"; window.location.reload(); 
//	});


	document.addEventListener("DOMContentLoaded", function(){
        

    	/////// Prevent closing from click inside dropdown
		document.querySelectorAll('.dropdown-menu').forEach(function(element){
			element.addEventListener('click', function (e) {
			  e.stopPropagation();
			});
		})



		// make it as accordion for smaller screens
		if (window.innerWidth < 992) {

			// close all inner dropdowns when parent is closed
			document.querySelectorAll('.navbar .dropdown').forEach(function(everydropdown){
				everydropdown.addEventListener('hidden.bs.dropdown', function () {
					// after dropdown is hidden, then find all submenus
					  this.querySelectorAll('.submenu').forEach(function(everysubmenu){
					  	// hide every submenu as well
					  	everysubmenu.style.display = 'none';
					  });
				})
			});
			
			document.querySelectorAll('.dropdown-menu a').forEach(function(element){
				element.addEventListener('click', function (e) {
		
				  	let nextEl = this.nextElementSibling;
				  	if(nextEl && nextEl.classList.contains('submenu')) {	
				  		// prevent opening link if link needs to open dropdown
				  		e.preventDefault();
				  		console.log(nextEl);
				  		if(nextEl.style.display == 'block'){
				  			nextEl.style.display = 'none';
				  		} else {
				  			nextEl.style.display = 'block';
				  		}

				  	}
				});
			})
		}
		// end if innerWidth

	}); 
	// DOMContentLoaded  end
</script>

<script type="text/javascript">
function scrollToTop() {
	  window.scrollTo({
	    top: 0,
	    behavior: 'smooth' // For smooth scrolling effect
	  });
	}
</script>

<script src="/webjars/jquery/3.6.4/jquery.min.js"></script>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
 

 
 <!-- MDB -->
<!-- <script -->
<!--   type="text/javascript" -->
<!--   src="/mdb/js/mdb.min.js" -->
<!-- ></script> -->


<script type="text/javascript">
	var tipo = ${tipo};
	var subTipo = ${subtipo};

	function goPage(page, subtipo) {
		//$("#spinner").style.display = "block";
		var x = document.getElementById("spinner");
		if (x.style.display === "none") {
		  x.style.display = "block";
		} else {
		  x.style.display = "none";
		}
		
		//$("#mainpageT1").hide();
		//$("#mainpageT0").show();
		
		location.href="/admin/roupaAdmin/"+page+"/"+subtipo;

		//$( "#mainpage" ).load( "/listaprodutos" );
		
		/*$( "#mainpage" ).load( "/listaprodutos", function() {
			  alert( "Load was performed." );
			}); */
	}
	
	var idAnuncio;
	function deleteAd(){
		//var botao = $(this);
		//alert(botao.attr("idAd"))
		//alert(idAnuncio)
		$.ajax({
		   	 url: "/deleteAd/"+idAnuncio
		   	,type: 'DELETE' 
	        ,contentType: 'application/json'
		   	 ,success:function(res){
			alert(res)
		   		 if (res){
		   			$('#myModal2').modal('hide');
		   		 }
  			 }
       
		});
	}
	
	$(document).ready(function() {
		$('#closeModalContact').click(function() {
		    $('#contactModal').modal('hide');
		  });
		
		
		$('#closeMyModalBtn').click(function() {
		    $('#myModal').modal('hide');
		  });
		
	});
	
	

	function go(page){
		$("#mainpageT0").hide();
		$("#mainpageT1").show();
		
		if (page == 1){
			$(".titulo-pagina").html("<strong>Produtos 1</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/products/listaprodutos", function() {
				  //alert( "Load was performed." );
				});

		}else if (page == 2) {
			$(".titulo-pagina").html("<strong>Produtos 2</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/products/listaprodutos2", function() {
				  //alert( "Load was performed." );
				});
		
		}else if (page == 3) {
			$(".titulo-pagina").html("<strong>Produtos 3</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/products/listaprodutos3", function() {
				  //alert( "Load was performed." );
				});
		}else if (page == 4) {
			$(".titulo-pagina").html("<strong>Contactos 1</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/contacts/listacontactos", function() {
				  //alert( "Load was performed." );
				});
		}else if (page == 5) {
			$(".titulo-pagina").html("<strong>Contactos 2</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/contacts/listacontactos2", function() {
				  //alert( "Load was performed." );
				});
		}
	}

	function goUtils(){
		$("#mainpageT0").hide();
		$("#mainpageT1").show();
		
		$(".titulo-pagina").html("<strong>Utilizadores</strong>");

		//$( "#mainpage2" ).load( "/listaprodutos" );
		$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
		
		$( "#mainpage" ).load( "/utils/listautils", function() {
			  //alert( "Load was performed." );
			});
	}

	function getSpinner() {
		var spinnerImages = ["spinner-blue.gif", "spin-green.gif", 
			"spin-multicolor2.gif", "spinner.gif", "spinner2.gif", 
			"spinner3.gif", "circle-9360_128.gif", "dog-9746_256.gif",
			"face-7075_128.gif", "sunflower-6420_128.gif", "earth-9906_128.gif",
			"spinner-8565_128.gif", "solar-system-5702_256.gif",
			"gradient-5812_128.gif", "infinite-7713_128.gif", "loading-4861_128.gif",
			"please-wait-5630_128.gif", "load-7671_128.gif"];
		var max = spinnerImages.length;
		var valor = Math.floor(Math.random() * max)
			
		return spinnerImages[valor];
	}
	
	function aplicaFiltro(obj) {
		//alert(getSpinner())
		var tabActivo = $('.tab-content .active').attr('id');
		//alert(id)
		if (obj.value <4){
			if (tabActivo == 'vista1'){
				$( "#mainpage1" ).html("<p style=\"text-align: center;height:110px;\"> <img src=\"/img/spinners/"+getSpinner()+"\"> <br> Em processamento... </p>");
				
				$( "#mainpage1" ).load( "/s/ordenacao/"+tipo+"/"+subTipo+"/"+obj.value+"/1", function() {
					  //alert( "Load was performed." );
					});
				
			}else {
				$( "#mainpage2" ).html("<p style=\"text-align: center;height:110px;\"> <img src=\"/img/spinners/"+getSpinner()+"\"> </p>");
				
				$( "#mainpage2" ).load( "/s/ordenacao/"+tipo+"/"+subTipo+"/"+obj.value+"/2", function() {
					  //alert( "Load was performed." );
					});
			}
		}else {
			alert('Ainda nao implementado!')
		}
	}
	
	function pesquisa(btn) {
		var tabActivo = $('.tab-content .active').attr('id');
		
		var fieldPesq = $("#selFieldPesq").val();
		var nomePesq = $("#nomePesq")
		if (nomePesq.val().length == 0) {
			alert("Deve indicar o nome a pesquisar!");
			nomePesq.focus();
			return false;
		}
		var ordenacao = $("#selOrdenacao").val();
		
		
		if (tabActivo == 'vista1'){
			$( "#mainpage1" ).html("<p style=\"text-align: center;paddin-top:20px;\"> <img src=\"/img/spinners/"+getSpinner()+"\"> <br> Em processamento... </p>");
			
			$( "#mainpage1" ).load( "/pesqpornome", 
				{ "fieldPesq" : fieldPesq, "field" : nomePesq.val(), 
				"ordenacao" : ordenacao, "vista" : 1, "tipo" : tipo, "subTipo" : subTipo}, function(response, status, xhr) {
					if ( status == "error" ) {
					    var msg = "Erro! Ocorreu o seguinte erro: ";
					    $("#error").html( msg + xhr.status + " " + xhr.statusText );
						$("#error").show();
					 }
			});
		}else {
			$( "#mainpage2" ).html("<p style=\"text-align: center;paddin-top:20px;\"> <img src=\"/img/spinners/"+getSpinner()+"\"> <br> Em processamento... </p>");
			
			$( "#mainpage2" ).load( "/pesqpornome", 
					{ "fieldPesq" : fieldPesq, "field" : nomePesq.val(), 
					"ordenacao" : ordenacao, "vista" : 2, "tipo" : tipo, "subTipo" : subTipo}, function(response, status, xhr) {
						if ( status == "error" ) {
						    var msg = "Erro! Ocorreu o seguinte erro: ";
						    $("#error").html( msg + xhr.status + " " + xhr.statusText );
							$("#error").show();
						 }
				});
			
		}
	}
	
	
	function searchOnAllProducts(inputName) {
		//alert(inputName)
		var obj = $("#"+inputName);
		if (obj.val().length >0) {
			
			var ordenacao = $("#selOrdenacao").val();
			
			$( ".titulo-pagina" ).html("Resultados da pesquisa");
			
			$( "#mainpage" ).html("<p style=\"text-align: center;paddin-top:20px;\"> <img src=\"/img/spinners/"+getSpinner()+"\"> <br> Em processamento... </p>");
			
			
			$( "#mainpage" ).load( "/search-all-site", 
					{ "fieldPesq" : 0, "value" : obj.val(), 
					"ordenacao" : ordenacao, "vista" : 0}, function(response, status, xhr) {
						if ( status == "error" ) {
						    var msg = "Erro! Ocorreu o seguinte erro: ";
						    $("#error").html( msg + xhr.status + " " + xhr.statusText );
							$("#error").show();
						 }
				});
		}else {
			alert("Deve indicar o nome a pesquisar!");
			obj.focus();
		}
	}
	
</script>

</head>
<body id="page-top" class="gfg_home_page_search_card_mode">


<section>


	<div class="slider" onclick="scrollToTop()">
		<span>&#8593;</span> <!-- Upward arrow symbol -->
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
	        <button type="button" id="closeMyModalBtn" class="btn btn-primary" data-dismiss="modal">Fechar</button>
	        <!-- button type="button" class="btn btn-primary">Save changes</button -->
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">Eliminar</h5>
	        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body2" style="padding: 40px">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" onclick="deleteAd()">Sim</button>
	        <button type="button" id="closeModalBtn" class="btn btn-secondary" data-dismiss="modal">Não</button>
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
                    <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body-contact"></div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" onclick="create()">Enviar</button>
                    <a class="btn btn-secondary" href="#"  id="closeModalContact">Sair</a>
                </div>
            </div>
        </div>
    </div>

<%
	short _TOP = com.example.teste3.controllers.HomeController.ImagensEventos.TOP;
	com.example.teste3.controllers.HomeController.ImagensEventos imgTOP = new com.example.teste3.controllers.HomeController.ImagensEventos(_TOP, evento);
	String pathImageTOP = imgTOP.getImagem();
%>



	<div id="spinner" class="loading" style="display: none;width: 150px;text-align: center;vertical-align: bottom;">
		A Carregar...
	</div>

    <div class="hero-image">
        <div class="hero-image-logo">
            <img src="<%=pathImageTOP%>" width="150%"/>
            
        </div>
         <div class="hero-image-text">
            Pronto-a-Vestir Heroína
        </div>
        <div class="hero-text">
            <h4>
                <a href="#" onclick="goPage(0,0)"> Novidades </a> <br>
                <a href="#" onclick="goPage(1,0)"> Homem </a>  <br>
                <a href="#" onclick="goPage(2,0)"> Senhora </a> <br>
                <a href="#" onclick="goPage(3,0)"> Criança </a> <br>
                <a href="#" onclick="goPage(4,0)"> Bebé </a> <br>
                <a href="#" onclick="goPage(5,0)"> Têxteis lar </a> <br>
                <a href="#" onclick="novoContacto()"> Contactar </a>
            </h4>

        </div>
      
        
        
        <div class="hero-image-contacts">
            Contactos: 960271478 - 252601430
        </div>
    </div>






<div>

<!-- ============= COMPONENT ============== -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary sombra">

 <div class="container-fluid">
 	 <a class="navbar-brand" href="#" onclick="goPage(0,0)">Novidades</a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"  aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  <div class="collapse navbar-collapse" id="main_nav">
	

	<ul class="navbar-nav">
		<!-- li class="nav-item active"> <a class="nav-link" href="#">Home </a> </li>
		<li class="nav-item"><a class="nav-link" href="#"> About </a></li -->




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
			
			<c:choose>
			<c:when test="${m.idPai == null}">
			
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">  ${m.descricao} <sub>(${m.numProducts})</sub>  </a>
		    <ul class="dropdown-menu">
			
			
			</c:when>
			<c:otherwise>
			
			<li><a class="dropdown-item" href="#"> ${m.descricao} <sub>(${m.numProducts})</sub> &raquo; </a>
			  	 <ul class="submenu dropdown-menu">
			
			
			</c:otherwise>
			</c:choose>


			<c:if test="${m.idPai == idpai && !m.link}">
				<c:set var="fecharTriploNivel" value="true"/>
			</c:if>
			

			<c:set var="idpai" value="${m.id}"/>
			
			<c:set var="ulAberto" value="true"/>
			
			
		</c:when>
		<c:otherwise>
				<li> <a class="dropdown-item" href="#" onclick="goPage(0, ${m.id})"> ${m.descricao} 
				
	    			<c:if test="${m.link && m.numProducts >0}">
	    				<sub>(${m.numProducts})</sub>
	    			</c:if>
	    		</a>
	    		 </li>
			<c:set var="idpai" value="${m.idPai}"/>
		</c:otherwise>
		</c:choose>
	
	</c:forEach>

</li>
</ul>

<li class="nav-item dropdown">
   <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"  data-bs-toggle="dropdown" aria-expanded="false">
          Gestão
   </a>
   <ul class="dropdown-menu">
		<li><a class="dropdown-item" href="#mainpage" onclick="go(1)">Produtos 1</a> </li>
		<li><a class="dropdown-item" href="#mainpage" onclick="go(2)">Produtos 2</a></li>
        <li><a class="dropdown-item" href="#mainpage" onclick="go(3)">Produtos 3</a></li>
        <li><a class="dropdown-item" href="#mainpage" onclick="go(4)">Contactos 1</a></li>
        <li><a class="dropdown-item" href="#mainpage" onclick="go(5)">Contactos 2</a></li>
        <hr style="border: 2px solid gray;">
        <li><a class="dropdown-item" href="#mainpage" onclick="goUtils()">Utilizadores</a></li>
   </ul>  
</li>

	  
</div>

</div> <!-- navbar-collapse.// -->
  <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 col-12" style="padding-right:20px;padding-left:20px">
        				
	       <form class="d-flex d-flex-align-end" role="search">
	        <input class="form-control me-2" type="search" placeholder="Procurar..." aria-label="Search"> &nbsp;
	        <button class="btn btn-primary" type="submit">Procurar</button>
	      </form>

	  </div>
	  
</div>
      
           

  </div> <!-- navbar-collapse.// -->
 </div> <!-- container-fluid.// -->
</nav>

</div>



<%-- 
	<div style="text-align: right;padding-top: 20px;padding-right: 20px;font-size: 30px">
		<button onclick="criaAnuncio()" class="btn btn-primary" style="border-radius: 10px"> &nbsp;&nbsp; Novo Anúncio JQUERY&nbsp;&nbsp; </button>
		
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Abrir Modal</button>
		
	</div>
	--%>
	
	<!-- Content Row -->
 	
	<!-- Content Row -->
 	<div id="mainpageT0">
 	
 	
    <div style="text-align: center;padding-top: 20px; ">
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
        
        <br>
        
        
        
        
        <div style="padding-bottom: 20px; padding-left: 20px;padding-right: 20px">
            <div class="row">
            
            	<div class="col-6 col-xs-12 col-md-6">
            		<div class="input-group mb-3">
            		
            			<select id="selFieldPesq" class="form-control form-select form-select-sm">
                           	<option value="0"> - Pesquisar -</option>
                           	<option value="1">por nome</option>
                           	<option value="2">por descrição</option>
                           	<option value="3">por referência</option>
                           	<option value="4">por marca</option>
                        </select>
            		
						<input id="nomePesq" type="text" class="form-control" placeholder="nome a pesquisar...">
					  
						<button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="pesquisa(this)">Pesquisar</button>
					</div>
            	
            	</div>
            
            
				<div class="col-6 col-xs-12 col-md-6">
                    <div class="d-flex flex-row-reverse justify-content-right justify-content-md-start">
                        <form class="ml-3 d-inline-block">
                            <select id="selOrdenacao" class="form-control form-select form-select-sm" onchange="aplicaFiltro(this);">
                            	<option value="0"> - Filtro -</option>
                            	<option value="1">Ordenar pelo nome</option>
                            	<option value="2">Ordenar por data ascendente</option>
                            	<option value="3">Ordenar por data descendente</option>
                                <option value="4">Ordenar pelo menor preço</option>
                                <option value="5">Ordenar pelo maior preço</option>
                            </select>
                        </form>
 					</div>
                </div>
 			</div>
         </div>


        <!-- Nav tabs -->
<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="vista1-tab" data-toggle="tab" href="#vista1" role="tab" aria-controls="vista1" aria-selected="true">Vista 1</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="vista2-tab" data-toggle="tab" href="#vista2" role="tab" aria-controls="vista2" aria-selected="false">Vista 2</a>
  </li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane active" id="vista1" role="tabpanel" aria-labelledby="vista1-tab">
  
          
<!-- Content Row -->
 	<div id="mainpage1">
 	
		<div class="row" style="padding-left:20px;padding-right:20px;padding-top: 20px">
                    
                    
         <c:forEach var="prod" items="${listaprodutos}">
 
 
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
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
												${prod.name}             			
				                			</td>
				                		</tr>
				                	</table>

                                </div>
                                <div class="h6 mb-0 text-gray-600" style="text-align: left;  text-align: justify;text-justify: inter-word;"><c:out value="${prod.descricao}"/>   </div>
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
  
  	</div> <!-- Main page 1 -->
  
  
  
  </div>
  <div class="tab-pane" id="vista2" role="tabpanel" aria-labelledby="vista2-tab">
  
  
  	 <!-- Content Row -->
 	<div id="mainpage2">
  
	  <div class="row" style="padding-left:20px;padding-right:20px">
	  
	  <c:forEach var="prod" items="${listaprodutos}">
	        <div class="product-entry">
        	<div class="row">
        		
        		
        		<div class="col-sm-6 text-left">
        			<div class="product-entry-details card">
	        			<div class="card-body">
	        			    <div class="row">
			        			<div class="col-lg-1 col-sm-2">
			        				<div class="product-entry-actions-v">
					            		<a href="#${prod.id}" onclick="showPopup(<c:out value="${prod.id}"/>)">
					            			<img data-toggle="modal" data-target="#myModal" alt="Foto" src="/img/pesq3.png" width="40">
					            		</a>
				            		</div>
			        			</div>
			        			<div class="col-lg-11 col-sm-10">
				        			<div class="product-image">
<%-- 				        				<img src="${prod.dadosImagem}" class="img-fluid"/> --%>
				        				<c:choose>
                                   	<c:when test="${prod.thumbnailImage != null}">
                                   		<img src="${prod.thumbnailImage}" style="border-radius:10px" width="80%">	
                                   	</c:when>
                                   	<c:otherwise>
                                   		<img src="${prod.dadosImagem}" style="border-radius:10px" width="80%">
                                   	</c:otherwise>
                                   </c:choose>
                                   
				        			</div>
			        			</div>
	        				</div>
	        			</div>
	        			<div class="card-footer">
	        				<div class="product-entry-actions-h" style="text-align: right">
				            	
				            		<a href="#${prod.id}" onclick="showPopup(<c:out value="${prod.id}"/>)">
				            			<img data-toggle="modal" data-target="#myModal" alt="Foto" src="/img/pesq3.png" width="40">
				            		</a>
			            	</div>
	        			</div>

        			</div>
        		</div>
        		<div class="col-sm-6">
        			<div class="product-details text-left">
	        			<div class="row">
	        				<div class="col-sm-6" style="text-align: left">
	        					<dl>
	        						<dt>REFERÊNCIA</dt>
	        						<dd>${prod.referencia}</dd>
	        					</dl>
	        				</div>
	        				<div class="col-sm-12" style="text-align: left">${prod.name}</div>
	        				<div class="col-sm-12" style="text-align: left">${prod.descricao}</div>
	        			</div>
        			</div>
        			<div class="infoDate">
        				
        				<!-- fmt:formatDate value="${prod.dataCriacao}" pattern="dd-MM-yyyy HH:mm"/ -->
        				<fmt:parseDate value="${prod.dataCriacao}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
						<fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" />
						
						<!-- Tambem da a solucao abaixo  -->
						<!--     ${prod.dataCriacao.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))}    -->
        			</div>
        			
        		</div>
        	</div>
        </div>
        </c:forEach>
         
         </div>
			  		
	</div> <!-- Main page 2 -->	  		
  
  
  </div>
</div>
</div>

</div> <!-- Main Page div -->  

        
        <script type="text/javascript">
        
        $('#myTab a').on('click', function (e) {
        	  e.preventDefault()
        	  $(this).tab('show')
        	})
        </script>
        

	<div id="mainpageT1" style="display: none;">
 		<div style="text-align: center;padding-top: 20px; ">
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
        
        <br>
 	
 		<div id="contentT0">
 		
 		</div>
 	
 	
 		</div>
 	
 	</div>
	

        
        <div style="padding-bottom: 20px;padding-right: 20px;">
            <div class="row">
				<div class="col-12 col-md-12">
                    <div class="d-flex flex-row-reverse justify-content-right justify-content-md-start">
        	<nav>
			  <div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
			    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Vista 1</a>
			    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Vista 2</a>
<!-- 			    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</a> -->
			  </div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
			  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">

					AAAAAA





			  </div>
			  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
			  		
			  		
			  		
			  		fffffffffff
			  		
			  		
			  		
			  </div>
<!-- 			  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div> -->
			</div>
        		</div>
        	</div>
        </div>
        </div>
        
        <script type="text/javascript">
        
        
        $('#nav-tab a').on('click', function (e) {
        	  e.preventDefault()
        	  $(this).tab('show')
        	})
        </script>
        
        
        
       <div id="mainpage">
       
       
       
       
       <!--  ----------------------------------------  -->
       
        
        
  
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
 	
 	.carousel-caption {
  position: absolute;
  right: 15%;
  bottom: 1.25rem;
  left: 15%;
  padding-top: 3.25rem;
  /*padding-bottom: 1.25rem; */
  color: #fff;
  text-align: center;
}

 </style>
 
 <script>
 	
 	 

	 const toggleBottomAds = (_btnEl) => {
		 
		 const parent = _btnEl.parentElement;
		 const status = parent.dataset.status;
		 
		 if(status && status=='closed'){
			 parent.dataset.status='open';
			 localStorage.setItem("myOption", "open");
		 }else{
			 parent.dataset.status='closed';
			 localStorage.setItem("myOption", "closed");
		 }
	 }
 
 </script>
 
 <div id="div-bottom-ads" class="bottom-ads">
 	<span class="bottom-ads-button" onclick="toggleBottomAds(this)"></span>
 	<div class="bottom-ads-container" style="text-align: center;">
 		

		<div class="row">
				<div class="col-12 col-md-12">
                    <div class="d-flex flex-row-reverse justify-content-center ">

 		<div id="carouselMain" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active text-center active" data-bs-interval="5000">
                    <img src="/img/slides/ImageFilipa2.png" alt="" class="img-fluid d-none d-md-block" style="height: 150px">
                    <img src="/img/slides/ImageFilipa5Small.png" alt="" class="img-fluid d-block d-md-none" style="height: 150px">
                    <div class="carousel-caption d-none d-md-block" style="font-size: 10px;padding-top: 20px">
					    <h5><a href="https://www.facebook.com/heroina.heroina.353" target="_blank">Facebook</a></h5>
					    <p>(aceda ao meu facebook ou consulte neste site)</p>
					</div>
                </div>
                <div class="carousel-item text-center" data-bs-interval="5000">
<!--                     <img src="/img/slides/slide01.jpg" alt="" class="img-fluid d-none d-md-block" style="height: 150px"> -->
<!--                     <img src="/img/slides/slide01small.jpg" alt="" class="img-fluid d-block d-md-none" style="height: 150px"> -->

                    <img src="/img/slides/ImageFilipa2.png" alt="" class="img-fluid d-none d-md-block" style="height: 150px">
                    <img src="/img/slides/ImageFilipa5Small.png" alt="" class="img-fluid d-block d-md-none" style="height: 150px">
                    <div class="carousel-caption " style="font-size: 10px;padding-top: 20px">
					    <h5><a href="https://www.facebook.com/heroina.heroina.353" target="_blank">Facebook</a></h5>
					    <p style="font-size: 12px">(aceda ao meu facebook ou consulte neste site)</p>
					</div>
                </div>
                <div class="carousel-item text-center" data-bs-interval="5000">
                    <img src="/img/slides/ImageFilipa2.png" alt="" class="img-fluid d-none d-md-block" style="height: 150px">
                    <img src="/img/slides/ImageFilipa2Small.png" alt="" class="img-fluid d-block d-md-none" style="height: 150px">
                    <div class="carousel-caption d-none d-md-block" style="font-size: 10px;padding-top: 20px">
					    <h5><a href="https://www.facebook.com/heroina.heroina.353" target="_blank">Facebook</a></h5>
					    <p>(aceda ao meu facebook ou consulte neste site)</p>
					</div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselMain" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
                <span class="visually-hidden">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#carouselMain" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
                <span class="visually-hidden">Próximo</span>
            </a>
        </div>
 		
 		
 		</div>
 		</div>
 		</div>
 		
 	<script type="text/javascript">
	    $(document).ready(function () {
	    	//const parent = $(".bottom-ads-button").parentElement;
	    	const parent = document.getElementById("div-bottom-ads"); //$(".bottom-ads");
	    	console.log(parent)
			//const status = parent.dataset.status;
	    	const op = localStorage.getItem("myOption");
	    	//alert('op: '+op)
	    	if (op != null) {
	    		parent.dataset.status=op;
	    	}
	    	
	    });
    </script>
    
 	</div>
 </div>

<div id="dialog">
</div>

<div id="alert"></div>
<div id="alert2"></div>

</section>

<script>

var tipo = <c:out value="${tipo}"/>;

function loadDialog(url, width) {
	//pagina = page;
	//alert(pagina)
	//console.log("dialog1: "+dialog1+"|");
	dialog1 = $( "#dialog" ).dialog({ 
    	modal: true,
    	resizable:false,
    	width: "90%",
    	 buttons: [
		    {
		      text: "Fechar",
		      click: function() {
		    	  dialog1.dialog( "close" );
		    	  
		    	  //removeDialog();
		    	 /*if (pagina == 'listInvites'){
		    		 go(5);
		    	 }*/
		    	 //go(5);
		        //$( this ).dialog( "close" );
		      }
		    }
		  ],
		  close: function() { removeDialog(); }
	}).load(url).dialog('open'); 
	
}

function criaAnuncio(){

	/*
	dialog1 = $( "#dialog" ).dialog({ 
    	modal: true,
    	resizable:false,
    	width: 600,
    	 buttons: [
		    {
		      text: "Fechar",
		      click: function() {
		    	  dialog1.dialog( "close" );
		        //$( this ).dialog( "close" );
		      }
		    }
		  ]
	}).load('/mycard-api/createcard').dialog('open'); 
	*/
	
	
	loadDialog('/createAd', 1000)
	//dialog1.load('/mycard-api/createcard').dialog('open');
}



function removeAd(id, ref){
	//alert('delete: '+cid)
	
	$("#alert").html("Tem a certeza que pretende eliminar o anúncio com referencia "+ref+" ?");
	alert1 = $("#alert").dialog({
		  dialogClass: "alert",
		  modal: true,
		  width:300,
		  buttons: [
    		    {
    		      text: "Sim",
    		      click: function() {
    		        alert1.dialog( "close" );
    		        confirmDelete(id);
    		      }
    		    },
    		    {
    		      text: "Não",
    		      click: function() {
    		        alert1.dialog( "close" );
    		        //return false;
    		      }
    		    }
    		  ]
		}).dialog('open');
	
}

function removeAdBS(id, ref){
	idAnuncio = id;
	
	$('.modal-body2').html("Tem a certeza que pretende eliminar o anúncio com referência "+ref+" ?");
	
	$('#myModal2').modal('show');
	
	$('#closeModalBtn').click(function() {
	    $('#myModal2').modal('hide');
	  });
	
}

function confirmDelete(id) {
	$.ajax({
	   	 url: "/deleteAd/"+id
	   	,type: 'DELETE' 
        ,contentType: 'application/json'
	   	 ,success:function(res){

	   		 if (res){
	   			
		   		$("#alert2").html("Anúncio eliminado.");
		   		alert2 = $("#alert2").dialog({
		   			modal: true,
					dialogClass: "alert",
						buttons: [
			    		    {
			    		      text: "Fechar",
			    		      click: function() {
			    		        alert2.dialog( "close" );
			    		        /*if (page == 'listInvites'){
			    		        	go(5);
			    		        }else{
			    		        	go(2);
			    		        }*/
			    		        
			    		        window.location.href="/roupaAdmin/"+tipo;
			    		      }
			    		    }
			    		  ]
				});
	   		 }else{
	   			 alert(res);
	   		 }
	   		
	   	 },
	   	 error: function (XMLHttpRequest, textStatus, errorThrown){
	   		 alert("erro: "+errorThrown)
	   	 }
	 });
} 


function editAd(id){
	
	//loadDialog('/editAd/'+id, 1000);
	
	$("#exampleModalCenterTitle").html("Alterar Anúncio");
	
	//$('#myModal').modal(options)
	//alert(1)
	//$(document).ready(function() {
//		  $('#myModal').on('shown.bs.modal', function() {
    $.ajax({
      url: '/editAd/'+id,
      type: 'GET',
      success: function(response) {
        $('.modal-body').html(response);
        
        //$('#myModal').modal('show');
      }
    });


    $('#myModal').modal({
        backdrop: 'static'  // This prevents clicking outside the modal to close it
        //keyboard: false      // This prevents pressing the Escape key to close it
      }); 
    
    $('#myModal').modal('show');
	
}


function showPopup(id){
	
	$("#exampleModalCenterTitle").html("Imagem");
	$('.modal-body').html("");
	$('.modal-body').html("<div id='spinner' class='loading' style='width: 150px;text-align: center;vertical-align: bottom;'> "+
		"A Carregar... "+
		"</div>");
	
	$.ajax({
	      url: '/products/show/'+id,
	      type: 'GET',
	      success: function(response) {
	        $('.modal-body').html(response);
	        
	        $('#myModal').modal('show');
	      }
	    });

    //$('#myModal').modal('show');
}

function novoContacto(){
	
	//$("#exampleModalCenterTitle").html("Novo Contacto");
	$('.modal-body-contact').html("");
	
	$.ajax({
	      url: '/contacts/newcontact',
	      type: 'GET',
	      success: function(response) {
	        $('.modal-body-contact').html(response);
	        
	        setTimeout(function() {
	        	$("#nome").focus();
	        }, 1000);
	        
	        //$('#myModal').modal('show');
	      }
	    });

	$('#contactModal').modal({
        backdrop: 'static'  // This prevents clicking outside the modal to close it
        //keyboard: false      // This prevents pressing the Escape key to close it
    });
	
    $('#contactModal').modal('show');
    
    
}

</script>

</body>
</html>