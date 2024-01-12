<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Produtos</title>

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


<script src="/webjars/jquery/3.6.4/jquery.min.js"></script>


<script type="text/javascript">

function editAd(id){
	
	//loadDialog('/editAd/'+id, 1000);
	
	$("#exampleModalCenterTitle").html("Alterar Anúncio");
	$('.modal-body').html("");
	
	//$('#myModal').modal(options)
	//alert(1)
	//$(document).ready(function() {
//		  $('#myModal').on('shown.bs.modal', function() {
    $.ajax({
      url: '/editAd2/'+id,
      type: 'GET',
      success: function(response) {
        $('.modal-body').html(response);
        
        //$('#myModal').modal('show');
      }
    });


/*    
    $('#myModal').modal({
        backdrop: 'static'  // This prevents clicking outside the modal to close it
        //keyboard: false      // This prevents pressing the Escape key to close it
      });  
  */
  
    $('#myModal').modal('show');
	
}

function criaAnuncioModalBS(){
	$('#exampleModalCenterTitle2').html("Novo Anúncio");
	$('.modal-body2').html("");
	//alert(1111)
	
	$.ajax({
        url: '/createAd2',
        type: 'GET',
        success: function(response) {
      	  //alert(response)
        
          $('.modal-body2').html(response);
          
          //$('#myModal').modal('show');
        }
      });

	$('#myModal2').modal({
        backdrop: 'static'  // This prevents clicking outside the modal to close it
        //keyboard: false      // This prevents pressing the Escape key to close it
      });
	
	$("#myModal2").modal('show');
}


</script>

</head>

<body id="page-top">


<!-- Modal -->
<div class="modal fade modal-resizable" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle2">Anúncio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body2">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
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
		<button onclick="criaAnuncioModalBS()" class="btn btn-primary" style="border-radius: 10px"> &nbsp;&nbsp; Novo Anúncio &nbsp;&nbsp; </button>
		
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Abrir Modal</button>

	</div>
	
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>Imagem</th>
                                            <th>Name</th>
                                            <th>Referência</th>
                                            <th>Novidade</th>
                                            <th>Tipo</th>
                                            <th>Data</th>
                                            <th>Activo</th>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>Imagem</th>
                                            <th>Name</th>
                                            <th>Referência</th>
                                            <th>Novidade</th>
                                            <th>Tipo</th>
                                            <th>Data</th>
                                            <th>Activo</th>
                                            <td></td>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    
                                    
                                    <c:forEach var="p" items="${listaprods}" varStatus="i">
                                    
                                        <tr>
                                            <td style="text-align: center;"><img src="${p.dadosImagem}" width="60px"></td>
                                            <td>${p.name}</td>
                                            <td>${p.referencia}</td>
                                            <td>${p.novidade}</td>
                                            <td>${p.tipo.description}</td>
                                            <td>${p.dataCriacao.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))} </td>
                                            <td>${p.activo}</td>
                                            <td> 
                                            	<a href="#" onclick="editAd(<c:out value="${p.id}"/>)">
	            									<img data-toggle="modal" data-target="#myModal" alt="Editar Anuncio" src="/img/edit.png" width="40">
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

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
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
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
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

    <!-- Page level plugins -->
    <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/demo/datatables-demo.js"></script>

</body>

</html>