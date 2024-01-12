<%@page import="com.example.teste3.models.Menu"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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

    <title>Produtos</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
    integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" /> -->

<!-- <link href="/menu13/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" /> -->

<!-- coloca a tabela bem, mas desformata o menu -->
<!-- <link href="/css/sb-admin-2.min.css" rel="stylesheet">  -->

<link href="/css/jquery.multiselect.css" rel="stylesheet">


<style type="text/css">

	.navbar {
	  padding: 0 10px;
	}
	
	*.icon-dark {
	  color: grey;
	}
	
	.message {
	  position: absolute;
	  top: 40px;
	  right:5px;
	}
	
	.search {
	  position: relative;
	}
	
	.search input {
	  text-indent: 25px;
	  border: 2px solid #d6d4d4;
	}
	
	.search select {
	  text-indent: 25px;
	  border: 2px solid #d6d4d4;
	  width: 100%;
	}
	
	.search input:focus {
	  box-shadow: none;
	  border: 1px solid grey;
	}
	
	.search .fa-search {
	  position: absolute;
	  top: 12px;
	  left: 10px;
	}
	
	.search button#btn1 {
	  position: absolute;
	  top: 0px;
	  right: 0px;
	  width: 95px;
	  /*background: grey;*/
	}
	
	.size-select {
	  width: 60px;
	  color: #495057;
	  vertical-align: middle;
	  padding: 6px 12px;
	  border: 1px solid #ced4da;
	  border-radius: 0.25rem;
	}
	
	.input-group-text {
	    display: flex;
	    align-items: center;
	    padding: 0.375rem 0.75rem;
	    margin-bottom: 0;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #6e707e;
	    text-align: center;
	    white-space: nowrap;
	    background-color: #eaecf4;
	    border: 1px solid #d1d3e2;
	    border-radius: 0.35rem;
	}
	
	.table .thead-light th {
	    color: #6e707e;
	    background-color: #eaecf4;
	    border-color: #e3e6f0;
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
     
     .btn-delete2{
     }
     
     .divAlert{
		position: sticky;
		top: 50%;
		left: 50%;
		width: 200px;
		height: 100px;
		transform: translate(-50%, -50%);
		background: url('/img/spinners/spinner.gif') no-repeat center center / 45px; 
		z-index: 9999 !important;
		background-color: white;
		border-radius: 10px;
		border: 1px solid black;
		box-shadow: 0 0 18px rgba(82,168,236,.6) !important;
		
     }
</style>

<!--   <script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script> -->
<!--   <script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script> -->
<!--   <script type="text/javascript" src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
  
  
<!--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
   
   	<script src="/js/jquery.multiselect.js"></script>

<!-- <script src="/webjars/jquery/3.6.4/jquery.min.js"></script> -->

<script type="text/javascript">
	var idAd;
	var nameAd;

	function apagar(id, titulo) {
		alert('delete id: '+idAd);
	}

	function edit(id) {
		
		//$("#exampleModalCenterTitle").html("Novo Contacto");
    	$('.modal-body-edit').html("");
    	//alert(1111)
    	
    	$.ajax({
            url: '/products/editAd/'+id,
            type: 'GET',
            success: function(response) {
          	  //alert(response)
            
              $('.modal-body-edit').html(response);
              
              //$('#myModal').modal('show');
            }
          });

    	$('#editModal').modal({
            backdrop: 'static'  // This prevents clicking outside the modal to close it
            //keyboard: false      // This prevents pressing the Escape key to close it
          });
    	
		$("#editModal").modal('show');
	}


    $(document).ready(function () {
    	 $('#yesBtn').click(function() {
         	apagar(idAd, "");
         });
    	 
    	 $('#btCancelarEditModal').click(function() {
    		 $('#editModal').modal('hide');
          });
    	 
    	 
      $(".btn-delete").on("click", function (e) {
    	 // alert("btn-delete");
        e.preventDefault();
        link = $(this);

        idAd = link.attr("idAd");
        nameAd = link.attr("nameAd");
        //alert(idAd+' name: '+nameAd)
        
        //$("#yesBtn").attr("href", link.attr("href"));

       
        	
        
        $("#confirmText").html("Deseja eliminar o anuncio número  \<strong\>" + idAd + "\<\/strong\> com descrição "+nameAd+"?");
        
        $("#confirmModal").modal();
      });

      $(".btn-delete2").on("click", function (e) {
    	 // alert("btn-delete2");
        e.preventDefault();
        link = $(this);

        idAd = link.attr("idAd");
        nameAd = link.attr("nameAd");
        //alert(idAd+' name: '+nameAd)
        
        //$("#yesBtn").attr("href", link.attr("href"));
        
        $("#confirmText").html("Deseja eliminar o anuncio número \<strong\>" + idAd + "\<\/strong\> com descrição "+nameAd+"?");
        
        $("#confirmModal").modal();
      });
      
      $("#btnClear").on("click", function (e) {
        e.preventDefault();
        $("#name").text("");
        $("#name").val("");
        goPageProd(1);
        //window.location = "/listaprodutos3";
      });
    });
    
    function goSearch(){
    	var name = $("#name").val();
    	var categorias = $('select#multipleSelect').val()
    	//alert(categorias)
    	var pageSize = $("#pageSize").val();
    	
    	$( "#mainpage" ).load("/products/listaprodutos3?size="+pageSize+
    			"&name="+name+
    			(categorias.length>0 ? "&categorias="+categorias : ""), function() {
			  //alert( "Load was performed." );
			});
    }

    function changePageSize() {
      //$("#searchForm").submit();
    	var pageSize = $("#pageSize").val();
    	var name = $("#name").val();
    	
    	var categorias = $('select#multipleSelect').val()
    	
    	$( "#mainpage" ).load("/products/listaprodutos3?size="+pageSize+
    			(name.length >0 ? "&name="+name : ""+
    			(categorias.length>0 ? "&categorias="+categorias : "")), function() {
			  //alert( "Load was performed." );
			});
    }
    
	function goPageProd(page, _evt){
		//$( "#mainpage2" ).load( "/listaprodutos" );
		//$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
		
    	if(_evt && _evt.preventDefault){
			_evt.preventDefault();
		}

		var pageSize = $("#pageSize").val();
		var name = $("#name").val();
		var categorias = $('select#multipleSelect').val()
		
		var pagina = "/products/listaprodutos3?page="+page+"&size="+pageSize+
				(name.length >0 ? "&name="+name : "")+
				(categorias.length>0 ? "&categorias="+categorias : "");
		//alert(pagina)
		$( "#mainpage" ).load( pagina, function() {
			  //alert( "Load was performed." );
			});
	}	
	
	
	function criaAnuncioModalBS(){
		$('#tituloModal').html("Novo Anúncio");
    	$('.modal-body-edit').html("");
    	//alert(1111)
    	
    	$.ajax({
            url: '/createAd2',
            type: 'GET',
            success: function(response) {
          	  //alert(response)
            
              $('.modal-body-edit').html(response);
              
              setTimeout(function() {
		        	$("#namead").focus();
		        }, 1000);
              
          	  
              //$('#myModal').modal('show');
            }
          });

    	$('#editModal').modal({
            backdrop: 'static'  // This prevents clicking outside the modal to close it
            //keyboard: false      // This prevents pressing the Escape key to close it
          });
    	
		$("#editModal").modal('show');
    }
	
	function activaDesactiva(check, id, valor){
		//alert(valor)
		if (check == 1){ // atualizar campo novidade
			$.ajax({
	            url: '/products/atualizaNovidade/'+id+'/'+valor,
	            type: 'GET',
	            success: function(response) {
	          	  //alert(response)
	            	if (response){
	              		$('#divAlert').html("Produto Actualizado com sucesso.");
	              		$('#divAlert').css('display','block');
	              		setTimeout(function() {
	              			$('#divAlert').css('display','none');
	    		        }, 3000);
	            	}
	              //$('#myModal').modal('show');
	            }
	          });
		}else { // atualizar campo activo
			$.ajax({
	            url: '/products/atualizaActivo/'+id+'/'+valor,
	            type: 'GET',
	            success: function(response) {
	          	  //alert(response)
	            
	            	if (response){
	            		$('#divAlert').html("Produto Actualizado com sucesso.");
	              		$('#divAlert').css('display','block');
	              		setTimeout(function() {
	              			$('#divAlert').css('display','none');
	    		        }, 3000);
	            	}
	              
	              //$('#myModal').modal('show');
	            }
	          });
		}
	}
  </script>
  
</head>

<body id="page-top">


<!-- header>
  <nav class="navbar navbar-expand-md bg-dark navbar-dark">
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#topNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="topNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Tutorials</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/products3/new">Add</a>
        </li>
      </ul>
    </div>
  </nav>
</header -->


<div id="divAlert" class="divAlert" style="display: none">
</div>

  <div class="container-fluid" style="max-width: 99%; margin: 0 auto;">

	<div style="text-align: right;font-size: 30px">
		<button onclick="criaAnuncioModalBS()" class="btn btn-primary" style="border-radius: 10px"> &nbsp;&nbsp; Novo Anúncio &nbsp;&nbsp; </button>
		
		<!-- button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Abrir Modal</button -->
		
	</div>

	<c:if test="${message != null}">

    <div class="alert alert-success alert-dismissible fade show text-center message"
      role="alert">
      	${message}
      <button type="button" class="close btn-sm" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    
    </c:if>
    

    <div class="my-3">
      
        <div class="row d-flex">
          <div class="col-md-8 col-lg-8 mt-2">
          
          
            <div class="search" style="display:block;">
            
            	<div style="float: left;width: 400px">
	              <i class="fa fa-search"></i>
	              <input id="name" type="search" name="name" value="${name}" class="form-control"
	                placeholder="Nome a pesquisar">
                </div>
                
                <div style="float: left;width: 700px">
                
                <select id="multipleSelect" multiple="multiple" name="subTipo[]"  class="form-control 2col active" >
				<!-- <option value=""> - Selecione - </option> -->
				
				<c:set var="idpai" value="0"/>
				<c:set var="descricao" value=""/>
				 <c:forEach var="m" items="${menu}" varStatus="i">
				       
				       <%
				       	//System.out.println("entrei!!!!");
				       %>
				       
				       <c:if test="${m.idPai != idpai and i.count > 1}">
				       		</optgroup>
				       		
				       </c:if>
				       
				       <c:choose>
				       <c:when test="${(m.id == 3 || m.id == 4) && !m.link}">
				       <c:set var="descricao" value="${m.descricao}"/>
				       </c:when>
				       <c:when test="${(m.idPai == null) || m.id == 30 || m.id == 40 || m.id == 50 || m.id == 60}">
				       
				       		<%
				       			String desc = (String)pageContext.getAttribute("descricao");
				       			if (desc != null && desc.length()>0) {
				       		%>
				       			<optgroup label="${descricao} - ${m.descricao}">
				       		<% } else { %>
				       			<optgroup label="${m.descricao}">
				       		<% } %>
				       		
				       		
				       		
				       		<c:if test="${m.idPai != idpai }">
				       			<c:set var="descricao" value=""/>
				       		</c:if>
				       		
				       		
				       </c:when>
				       <c:otherwise>
				       
				       		<%
				       			boolean existe = false;
				       			String categorias = (String)request.getAttribute("categorias");
				       			Menu m = (Menu)pageContext.getAttribute("m");
				       			if (categorias != null && categorias.length()>0){
				       				if (categorias.contains(""+m.getId())){
				       					existe = true;
				       				}
				       			}
				       			pageContext.setAttribute("existe", existe);
				       			//System.out.println("categorias: "+categorias);
				       			//System.out.println("m.id: "+m.getId()+" existe: "+existe);
				       			
				       		%>
				       
				       		<option value="${m.id}" <c:if test="${existe}">selected</c:if>>${m.descricao}</option>
				       </c:otherwise>
				       </c:choose>
				       
				       	
				 </c:forEach>    
				 
				
				    </select>
				    
				    
				    <script>
				$('select[multiple]').multiselect({
				    columns: 3,
				    placeholder: ' - Selecione Categoria - '
				});
				</script>
				
				</div>
				
				<div>
				
				
                
              <button id="btn1" type="button" class="btn btn-primary" onclick="goSearch();">Procurar</button>
              
              </div>
            </div>
          </div>
          <div class="col-md-4 col-lg-4 input-group mt-2">
<!--           	<div class="row"> -->
<!--           		<div class="col-md-12 col-lg-12" style="border:1px solid blue"> -->
				            <div class="input-group-prepend">
				              <label class="input-group-text" for="pageSize">Resultados por Página:</label>
				            </div>
				            
				            <div>
				            <select form="searchForm" name="size" value="${pageSize}" onchange="changePageSize()" class="size-select"
				              id="pageSize">
				
								<c:forEach items="${ listaPageSize}" var="ps">
								<option value="${ps}" <c:if test="${ps == pageSize }"> selected="selected" </c:if>>${ps}</option>
								</c:forEach>
				              
				            </select>
				            </div>
				            <div style="padding-left: 50px">
				            <button id="btnClear" class="btn btn-info">Limpar</button>
				            </div>
				            
	
								
					
				
			
<!--             			</div> -->
            			
<!--             		</div> -->
            		
            		
            		</div>		
            	</div> <!-- row -->	
            	
            	
            	
            		
          </div>
<!--           <div class="col-md-1 mt-2"> -->
            
<!--           </div> -->
        </div>
      
    </div>

    <div th:if="${listaprods.size() > 0}">
      <table class="table table-hover table-responsive-xl">
        <thead class="thead-light">
          <tr>
          	<th scope="col">Id</th>
            <th scope="col">Imagem</th>
            <th scope="col">Name</th>
            <th scope="col">Referência</th>
            <th scope="col">Novidade</th>
            <th scope="col">Tipo</th>
            <th scope="col">Data</th>
            <th scope="col">Activo</th>
            <th scope="col">Actions</th>
            <th scope="col">Actions 2</th>
            		
          </tr>
        </thead>
        <tbody>
<%--           <tr th:each="tutorial : ${tutorials}"> --%>
          
          
          <c:forEach var="p" items="${listaprods}" varStatus="i">
                        	
               <tr>
               	   <td>${p.id}</td>
                   <td style="text-align: center;"><img src="${p.thumbnailImage}" width="80px"></td>
                    <td>${p.name}</td>
                    <td>${p.referencia}</td>
                    <td>
                    	<input class="form-check-input" style="width: 30px;height: 30px" type="checkbox" id="checkNovidade" <c:if test="${p.novidade}">checked</c:if> onclick="activaDesactiva(1, ${p.id}, this.checked)">
                    	
                    </td>
                    <td>${p.tipo.description}</td>
                    <td>${p.dataCriacao.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))} </td>
                    <td>
                    	<input class="form-check-input" style="width: 30px;height: 30px" type="checkbox" id="checkActivo" <c:if test="${p.activo}">checked</c:if> onclick="activaDesactiva(1, ${p.id}, this.checked)">
                    </td>
                   <td id="td1_${p.id}">
                       <a href="#td1_${p.id}" onclick="edit(${p.id})" class="btn btn-primary" title="Editar este registo">
                           <i class="fas fa-user-edit ml-2"></i>
                       </a>
                   		&nbsp;
                       <a class="btn btn-primary btn-delete2" href="#" onclick="delete(${p.id}, '${p.name}')" idAd="${p.id}" nameAd="${p.name}" title="Apagar este registo">
                           <i class="fas fa-user-times ml-2"></i>
                       </a>
                   </td>
                   
                   <td id="td2_${p.id}">
                   	 <a href="#td2_${p.id}" onclick="edit(${p.id})" title="Editar este registo"
		                class="fa-regular fa-pen-to-square icon-dark"></a>
		              &nbsp;
		              <a href="#" onclick="delete(${p.id}, '${p.name}')" id="btnDelete" idAd="${p.id}" nameAd="${p.name}"
		                title="Apagar este registo" class="fa-regular fa-trash-can icon-dark btn-delete"></a>
                   </td>
                   
               </tr>
               
               
               </c:forEach>
               
                            

        </tbody>
      </table>
    </div>

<c:if test="${listaprods.size() == 0}">
    <div>
      <span>Sem produtos a apresentar!</span>
    </div>
</c:if>


<c:if test="${totalPages > 0}">
	<div>
<%--     <nav aria-label="Pagination" th:if="${totalPages > 0}"> --%>

      <ul class="pagination justify-content-center">
        <li id="li0" class="page-item <c:if test="${currentPage == 1}">disabled </c:if>">
        	
          <a title="Primeira Pagina" href="#li0" <c:if test="${currentPage != 1}">onclick="goPageProd(1, event)"</c:if>>
          	
          <<
          </a>
        </li>
        <li id="li1" class="page-item font-weight-bold <c:if test="${currentPage == 1}">disabled </c:if>">
          <a title="Pagina anterior"  <c:if test="${currentPage != 1}"> href="#li1" onclick="goPageProd(${currentPage - 1}, event)" </c:if>>Anterior</a>
        </li>
        
        <c:if test="${currentPage - 2 > 1}">
        <li id="li2" class="page-item disabled">
          <a class="page-link" href="#li2">...</a>
        </li>
        </c:if>
        
 		<li id="li3" class="page-item <c:if test="${page == currentPage}">active</c:if>"> 
          
          <c:forEach var="page" begin="${currentPage > 2 ? currentPage - 2 : 1}" end="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}">
          
          <a href="#li3" onclick="goPageProd(${page}, event)" title="${page}">	<c:out value="${page}"/> </a>
          </c:forEach>
          
        </li>
        
        <li id="li4 class="page-item <c:if test="${currentPage + 2 < totalPages}">disabled </c:if>">
          <a class="page-link" <c:if test="${currentPage + 2 == totalPages}">href="#li4" </c:if>>...</a>
        </li>
        
<%--         <li class="page-item <c:if test="${currentPage + 2 < totalPages}">disabled </c:if>"> --%>
<!--           <a class="page-link" href="#">...</a> -->
<!--         </li> -->
        
        <li id="li5" class="page-item font-weight-bold <c:if test="${currentPage == totalPages}">disabled</c:if>">
          <a title="Próxima Pagina" <c:if test="${currentPage != totalPages}">href="#li5" onclick="goPageProd(${currentPage +1}, event)"</c:if>>Próximo</a>
        </li>
        
         <li id="li6" class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
          <a title="úlima Pagina" <c:if test="${currentPage != totalPages}">href="#li6" onclick="goPageProd('${totalPages}, event)"</c:if>>
          >>
          </a>
        </li>
        
      </ul>
    </nav>
  </div>
  
  </c:if>
  
  

  <div class="modal fade text-center" id="confirmModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Eliminar registo</h5>
          <button type="button" class="close" data-bs-dismiss="modal">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body">
          <span id="confirmText"></span>
        </div>

        <div class="modal-footer">
          <a type="button" id="yesBtn" class="btn btn-danger">Sim</a>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
        </div>
      </div>
    </div>
  </div>
</div>


  <div class="modal fade modal-resizable text-center" id="editModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="tituloModal">Editar Anúncio</h5>
          <button type="button" class="close" data-bs-dismiss="modal">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body-edit">
          <span id="confirmText"></span>
        </div>

        <div class="modal-footer">
          <a type="button" id="yesBtn" class="btn btn-primary" onclick="return create();">Alterar</a>
          <button id="btCancelarEditModal" type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!--  <footer class="text-center"> -->
<!--   Copyright &copy; Pronto-a-Vestir Heroina -->
<!-- </footer> -->
<br> <br>

  
</body>

</html>
