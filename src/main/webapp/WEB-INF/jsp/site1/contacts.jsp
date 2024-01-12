<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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

    <title>Contactos</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
    integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" /> -->

<!-- <link href="/menu13/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" /> -->

<!-- coloca a tabela bem, mas desformata o menu -->
<!-- <link href="/css/sb-admin-2.min.css" rel="stylesheet">  -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

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

.search input:focus {
  box-shadow: none;
  border: 1px solid grey;
}

.search .fa-search {
  position: absolute;
  top: 12px;
  left: 10px;
}

.search button {
  position: absolute;
  top: 0px;
  right: 0px;
  width: 80px;
  background: grey;
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
</style>

<!--   <script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script> -->
<!--   <script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script> -->
<!--   <script type="text/javascript" src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
  
  
<!--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
   
   

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
            url: '/contacts/edit/'+id,
            type: 'GET',
            success: function(response) {
          	  //alert(response)
            
              $('.modal-body-edit').html(response);
              
              //$('#myModal').modal('show');
            }
          });

    	/*$('#editModal').modal({
            backdrop: 'static'  // This prevents clicking outside the modal to close it
            //keyboard: false      // This prevents pressing the Escape key to close it
          });
    	*/
    	
		$("#editModal").modal('show');
	}

    $(document).ready(function () {
      $(".btn-delete").on("click", function (e) {
        e.preventDefault();
        link = $(this);

        var idAd = link.attr("idAd");
        var nameAd = link.attr("nameAd");
        //alert(idAd+' name: '+nameAd)
        
        $("#yesBtn").attr("href", link.attr("href"));
        
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
         
         $("#confirmText").html("Deseja eliminar o anuncio número  \<strong\>" + idAd + "\<\/strong\> com descrição "+nameAd+"?");
         
         $("#confirmModal").modal();
       });
      
      $("#btnClear").on("click", function (e) {
        e.preventDefault();
        $("#name").text("");
        $("#name").val("");
        goPage(1);
        //window.location = "/listaprodutos3";
      });
      
		
		$('#closeMyEditModalBtn').click(function() {
		    $('#editModal').modal('hide');
		  });
		

    });
    
    function goSearch(){
    	var name = $("#name").val();
    	var pageSize = $("#pageSize").val();
    	
    	$( "#mainpage" ).load("/contacts/listacontactos?size="+pageSize+"&name="+name, function() {
			  //alert( "Load was performed." );
			});
    }

    function changePageSize() {
      //$("#searchForm").submit();
    	var pageSize = $("#pageSize").val();
    	var name = $("#name").val();
    	
    	$( "#mainpage" ).load("/contacts/listacontactos?size="+pageSize+(name.length >0 ? "&name="+name : ""), function() {
			  //alert( "Load was performed." );
			});
    }
    
	function goPagina(page){
		//$( "#mainpage2" ).load( "/listaprodutos" );
		//$( "#mainpage" ).html("<p style=\"text-align: center\"> <img src=\"/img/progress_bar.gif\"> </p>");
		
		var pageSize = $("#pageSize").val();
		var name = $("#name").val();
		
		var pagina = "/contacts/listacontactos?page="+page+"&size="+pageSize+(name.length >0 ? "&name="+name : "");
		//alert(pagina)
		$( "#mainpage" ).load( pagina, function() {
			  //alert( "Load was performed." );
			});
	}			
  </script>
  
</head>

<body id="page-top">




  <div class="container-fluid" style="max-width: 99%; margin: 0 auto;">

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
          <div class="col-md-6 mt-2">
            <div class="search">
              <i class="fa fa-search"></i>
              <input id="name" type="search" name="name" value="${name}" class="form-control"
                placeholder="Nome a pesquisar">
              <button type="button" class="btn btn-secondary" style="color: white" onclick="goSearch();">Procurar</button>
            </div>
          </div>
          <div class="col-md-3 input-group mt-2">
            <div class="input-group-prepend">
              <label class="input-group-text" for="pageSize">Resultados por Página:</label>
            </div>
            <select form="searchForm" name="size" value="${pageSize}" onchange="changePageSize()" class="size-select"
              id="pageSize">

				<c:forEach items="${ listaPageSize}" var="ps">
				<option value="${ps}" <c:if test="${ps == pageSize }"> selected="selected" </c:if>>${ps}</option>
				</c:forEach>
              
            </select>
          </div>
          <div class="col-md-1 mt-2">
            <button id="btnClear" class="btn btn-info">Limpar</button>
          </div>
        </div>
      
    </div>

    <div th:if="${listacontactos.size() > 0}">
      <table class="table table-hover table-responsive-xl">
        <thead class="thead-light">
          <tr>
          	<th scope="col">Id</th>
            <th scope="col">Nome</th>
            <th scope="col">Assunto</th>
            <th scope="col">Descrição</th>
            <th scope="col">Data</th>
            <th scope="col">Activo</th>
            <th scope="col">Actions</th>
            <th scope="col">Actions 2</th>
            		
          </tr>
        </thead>
        <tbody>

          <c:forEach var="ct" items="${listacontactos}" varStatus="i">
                        	
               <tr>
               	   <td>${ct.id}</td>
                    <td>${ct.nome}</td>
                    <td>${ct.assunto}</td>
                    <td>${ct.descricao}</td>
                    <td>${ct.data.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))} </td>
                    <td>${ct.activo}</td>
                   <td>
                       <a href="#" onclick="edit(${ct.id})" title="Editar este registo" class="btn btn-primary">
                           <i class="fas fa-user-edit ml-2"></i>
                       </a>
                   		&nbsp;
                       <a href="#" class="btn btn-primary btn-delete2" onclick="delete(${ct.id}, '${ct.nome}')" idAd="${ct.id}" nameAd="${ct.nome}"
		                title="Apagar este registo">
                           <i class="fas fa-user-times ml-2"></i>
                       </a>
                   </td>
                   
                   <td>
                   	 <a href="#" onclick="edit(${ct.id})" title="Editar este registo"
		                class="fa-regular fa-pen-to-square icon-dark"></a>
		              &nbsp;
		              <a href="#" onclick="delete(${ct.id}, '${ct.nome}')" id="btnDelete" idAd="${ct.id}" nameAd="${ct.nome}"
		                title="Apagar este registo" class="fa-regular fa-trash-can icon-dark btn-delete"></a>
                   </td>
                   
               </tr>
               
               
               </c:forEach>
               
                            

        </tbody>
      </table>
    </div>

<c:if test="${listacontactos.size() == 0}">
    <div>
      <span>Não existem registos!</span>
    </div>
</c:if>


<c:if test="${totalPages > 0}">
	<div>
<%--     <nav aria-label="Pagination" th:if="${totalPages > 0}"> --%>

      <ul class="pagination justify-content-center">
        <li class="page-item <c:if test="${currentPage == 1}">disabled </c:if>">
          <a title="Primeira Pagina" href="#" onclick="goPagina(1)">
          <<
          </a>
        </li>
        <li class="page-item font-weight-bold <c:if test="${currentPage == 1}">disabled </c:if>">
          <a title="Pagina anterior" href="#" onclick="goPagina(${currentPage - 1})">Prev</a>
        </li>
        <c:if test="${currentPage - 2 > 1}">
        <li class="page-item disabled">
          <a class="page-link" href="#">...</a>
        </li>
        </c:if>
        
 		<li class="page-item <c:if test="${page == currentPage}">active</c:if>"> 
          
          <c:forEach var="page" begin="${currentPage > 2 ? currentPage - 2 : 1}" end="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}">
          
          <a href="#" onclick="goPage(${page})" title="${page}">	<c:out value="${page}"/> </a>
          </c:forEach>
          
        </li>
        
        <li class="page-item <c:if test="${currentPage + 2 < totalPages}">disabled </c:if>">
          <a class="page-link" href="#">...</a>
        </li>
        
        <li class="page-item font-weight-bold <c:if test="${currentPage == totalPages}">disabled</c:if>">
          <a title="Próxima Pagina" href="#" onclick="goPagina(${currentPage +1})">Next</a>
        </li>
        
         <li class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
          <a title="Úlima Pagina" href="#" onclick="goPagina('${totalPages})">
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
          <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body">
          <span id="confirmText"></span>
        </div>

        <div class="modal-footer">
          <a type="button" id="yesBtn" class="btn btn-danger">Yes</a>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
</div>


  <div class="modal fade modal-resizable text-center" id="editModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Ver contacto</h5>
          <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body-edit">
          <span id="confirmText"></span>
        </div>

        <div class="modal-footer">
          <a type="button" id="yesBtn" class="btn btn-primary" onclick="return create();">Alterar</a>
          <button type="button" id="closeMyEditModalBtn" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        </div>
      </div>
    </div>
  </div>
</div>


<br> <br>

  
</body>

</html>
