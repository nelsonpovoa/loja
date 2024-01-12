<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%!
	
protected String createMenu(java.util.List items, int pos, long id, Integer idpai) {
	if (items == null || items.size() == 0) {
		return "";
	}
	StringBuffer sb = new StringBuffer();		
	java.util.Iterator it = items.iterator();
	
	//adicionar div do menu com o nível adequado
	sb.append("");
	
	//Percorrer todos os items deste menu	
	
	while (it.hasNext()) {
		com.example.teste3.models.Menu item =
			(com.example.teste3.models.Menu) it.next();

		System.out.println("pos: "+pos+" id: "+item.getId()+ " id2: "+id);
		
		if (((item.getId()==1 || item.getId()==2 || item.getId()==3 ) && idpai == null) ) {
			sb.append("<h6 class='collapse-header'>"+item.getDescricao() + "</h6>");
			
			java.util.List items2 = items;
			
			/*
			if (pos <items.size())
				items2 = items.subList(pos++, items.size());
			*/
			
			System.out.println(item.getDescricao()+"item.getId(): "+item.getId()+" idpai: "+item.getId());
			sb.append(createMenu(items2, ++pos, item.getId(), Integer.parseInt(""+item.getId())));
			
			System.out.println("pos: "+pos+" item lenght: "+items2.size());
		}else {
			
			
			
		System.out.println("pos: "+pos+"item.getId() "+item.getId()+"  > id : "+id);
		
		if (item.getId() > id) {
		
			//colocar div com o nome do item
			if (item.getIdPai() == idpai && item.getLink()){

			    
			    sb.append("<a class='collapse-item' href='#' onclick=\"goPage2('"+item.getPagina()+"')\">"+item.getDescricao()+"</a>");		    
				
			}else if (item.getIdPai()==null && !item.getLink()){
				//sb.append("<h6 class='collapse-header'>"+item.getDescricao() + "</h6>");
				
				sb.append(createMenu(items.subList(++pos, items.size()), ++pos, item.getId(), item.getIdPai()));
				System.out.println("item lenght: "+items.size()+" pos: "+pos);
			}
		} 
		
		}
		
	}
	


	
	return sb.toString();
}
	
%>

    
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

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


<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      
<!--       <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->

<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

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
        
        
</style>

<!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>
    
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	function goPage(page, subTipo) {
		location.href="/roupasb/"+page+"/"+subTipo;
	}
	
	function goPage2(page) {
		location.href=page;
	}
	
// 	function cancelarContacto(){
// 		$('#contactModal').modal('show');
// 	}
	
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

		//$('#contactModal').modal('show');
		
		
	    $('#contactModal').modal({
	        backdrop: 'static'  // This prevents clicking outside the modal to close it
	            //keyboard: false      // This prevents pressing the Escape key to close it
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

function go(page){
		
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
		$(".titulo-pagina").html("<strong>Utilizadores</strong>");

		//$( "#mainpage2" ).load( "/listaprodutos" );
		$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
		
		$( "#mainpage" ).load( "/utils/listautils", function() {
			  //alert( "Load was performed." );
			});
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
	
</script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

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
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Configurações</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="#" onclick="goUtils()">Utilizadores</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Gestão</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
<!--                         <h6 class="collapse-header">Custom Utilities:</h6> -->
                        <a class="collapse-item" href="#" onclick="go(1)">Produtos 1</a>
                        <a class="collapse-item" href="#" onclick="go(2)">Produtos 2</a>
                        <a class="collapse-item" href="#" onclick="go(3)">Produtos 3</a>
                        <a class="collapse-item" href="#" onclick="go(4)">Contactos 1</a>
                        <a class="collapse-item" href="#" onclick="go(5)">Contactos 2</a>
                    </div>
                </div>
            </li>

            <!-- Heading -->
            <!-- div class="sidebar-heading">
                Addons
            </div -->

 
            <!-- 
            <div id="jquery-accordion-menu" class="jquery-accordion-menu">
				<div class="jquery-accordion-menu-header">Header </div>
				<ul>
					<li class="active"><a href="#"><i class="fa fa-home"></i>Home </a></li>
					<li><a href="#"><i class="fa fa-glass"></i>Events </a></li>
					<li><a href="#"><i class="fa fa-file-image-o"></i>Gallery </a><span class="jquery-accordion-menu-label">12 </span></li>
					<li><a href="#"><i class="fa fa-cog"></i>Services </a>
					<ul class="submenu">
							<li><a href="#">
							Web Design </a></li>
							<li><a href="#">Hosting </a></li>
							<li><a href="#">Design </a>
								<ul class="submenu">
									<li><a href="#">Graphics </a></li>
									<li><a href="#">Vectors </a></li>
									<li><a href="#">Photoshop </a></li>
									<li><a href="#">Fonts </a></li>
								</ul>
							</li>
							<li><a href="#">Consulting </a></li>
						</ul>
					</li>
					
					<li><a href="#"><i class="fa fa-newspaper-o"></i>News </a></li>
					<li><a href="#"><i class="fa fa-suitcase"></i>Portfolio </a>
						<ul class="submenu">
							<li><a href="#">Web Design </a></li>
							<li><a href="#">Graphics </a><span class="jquery-accordion-menu-label">10 </span></li>
							<li><a href="#">Photoshop </a></li>
							<li><a href="#">Programming </a></li>
						</ul>
					</li>
					<li><a href="#"><i class="fa fa-user"></i>About </a></li>
					<li><a href="#"><i class="fa fa-envelope"></i>Contact </a></li>
				</ul>
				<div class="jquery-accordion-menu-footer">Footer </div>
			</div>
            
 -->


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
									<!-- li>
											<h3><a href="#"><i class="fa fa-lg fa-tachometer"></i>Dashboard</a></h3>
											<ul>
													<li><a href="#">Reports</a></li>
													<li><a href="#">Search</a></li>
													<li><a href="#">Graphs</a></li>
													<li><a href="#">Settings</a></li>
											</ul>
									</li -->



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




									<!-- li>
											<h3><a href="#"><i class="fa fa-lg fa-tasks"></i>Tasks (active)</a></h3>
											<ul>
													<li><a href="#">Today's tasks</a></li>
													<li class="active">
															<a href="#">DrillDown (active)</a>
															<ul>
																	<li><a href="#">Today's tasks</a></li>
																	<li><a href="#">Urgent</a></li>
																	<li>
																			<a href="#">Overdues</a>
																			<ul>
																					<li><a href="#">Today's tasks</a></li>
																					<li><a href="#">Urgent</a></li>
																					<li><a href="#">Overdues</a></li>
																					<li><a href="#">Recurring</a></li>
																					<li><a href="#">Settings</a></li>
																			</ul>
																	</li>
																	<li><a href="#">Recurring</a></li>
																	<li><a href="#">Settings</a></li>
															</ul>
													</li>
													<li>
															<a href="#">Overdues</a>
															<ul>
																	<li><a href="#">Today's tasks</a></li>
																	<li><a href="#">Urgent</a></li>
																	<li><a href="#">Overdues</a></li>
																	<li><a href="#">Recurring</a></li>
																	<li><a href="#">Settings</a></li>
															</ul>
													</li>
													<li><a href="#">Recurring</a></li>
													<li><a href="#">Settings</a></li>
											</ul>
									</li>
									<li>
											<h3><a href="#"><i class="fa fa-lg fa-calendar"></i></span>Calendar</a></h3>
											<ul>
													<li><a href="#">Current Month</a></li>
													<li><a href="#">Current Week</a></li>
													<li><a href="#">Previous Month</a></li>
													<li><a href="#">Previous Week</a></li>
													<li><a href="#">Next Month</a></li>
													<li><a href="#">Next Week</a></li>
													<li><a href="#">Team Calendar</a></li>
													<li><a href="#">Private Calendar</a></li>
													<li><a href="#">Settings</a></li>
											</ul>
									</li>
									<li>
											<h3><a href="#"><i class="fa fa-lg fa-heart"></i>Favourites</a></h3>
											<ul>
													<li><a href="#">Global favs</a></li>
													<li><a href="#">My favs</a></li>
													<li><a href="#">Team favs</a></li>
													<li><a href="#">Settings</a></li>
											</ul>
									</li -->
							</ul>
					</div>

	</div>
                </div>
            </li>



            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3"
                    aria-expanded="true" aria-controls="collapsePages3">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Menu 2</span>
                </a>
                <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    
                   
                   
                   
    <nav class="nav" role="navigation">
    <ul class="nav__list">
              
                   
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
				<c:when test="m.idPai == null">
			<li>
	        <input id="group-1${i.count}" type="checkbox" hidden />
	        <label for="group-1${i.count}"><span class="fa fa-angle-right"></span> ${m.descricao} </label>
	        <ul class="group-list">
				
				</c:when>
				<c:otherwise>
				
				<li>
            <input id="sub-group-1${i.count}" type="checkbox" hidden />
            <label for="sub-group-1${i.count}"><span class="fa fa-angle-right"></span> ${m.descricao} </label>
            <ul class="sub-group-list">
            
				</c:otherwise>
			</c:choose>
		
		


			<c:if test="${m.idPai == idpai && !m.link}">
				<c:set var="fecharTriploNivel" value="true"/>
			</c:if>
			

			<c:set var="idpai" value="${m.id}"/>
			
			<c:set var="ulAberto" value="true"/>
			
			
		</c:when>
		<c:otherwise>
	    		<li> <a href="#" onclick="goPage(0, ${m.id})"> ${m.descricao} 
	    		
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
                   
                   
                   
                   
                   
                    
<!--                     
<nav class="nav" role="navigation">
    <ul class="nav__list">
      <li>
        <input id="group-1" type="checkbox" hidden />
        <label for="group-1"><span class="fa fa-angle-right"></span> First level</label>
        <ul class="group-list">
          <li><a href="#">1st level item</a></li>
          <li>
            <input id="sub-group-1" type="checkbox" hidden />
            <label for="sub-group-1"><span class="fa fa-angle-right"></span> Second level</label>
            <ul class="sub-group-list">
              <li><a href="#">2nd level nav item</a></li>
              <li><a href="#">2nd level nav item</a></li>
              <li><a href="#">2nd level nav item</a></li>
              <li>
                <input id="sub-sub-group-1" type="checkbox" hidden />
                <label for="sub-sub-group-1"><span class="fa fa-angle-right"></span> Third level</label>
                <ul class="sub-sub-group-list">
                  <li><a href="#">3rd level nav item</a></li>
                  <li><a href="#">3rd level nav item</a></li>
                  <li><a href="#">3rd level nav item</a></li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      </li>
      <li>
      <input id="group-2" type="checkbox" hidden />
      <label for="group-2"><span class="fa fa-angle-right"></span> First level</label>
      <ul class="group-list">
        <li>
        <li><a href="#">1st level item</a></li>
        <li><a href="#">1st level item</a></li>
        <input id="sub-group-2" type="checkbox" hidden />
        <label for="sub-group-2"><span class="fa fa-angle-right"></span> Second level</label>
        <ul class="sub-group-list">
          <li><a href="#">2nd level nav item</a></li>
          <li><a href="#">2nd level nav item</a></li>
          <li>
            <input id="sub-sub-group-2" type="checkbox" hidden />
            <label for="sub-sub-group-2"><span class="fa fa-angle-right"></span> Third level</label>
            <ul class="sub-sub-group-list">
              <li><a href="#">3rd level nav item</a></li>
            </ul>
          </li>
        </ul>
        </li>
      </ul>
      </li>
      <li>
      <input id="group-3" type="checkbox" hidden />
      <label for="group-3"><span class="fa fa-angle-right"></span> First level</label>
      <ul class="group-list">
        <li>
        <li><a href="#">1st level item</a></li>
        <li><a href="#">1st level item</a></li>
        <input id="sub-group-3" type="checkbox" hidden />
        <label for="sub-group-3"><span class="fa fa-angle-right"></span> Second level</label>
        <ul class="sub-group-list">
          <li><a href="#">2nd level nav item</a></li>
          <li><a href="#">2nd level nav item</a></li>
          <li><a href="#">2nd level nav item</a></li>
          <li>
            <input id="sub-sub-group-3" type="checkbox" hidden />
            <label for="sub-sub-group-3"><span class="fa fa-angle-right"></span> Third level</label>
            <ul class="sub-sub-group-list">
              <li><a href="#">3rd level nav item</a></li>
              <li><a href="#">3rd level nav item</a></li>
              <li><a href="#">3rd level nav item</a></li>
            </ul>
          </li>
        </ul>
        </li>
      </ul>
      </li>
      <li>
      <input id="group-4" type="checkbox" hidden />
      <label for="group-4"><span class="fa fa-angle-right"></span> First level</label>
      <ul class="group-list">
        <li>
        <li><a href="#">1st level item</a></li>
        <input id="sub-group-4" type="checkbox" hidden />
        <label for="sub-group-4"><span class="fa fa-angle-right"></span> Second level</label>
        <ul class="sub-group-list">
          <li><a href="#">2nd level nav item</a></li>
          <li><a href="#">2nd level nav item</a></li>
        </ul>
        </li>
      </ul>
      </li>
    </ul>
  </nav>
   -->
   

		</div>
            </li>

            
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2"
                    aria-expanded="true" aria-controls="collapsePages2">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Menu 3</span>
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

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="/login.html">Login</a>
                        <a class="collapse-item" href="/register.html">Register</a>
                        <a class="collapse-item" href="/forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="/404.html">404 Page</a>
                        <a class="collapse-item" href="/blank.html">Blank Page</a>
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
            <div class="text-center d-none d-md-inline" style="color: white;padding-top: 100px;">
            	<span style="font-weight: bold;">CONTACTOS </span> <br> <span style="font-size: 10pt">960271478 <br> 252601430</span> <br><br>
            	<span style="font-weight: bold;">HORÁRIO </span> <br> 8:00 - 12:30 <br> 14:00 - 20:00 
            </div>


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

                       
                       
                       
                       <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">${listacontactos.size()}</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Centro de Mensagens
                                </h6>
                                
                                <c:forEach var="cont" items="${listacontactos}" varStatus="i">
                                
                                
                                <c:if test="${i.count < 4}">
                                
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                    	<c:choose>
                                    		<c:when test="${cont.user == null}">
		                                        <img class="rounded-circle" src="/img/undraw_profile_1.svg"
        	                                    alt="...">
                                    		</c:when>
                                    		<c:otherwise>
                                    		    <img class="rounded-circle" src="${cont.user.photo}">
                                    		</c:otherwise>
                                    	</c:choose>
                                    
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">
                                        	${cont.assunto}
                                        </div>
                                        <div class="small text-gray-500">
                                        	${cont.descricao}
                                    	</div>
                                    </div>
                                </a>
                                </c:if>
                                
                                </c:forEach>
                                
                                
                                
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#" onclick="go(4)">Ler mais Mensagens</a>
                            </div>
                        </li>

                        

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
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
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">



    <div class="hero-image">
 		<div class="hero-image-logo">
            
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


 <!-- Content Row -->
 	<div id="mainpage">
 
 
                    <div class="row">
                    
                    
         <c:forEach var="prod" items="${listaprodutos}">
         
         
         
         

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            
                                            <img src="${prod.dadosImagem}" style="border-radius:10px" width="80%">
                                            
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
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${prod.descricao}"/>   </div>
                                        </div>
                                        
                                       <div class="ttt">
					        				<a href="#" onclick="showPopup(<c:out value="${prod.id}"/>)">
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
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2023</span>
                    </div>
                </div>
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
        <button type="button" id="myBtnFechar" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
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
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body-contact"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" onclick="create()">Enviar</button>
                    <a class="btn btn-primary" href="#" onclick="cancelarContacto()" id="closeModalContact">Sair</a>
                </div>
            </div>
        </div>
    </div>
    
    

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

<!--     Page level plugins -->
<!--     <script src="/vendor/chart.js/Chart.min.js"></script> -->

<!--     Page level custom scripts -->
<!--     <script src="/js/demo/chart-area-demo.js"></script> -->
<!--     <script src="/js/demo/chart-pie-demo.js"></script> -->

</body>

</html>