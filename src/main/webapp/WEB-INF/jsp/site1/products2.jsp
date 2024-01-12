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


</head>

<body id="page-top">



<div class="container my-2">
    <div class="card">
    <div class="card-body">
        <div class="container my-5">
            <p class="my-5">
                <a href="/edit" class="btn btn-primary">
                <i class="fas fa-user-plus ml-2"> Add Product </i></a>
            </p>
            <div class="col-md-10">
                <!-- h2 th:case="null">No record found !!</h2 -->
                
                
                
                <div>
                    <table class="table table-striped table-responsive-md">
                        <thead>
                                <tr>
                                        	<th>Imagem</th>
                                            <th>Name</th>
                                            <th>Referência</th>
                                            <th>Novidade</th>
                                            <th>Tipo</th>
                                            <th>Data</th>
                                            <th>Activo</th>
                                            <th>Edit</th>
                               				<th>Delete</th>
                                        </tr>
                        </thead>
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
                                    <a href="${p.id}" class="btn btn-primary">
                                        <i class="fas fa-user-edit ml-2"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="${p.id}" class="btn btn-primary">
                                        <i class="fas fa-user-times ml-2"></i>
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
    </div>
    </div>
    
    
</body>

</html>