<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Roupas Admin</title>

    <!-- Custom styles for this template -->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">



<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">    -->
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
	  display: block;
	  position: absolute;
	  bottom: 16px;
	  right: 26px;
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
	
</style>



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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 

 
 <!-- MDB -->
<!-- <script -->
<!--   type="text/javascript" -->
<!--   src="/mdb/js/mdb.min.js" -->
<!-- ></script> -->


<script type="text/javascript">
	function goPage(page, subtipo) {
		location.href="/roupaAdmin/"+page+"/"+subtipo;

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
	
	
// 	$(document).ready(function() {
// 		  $('#myModal2').on('shown.bs.modal', function() {
		    
// 	 	});

// 	  var dropdownMenuList = [].slice.call(document.querySelectorAll('.dropdown-menu2'));
// 	  var dropdownList = dropdownMenuList.map(function (dropdownMenu) {
// 	    return new bootstrap.Dropdown(dropdownMenu);
// 	  });

	//});

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
		}else if (page == 5) {
			$(".titulo-pagina").html("<strong>Contactos</strong>");

			//$( "#mainpage2" ).load( "/listaprodutos" );
			$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
			
			$( "#mainpage" ).load( "/contacts/listacontactos2", function() {
				  //alert( "Load was performed." );
				});
		}
}

</script>

</head>
<body>


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
        <button type="button" id="closeMyModalBtn" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
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
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
    <div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                    <button class="btn btn-secondary" type="button" onclick="create()">Enviar</button>
                    <a class="btn btn-primary" href="#"  id="closeModalContact">Sair</a>
                </div>
            </div>
        </div>
    </div>


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





 <nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    			
    <a class="navbar-brand" href="#" onclick="goPage(0,0)">Novidades</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    
     <div class="row">
			<div class="col-sm-10 text-left" style="border:1px solid blue">


    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">



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


<li class="nav-item dropdown">
   <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"  data-bs-toggle="dropdown" aria-expanded="false">
          Gestão
   </a>
   <ul class="dropdown-menu">
		<li><a class="dropdown-item" href="#" onclick="go(1)"> Produtos 1</a> </li>
		<li><a class="dropdown-item" href="#" onclick="go(2)">Produtos 2</a></li>
        <li><a class="dropdown-item" href="#" onclick="go(3)">Produtos 3</a></li>
        <li><a class="dropdown-item" href="#" onclick="go(4)">Contactos</a></li>
        <li><a class="dropdown-item" href="#" onclick="go(5)">Contactos 2</a></li>
   </ul>  
</li>
   
<!-- 
 <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" >Dropdowns</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Custom Menu</a></li>
                            <li><a href="#">Custom Menu</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" >Sub Menu</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Custom Menu</a></li>
                                    <li><a href="#">Custom Menu</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" >Sub Menu</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Custom Menu</a></li>
                                            <li><a href="#">Custom Menu</a></li>
                                            <li><a href="#">Custom Menu</a></li>
                                            <li><a href="#">Custom Menu</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Custom Menu</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Custom Menu</a></li>
                            <li><a href="#">Custom Menu</a></li>
                            <li><a href="#">Custom Menu</a></li>
                            <li><a href="#">Custom Menu</a></li>
                        </ul>
                    </li>
-->



	</ul>















    
   
	  
      </div>
      
           <div class="col-sm-2">
        				
	       <form class="d-flex" role="search">
	        <input class="form-control me-2" type="search" placeholder="Procurar..." aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Procurar</button>
	      </form>

	  </div>
	  
      <!-- form class="form-inline my-2 my-lg-0" role="search">
        <input class="form-control me-2" type="search" placeholder="Procurar..." aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Procurar</button>
      </form -->
      
    </div>
  </div>
</nav>




<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
    Menu
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <li>
      <a class="dropdown-item" href="#">Level 1</a>
      <ul class="dropdown-menu">
        <li>
          <a class="dropdown-item" href="#">Level 2</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Level 2.1</a></li>
            <li>
              <a class="dropdown-item" href="#">Level 2.2</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Level 2.2.1</a></li>
                <li><a class="dropdown-item" href="#">Level 2.2.2</a></li>
              </ul>
            </li>
          </ul>
        </li>
      </ul>
    </li>
    <li>  <a class="dropdown-item" href="#">Level 11</a> </li>
  </ul>
</div>






<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <ul class="navbar-nav ms-auto">
      <!-- Dropdown -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLinkRight" role="button"
          data-mdb-toggle="dropdown" aria-expanded="false">
          Dropdown link
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLinkRight">
          <li><a class="dropdown-item" href="#">Action</a></li>
          <li><a class="dropdown-item" href="#">Another action</a></li>
          <li>
            <a class="dropdown-item" href="#"> Submenu &raquo; </a>
            <ul class="dropdown-menu dropdown-submenu dropdown-submenu-left">
              <li>
                <a class="dropdown-item" href="#">Submenu item 1</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">Submenu item 2</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">Submenu item 4</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">Submenu item 5</a>
              </li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</nav>








	<div style="text-align: right;padding-top: 20px;padding-right: 20px;font-size: 30px">
		<button onclick="criaAnuncio()" class="btn btn-primary" style="border-radius: 10px"> &nbsp;&nbsp; Novo Anúncio &nbsp;&nbsp; </button>
		
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Abrir Modal</button>
		
	</div>

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
        			<div class="row">
        			<div class="col-sm-1" style="border: 1px solid blue">
	        			<a class="btn-delete" href="#" onclick="removeAdBS(<c:out value="${prod.id}"/>, '<c:out value="${prod.referencia}"/>')">
	            			<img alt="Remover Anuncio" src="/img/remove.png" width="40">
	            			
	            		</a> 
	            		<br/><br>
	            		<a href="#" onclick="editAd(<c:out value="${prod.id}"/>)">
	            			<img data-toggle="modal" data-target="#myModal" alt="Editar Anuncio" src="/img/edit.png" width="40">
	            			<!-- button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Abrir Modal</button -->
	            		</a>
	            		
	            		<br/><br>
	            		<a href="#" onclick="showPopup(<c:out value="${prod.id}"/>)">
	            			<img data-toggle="modal" data-target="#myModal" alt="Foto" src="/img/pesq3.png" width="40">
	            		</a>
        			</div>
        			<div class="col-sm-11">
        			
	        			<div class="product-image">
	        				<img src="${prod.dadosImagem}" class="img-fluid"/>
	        			</div>
        			</div>
        			</div>
        		</div>
        		<div class="col-sm-6">
        			<div class="product-details text-left">
	        			<div class="row">
	        				<div class="col-sm-6">
	        					<dl>
	        						<dt>REFERÊNCIA</dt>
	        						<dd>${prod.referencia}</dd>
	        					</dl>
	        				</div>
	        				<div class="col-sm-12">${prod.name}</div>
	        				<div class="col-sm-12">${prod.descricao}</div>
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
         
        <br/><br/>
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
	
	//$("#exampleModalCenterTitle").html("Novo Contacto");
	$('.modal-body-contact').html("");
	
	$.ajax({
	      url: '/contacts/newcontact',
	      type: 'GET',
	      success: function(response) {
	        $('.modal-body-contact').html(response);
	        
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