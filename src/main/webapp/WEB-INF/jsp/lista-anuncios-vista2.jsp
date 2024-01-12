<%@page import="com.example.teste3.models.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


             
    <div class="row" style="padding-left:20px;padding-right:20px">
	  
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
<%-- 				        				<img src="${prod.dadosImagem}" class="img-fluid"/> --%>
				        				<c:choose>
                                   	<c:when test="${prod.thumbnailImage != null}">
                                   		<img src="${prod.thumbnailImage}" style="border-radius:10px" width="80%">	
                                   	</c:when>
                                   	<c:otherwise>
                                   		<img src="${prod.dadosImagem}" style="border-radius:10px" width="80%">
                                   	</c:otherwise>
                                   </c:choose>
                                   
				        			</div>
			        			</div>
	        				</div>
	        			</div>
	        			<div class="card-footer">
	        				<div class="product-entry-actions-h" style="text-align: right">
				            	
				            		<a href="#${prod.id}" onclick="showPopup(<c:out value="${prod.id}"/>)">
				            			<img data-toggle="modal" data-target="#myModal" alt="Foto" src="/img/pesq3.png" width="40">
				            		</a>
			            	</div>
	        			</div>

        			</div>
        		</div>
        		<div class="col-sm-6">
        			<div class="product-details text-left">
	        			<div class="row">
	        				<div class="col-sm-6" style="text-align: left">
	        					<dl>
	        						<dt>REFERÊNCIA</dt>
	        						<dd>${prod.referencia}</dd>
	        					</dl>
	        				</div>
	        				<div class="col-sm-12" style="text-align: left">${prod.name}</div>
	        				<div class="col-sm-12" style="text-align: left">${prod.descricao}</div>
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
						

			 