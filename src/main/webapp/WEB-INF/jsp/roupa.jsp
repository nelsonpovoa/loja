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
    
    <!-- Custom fonts for this template-->
<!--     <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    
<!-- link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" -->

<link rel="stylesheet" href="/css/style.css"/>

    <!-- meta charset="UTF-8">
    <title>Title</title -->

   

<style>


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
		font: bold; 8px/10px sans-serif;
		display: inline-block; /* permite menu na horizontal */
		position: relative;
		padding: 25px 15px;
		background: #6699cc;
	}
	
	ul li a{
		text-decoration: none;
		/*padding: 15px 15px;*/ 
		color: white;
		/*font-size: 10px; */
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
		width: 200px;
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
		z-index:999999;
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

	.ttt {
	  display: block;
	  position: absolute;
	  bottom: 16px;
	  left: 26px;
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
        
      .infoDate {
	  display: block;
	  position: absolute;
	  bottom: 16px;
	  right: 26px;
	}
	
</style>

<script src="/webjars/jquery/3.6.4/jquery.min.js"></script>
<!-- script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

	function scrollToTop() {
	  window.scrollTo({
	    top: 0,
	    behavior: 'smooth' // For smooth scrolling effect
	  });
	}

	function goPage(page, subtipo) {
		//$("#spinner").style.display = "block";
		var x = document.getElementById("spinner");
		if (x.style.display === "none") {
		  x.style.display = "block";
		  //alert('block')
		} else {
		  x.style.display = "none";
		}
		
		location.href="/roupa/"+page+"/"+subtipo;
	}
	
	$(document).ready(function() {
		  $('#myModal').on('shown.bs.modal', function() {
	 	});
		  
	  $('#myBtnFechar').click(function() {
		    $('#myModal').modal('hide');
		  });
	  
	  $('#closeModalContact').click(function() {
		    $('#contactModal').modal('hide');
		  });
	});
	
</script>

</head>
<body id="page-top">

<section>


 <div class="slider" onclick="scrollToTop()">
    <span>&#8593;</span> 
  </div>

<!-- Modal -->
<div class="modal fade modal-resizable" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Anúncio</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
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
    <div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Novo Contacto</h5>
                    <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>
                <div class="modal-body-contact"></div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" onclick="create()">Enviar</button>
                    <a class="btn btn-secondary" href="#" id="closeModalContact">Sair</a>
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
                <a href="#" onclick="goPage(0, 0)"> Novidades </a> <br>
                <a href="#" onclick="goPage(1, 0)"> Homem </a> <br>
                <a href="#" onclick="goPage(2, 0)"> Senhora </a> <br>
                <a href="#" onclick="goPage(3, 0)"> Criança </a> <br>
                <a href="#" onclick="goPage(4, 0)"> Bebé </a> <br>
                <a href="#" onclick="goPage(5, 0)"> Têxteis lar </a> <br>
                <a href="#" onclick="novoContacto()"> Contactar </a>
            </h4>

        </div>
        
        <div class="hero-image-contacts">
            Contactos: 960271478 - 252601430
        </div>
    </div>


<div class="navbar">
<ul>
	<li><a href="#" onclick="goPage(0, 0)"><i class="fa-sharp fa-regular fa-sun fa-beat"> </i>&nbsp;Novidades</a> </li>
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
			
			<li style="color:white;cursor: pointer;">
			
			<c:choose>
			<c:when test="${m.id == 1}">
				<i class="fa-solid fa-user-tie"></i> 
			</c:when>
			<c:when test="${m.id == 4 || m.id == 50 || m.id == 60}">
				<i class="fa-solid fa-child"></i> 
			</c:when>
			<c:when test="${m.id == 5}">
				<i class="fa-solid fa-house-chimney-user"></i> 
			</c:when>
			<c:when test="${m.id == 6}">
				<i class="fa-solid fa-shoe-prints"></i> 
			</c:when>
			<c:otherwise>
				<i class="fa-regular fa-user"></i> 
			</c:otherwise>
			</c:choose>
			
			 ${m.descricao} <sub>(${m.numProducts})</sub>
			 
			 
				<c:choose>
					<c:when test="${m.idPai == null}">
						&nbsp&#8681
					</c:when>
					<c:otherwise>
						&nbsp&#8680
					</c:otherwise>
				</c:choose>
				  
				
				 <ul>


			<c:if test="${m.idPai == idpai && !m.link}">
				<c:set var="fecharTriploNivel" value="true"/>
			</c:if>
			

			<c:set var="idpai" value="${m.id}"/>
			
			<c:set var="ulAberto" value="true"/>
			
			
		</c:when>
		<c:otherwise>
	    		<li> <a href="#" onclick="goPage(0, ${m.id})"> ${m.descricao}</a> 
	    		
	    			<c:if test="${m.link && m.numProducts >0}">
	    				<sub>(${m.numProducts})</sub>
	    			</c:if>
	    		
	    		 </li>
			<c:set var="idpai" value="${m.idPai}"/>
		</c:otherwise>
		</c:choose>
	
	</c:forEach>
	
		</li>
	</ul>
	
<!-- 	<li> <a href="#"> Contactos</a> </li>  -->
	
	</ul>
</div>

<br>



<br>
	<!-- div style="text-align: right;padding-top: 20px;padding-right: 20px;font-size: 30px">
		<button onclick="criaAnuncio()" class="btn btn-primary" style="border-radius: 10px"> &nbsp;&nbsp; Novo Anúncio &nbsp;&nbsp; </button>
	</div -->

<div class="text11" id="mainpage">


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
        
        <br>
        
        <c:forEach var="prod" items="${listaprodutos}">
        <div class="product-entry">
        	<div class="row">
        		<div class="col-sm-6">
        			<div class="product-image">
        				<img src="${prod.dadosImagem}" class="img-fluid"/>
        			</div>
        			
        			<div class="ttt">
        				<a href="#${prod.id}" onclick="showPopup(<c:out value="${prod.id}"/>)">
	            			<img data-toggle="modal" data-target="#myModal" alt="Foto" src="/img/pesq4.png" width="50">
	            		</a>
        			</div>
        			
        		</div>
        		<div class="col-sm-6">
        			<div class="card border-left-primary shadow h-100 py-2">
        			
        				<div class="card-body" style="text-align: left">
        			
		        			<div class="row">
		        				<div class="col-sm-12">
		        					<dl>
		        						<dt>REFERÊNCIA</dt>
		        						<dd>${prod.referencia}</dd>
		        					</dl>
		        				</div>
		        			</div>
		        			<div class="row">
		        				<div class="col-sm-12">${prod.name}</div>
		        				<div class="col-sm-12" style="text-align: left;  text-align: justify;text-justify: inter-word;">${prod.descricao}</div>
		        			</div>
	        			</div>
	        			
	        			<div class="card-footer " style="text-align: right">
	        			 
	        				<dl style="font-style: italic;color: #6699cc;font-size: 12px">
	       						<dt>Publicado</dt>
	       						<dd>${prod.dataCriacao.format( DateTimeFormatter.ofPattern("dd.MM.yyyy"))}</dd>
	       					</dl>
	        			
        				</div>
        				
        			</div>
        		</div>
        	</div>
        </div>
        </c:forEach>
        
        </div>

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

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
</div>


<div id="dialog">

</div>

<div id="alert"></div>
<div id="alert2"></div>

</section>

<script>

var dialog1 = '';

function closeDialog1(){
	dialog1.dialog( "close" );
}

function actualizaConteudo(res){
	//console.log('actualizaConteudo: '+dialog1);
	dialog1.html(res);
	
}

function removeDialog(){
	$("div.ui-dialog").remove();
	$("#mainpage").append("<div id='dialog'></div>")
}

function loadDialog(url, width) {
	//pagina = page;
	//alert(pagina)
	//console.log("dialog1: "+dialog1+"|");
	dialog1 = $( "#dialog" ).dialog({ 
    	modal: true,
    	resizable:false,
    	width: width,
    	 buttons: [
		    {
		      text: "Fechar",
		      click: function() {
		    	  dialog1.dialog( "close" );
		    	  
		    	  removeDialog();
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
	
	
	loadDialog('/createAd2', 1000)
	//dialog1.load('/mycard-api/createcard').dialog('open');
}


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


function novoContacto(){
	
	$("#exampleModalCenterTitle").html("Novo Contacto");
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