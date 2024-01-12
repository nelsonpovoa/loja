<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>

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

    <title>Utilizadores</title>

    <!-- Custom fonts for this template -->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
<!--     <link href="/css/sb-admin-2.min.css" rel="stylesheet"> -->
	
<!-- 	<link href="/menu13/css/bootstrap.min.css" rel="stylesheet"> -->


    <!-- Custom styles for this page -->
    <link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style type="text/css">

	.modal-resizable2 .modal-dialog {
        overflow: hidden;
        width: auto !important;
        max-width: 90%;
    }

    .modal-resizable2 .modal-content {
        width: 100%;
        height: 100%;
        overflow: auto;
    }
</style>

<script src="/webjars/jquery/3.6.4/jquery.min.js"></script>


<script type="text/javascript">

function edit(id){
	
	//loadDialog('/editAd/'+id, 1000);
	
	$("#exampleModalCenterTitle3").html("Alterar Utilizador");
	$('.modal-body3').html("");
	
	//$('#myModal').modal(options)
	//alert(1)
	//$(document).ready(function() {
//		  $('#myModal').on('shown.bs.modal', function() {
    $.ajax({
      url: '/utils/edit/'+id,
      type: 'GET',
      success: function(response) {
        $('.modal-body3').html(response);
        
        //$('#myModal').modal('show');
      }
    });


/*    
    $('#myModal').modal({
        backdrop: 'static'  // This prevents clicking outside the modal to close it
        //keyboard: false      // This prevents pressing the Escape key to close it
      });  
  */
  
    $('#myModal3').modal('show');
	
}

function criaUtil(){
	$('#exampleModalCenterTitle3').html("Novo Utilizador");
	$('.modal-body3').html("");
	//alert(1111)
	
	$.ajax({
        url: '/utils/create',
        type: 'GET',
        success: function(response) {
      	  //alert(response)
        
          $('.modal-body3').html(response);
          
          //$('#myModal').modal('show');
        }
      });

	$('#myModal3').modal({
        backdrop: 'static'  // This prevents clicking outside the modal to close it
        //keyboard: false      // This prevents pressing the Escape key to close it
      });
	
	$("#myModal3").modal('show');
}

$(document).ready(function() {
	$('#closeMyModalBtn3').click(function() {
	    $('#myModal3').modal('hide');
	  });
});

</script>

</head>

<body id="page-top">


<!-- Modal -->
<div class="modal fade modal-resizable2" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle3" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle3">Utilizador</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body3 text-center" style="width: 95%;text-align: center">
        ...
      </div>
      <div class="modal-footer">
        <button id="closeMyModalBtn3" type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
        <!-- button type="button" class="btn btn-primary">Save changes</button -->
      </div>
    </div>
  </div>
</div>

    <!-- Page Wrapper -->
    <div id="wrapper">

        

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                

                <!-- Begin Page Content -->
                <div class="container-fluid">
                
	<div style="text-align: right;font-size: 30px;padding-bottom: 20px">
		<button onclick="criaUtil()" class="btn btn-primary" style="border-radius: 10px"> &nbsp;&nbsp; Novo Utilizador &nbsp;&nbsp; </button>
		
<!-- 		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Abrir Modal</button> -->

	</div>
	
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>Imagem</th>
                                            <th>Nome</th>
                                            <th>Apelido</th>
                                            <th>Username</th>
                                            <th>Data</th>
                                            <th>Activo</th>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>Imagem</th>
                                            <th>Nome</th>
                                            <th>Apelido</th>
                                            <th>Username</th>
                                            <th>Data</th>
                                            <th>Activo</th>
                                            <td></td>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    
                                    
                                    <c:forEach var="util" items="${lista}" varStatus="i">
                                    
                                        <tr>
                                            <td style="text-align: center;"><img src="${util.photo}" width="60px"></td>
                                            <td>${util.nome}</td>
                                            <td>${util.apelido}</td>
                                            <td>${util.username}</td>
                                            <td>${util.data.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))} </td>
                                            <td>${util.activo}</td>
                                            <td id="td_${util.id}"> 
                                            	<a href="#td_${util.id}" onclick="edit(<c:out value="${util.id}"/>)">
	            									<img data-toggle="modal" data-target="#myModal" alt="Editar Utilizador" src="/img/edit.png" width="40">
	            								</a> 
	            							</td>
                                        </tr>
                                        
                                     </c:forEach>
                                        
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/demo/datatables-demo.js"></script>

</body>

</html>