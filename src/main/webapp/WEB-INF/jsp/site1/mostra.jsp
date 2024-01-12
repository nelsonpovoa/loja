<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%
	System.out.println("PAGINA!!!!");
%>

<!DOCTYPE html>
<html>
<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Foto </title>

    <!-- Custom styles for this template -->
<!--     <link href="/css/sb-admin-2.min.css" rel="stylesheet"> -->
    
</head>

<body>

<div style="overflow: scroll;">
	<img alt="" src="${prod.dadosImagem}" width="100%" >
</div>

</body>

</html>