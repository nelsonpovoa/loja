<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


    
<head>


	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">

    <link rel="apple-touch-icon" sizes="180x180" href="/img/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="/img/favicon/site.webmanifest">
    <link rel="mask-icon" href="/img/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <link rel="shortcut icon" href="/img/favicon/favicon.ico">
	<meta name="msapplication-TiteColor" content="#da53c">
    <meta name="msapplication-config" content="/img/favicon/browserconfig.xml">
    <meta name="theme-color" color="#ffffff">
    
    <title>Entrada - Pronto-a-Vestir Heroina </title>

    <!-- CSS -->
    <link href="/menu13/css/bootstrap.min.css" rel="stylesheet">
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    
    
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">    -->
    
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <link href="/menu13/css/animate.css" rel="stylesheet">
    <link href="/menu13/css/bootsnav.css" rel="stylesheet">
    <link href="/menu13/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" href="/css/style.css"/>
    
    
    <style type="text/css">
    
	
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
        
        
        .img-fluid {
		  max-width: 100%;
		  height: auto;
		}
    </style>
    
    
    	<!-- START JAVASCRIPT -->
    <!-- Placed at the end of the document so the pages load faster -->
<!--     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <script src="/webjars/jquery/3.6.4/jquery.min.js"></script>
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<!--     <script src="/js/bootstrap53.js"></script> -->

    <script src="/menu13/js/bootstrap.min.js"></script>
    
    
    <!-- Bootsnavs -->
    <script src="/menu13/js/bootsnav.js"></script>
    
    <script type="text/javascript">
    

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

    
    
    function criaAnuncioModalBS(){
    	$('.modal-body').html("");
    	//alert(1111)
    	
    	$.ajax({
            url: '/createAd2',
            type: 'GET',
            success: function(response) {
          	  //alert(response)
            
              $('.modal-body').html(response);
              
              //$('#myModal').modal('show');
            }
          });

    	$('#myModal').modal({
            backdrop: 'static'  // This prevents clicking outside the modal to close it
            //keyboard: false      // This prevents pressing the Escape key to close it
          });
    	
		$("#myModal").modal('show');
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



    function removeAd(id, ref){
    	//alert('delete: '+cid)
    	
    	$("#alert").html("Tem a certeza que pretende eliminar o anúncio com referência "+ref+" ?");
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
//    		  $('#myModal').on('shown.bs.modal', function() {
        $.ajax({
          url: '/editAd/'+id,
          type: 'GET',
          success: function(response) {
        	  //alert(response)
          
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
    	$('.modal-body').html("");
    	
    	$.ajax({
    	      url: '/contacts/newcontact',
    	      type: 'GET',
    	      success: function(response) {
    	        $('.modal-body').html(response);
    	        
    	        setTimeout(function() {
		        	$("#nome").focus();
		        }, 1000);
    	        
    	        //$('#myModal').modal('show');
    	      }
    	    });

        $('#myModal').modal('show');
    }

    
    
	function goPage(page, subtipo) {
		location.href="/roupaAdminMenu/"+page+"/"+subtipo;
	}
	
	
	$(document).ready(function() {
		  $('#myModal2').on('shown.bs.modal', function() {
		    
	 	});
	});
	
	function scrollToTop() {
		  window.scrollTo({
		    top: 0,
		    behavior: 'smooth' // For smooth scrolling effect
		  });
		}
	
function go(page){
		
		if (page == 1){
			$(".titulo-pagina").html("<strong>Produtos</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/products/listaprodutos2", function() {
				  //alert( "Load was performed." );
				});
		}else if (page == 3) {
			$(".titulo-pagina").html("<strong>Produtos</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/products/listaprodutos3", function() {
				  //alert( "Load was performed." );
				});
		}else if (page == 4) {
			$(".titulo-pagina").html("<strong>Contactos</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/contacts/listacontactos", function() {
				  //alert( "Load was performed." );
				});
		}
}
</script>


</head>
<body>     

<section>

<div id="mainpage2"></div>

 <div class="slider" onclick="scrollToTop()">
    <span>&#8593;</span> <!-- Upward arrow symbol -->
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
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
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
	        <button type="button" class="btn btn-danger">Sim</button>
	        <button type="button" id="closeModalBtn" class="btn btn-secondary" data-dismiss="modal">Não</button>
	      </div>
	    </div>
	  </div>
	</div>






 	<!-- Start Navigation -->
    <nav class="navbar navbar-default bootsnav">

        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->

        <div class="container">            
            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
                            <i class="fa fa-shopping-bag"></i>
                            <span class="badge">3</span>
                        </a>
                        <ul class="dropdown-menu cart-list">
                            <li>
                                <a href="#" class="photo"><img src="/menu13/images/thumb/thumb01.jpg" class="cart-thumb" alt="" /></a>
                                <h6><a href="#">Delica omtantur </a></h6>
                                <p>2x - <span class="price">$99.99</span></p>
                            </li>
                            <li>
                                <a href="#" class="photo"><img src="/menu13/images/thumb/thumb02.jpg" class="cart-thumb" alt="" /></a>
                                <h6><a href="#">Omnes ocurreret</a></h6>
                                <p>1x - <span class="price">$33.33</span></p>
                            </li>
                            <li>
                                <a href="#" class="photo"><img src="/menu13/images/thumb/thumb03.jpg" class="cart-thumb" alt="" /></a>
                                <h6><a href="#">Agam facilisis</a></h6>
                                <p>2x - <span class="price">$99.99</span></p>
                            </li>
                            <li class="total">
                                <span class="pull-right"><strong>Total</strong>: $0.00</span>
                                <a href="#" class="btn btn-default btn-cart">Cart</a>
                            </li>
                        </ul>
                    </li>
                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                    <li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
                </ul>
            </div>
            <!-- End Atribute Navigation -->

            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#brand"><img src="images/brand/logo-black.png" class="logo" alt=""></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">

                    <li class="active"><a class="navbar-brand" href="#" onclick="goPage(0,0)">Novidades</a></li>



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
			
			
			 <li class="nav-item dropdown">
    	      <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"  data-bs-toggle="dropdown" aria-expanded="false">
	            ${m.descricao} <sub>(${m.numProducts})</sub>
		  	  </a>
			  <ul class="dropdown-menu">
				 
          

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



                    
                    
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>   

        <!-- Start Side Menu -->
        <div class="side">
            <a href="#" class="close-side"><i class="fa fa-times"></i></a>
            <div class="widget">
                <h6 class="title">Gestão</h6>
                <ul class="link">
                    <li><a href="#" onclick="go(1)">Produtos 1</a></li>
                    <li><a href="#" onclick="go(2)">Produtos 2</a></li>
                    <li><a href="#" onclick="go(3)">Produtos 3</a></li>
                    <li><a href="#" onclick="go(4)">Contactos 1</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="widget">
                <h6 class="title">Additional Links</h6>
                <ul class="link">
                    <li><a href="#">Retina Homepage</a></li>
                    <li><a href="#">New Page Examples</a></li>
                    <li><a href="#">Parallax Sections</a></li>
                    <li><a href="#">Shortcode Central</a></li>
                    <li><a href="#">Ultimate Font Collection</a></li>
                </ul>
            </div>
        </div>
        <!-- End Side Menu -->
    </nav>
    <!-- End Navigation -->



	<div class="hero-image">
        <div class="hero-image-logo">
            
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

<nav class="navbar navbar-default bootsnav">
 <!-- nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: #e3f2fd;" -->
  <div class="container-fluid">
    			
    <a class="navbar-brand" href="#" onclick="goPage(0,0)">Novidades</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    
     <div class="row">
			<div class="collapse navbar-collapse" id="main_nav">


    <!--  <div class="collapse navbar-collapse" id="navbarScroll" -->
      <!--  ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;" -->

	<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">

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
			
			
			 <li class="nav-item dropdown">
    	      <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"  data-bs-toggle="dropdown" aria-expanded="false">
	            ${m.descricao} <sub>(${m.numProducts})</sub>
		  	  </a>
			  <ul class="dropdown-menu">
				 
          

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




	</ul>



	  
      </div>
      
           <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 col-12" style="padding-right:20px;padding-left:20px">
        				
	       <form class="d-flex d-flex-align-end" role="search">
	        <input class="form-control me-2" type="search" placeholder="Procurar..." aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Procurar</button>
	      </form>

	  
      <!-- form class="form-inline my-2 my-lg-0" role="search">
        <input class="form-control me-2" type="search" placeholder="Procurar..." aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Procurar</button>
      </form -->
      
    </div>
  </div>
</nav>




    <div class="clearfix"></div>



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
        
       
       <div id="mainpage">
       
       
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
				        				<img src="${prod.dadosImagem}" class="img-fluid"/>
				        			</div>
			        			</div>
		        			</div>
	        			</div>
	        		</div>
        		</div>
        		
        			
        		<div class="col-sm-6">
        			<div class="card border-left-primary shadow h-100 py-2">
        			
        				<div class="card-body" style="text-align: left">
        				
		        			<div class="row">
		        				<div class="col-sm-6">
		        					<dl>
		        						<dt>REFERÊNCIA</dt>
		        						<dd>${prod.referencia}</dd>
		        					</dl>
		        				</div>
		        				<div class="col-sm-12">${prod.name}</div>
		        				<div class="col-sm-12" style="text-align: left;  text-align: justify;text-justify: inter-word;"><c:out value="${prod.descricao}"/> </div>
		        			</div>
        			</div>
        			<div class="card-footer" style="text-align: right">
        				
        				<!-- fmt:formatDate value="${prod.dataCriacao}" pattern="dd-MM-yyyy HH:mm"/ -->
        				<fmt:parseDate value="${prod.dataCriacao}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
						<fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" />
						
						<!-- Tambem da a solucao abaixo  -->
						<!--     ${prod.dataCriacao.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))}    -->
        			</div>
        			</div>
        		</div>
        	</div>
        </div>
        </c:forEach>
         
         
        <br/><br/>

		
		</div>
		<!-- MAin Page -->

    </div>
    <!-- End Content -->




<div id="dialog">
</div>

<div id="alert"></div>
<div id="alert2"></div>
    
 </section>



</body>
</html>

