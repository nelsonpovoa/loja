<%@page import="com.example.teste3.models.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


    <div class="row" <c:if test="${vista>0}"> style="padding-left:20px;padding-right:20px;padding-top: 20px" </c:if> > 
    <c:choose>
    	<c:when test="${listaprodutos.size() >0}">
    	
    		<c:forEach var="prod" items="${listaprodutos}">
        

               <!-- Earnings (Monthly) Card Example -->
               <div class="col-xl-3 col-md-6 mb-4">
                   <div class="card border-left-primary shadow h-100 py-2" id="${prod.id}">
                       <div class="card-body">
                           <div class="row no-gutters align-items-center">
                               <div class="col mr-2">
                                   <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                   
                                   <c:choose>
                                   	<c:when test="${prod.thumbnailImage != null}">
                                   		<img src="${prod.thumbnailImage}" style="border-radius:10px" width="80%">	
                                   	</c:when>
                                   	<c:otherwise>
                                   		<img src="${prod.dadosImagem}" style="border-radius:10px" width="80%">
                                   	</c:otherwise>
                                   </c:choose>
                                   
                                   
					                <table width="100%" border="0">
					            		<tr>
					            			<td style="text-align: left;padding-top: 10px">
					            			<span style="font-weight: bold;">REFERENCIA:</span> &nbsp; <c:out value="${prod.referencia}"/>	
					            			</td>
					            		</tr>
					
					            		<tr>
					            			<td>
									             ${prod.name}			
					            			</td>
					            		</tr>
					            	</table>
				       	
				       	
                                   </div>
                                   <div class="h5 mb-0 font-weight-bold text-gray-800" style="text-align: left; text-align: justify;text-justify: inter-word;"><c:out value="${prod.descricao}"/>   </div>
                               </div>
                             </div>
                       </div>
                             
	                   <div class="card-footer " style="text-align: right">
	                   		<div class="row">
	                   			<div class="col-6" style="text-align: left">
	                   			
		                   			<dl style="font-style: italic;color: #6699cc;font-size: 14px">
			       						<dt>Publicado</dt>
			       						<dd>${prod.dataCriacao.format( DateTimeFormatter.ofPattern("dd.MM.yyyy"))}</dd>
			       					</dl>
	                   			</div>
	                   			
	                   			<div class="col-6">
		                   			<a href="#${prod.id}" onclick="showPopup(<c:out value="${prod.id}"/>)">
					         			<img data-toggle="modal" data-target="#myModal" alt="Foto" src="/img/pesq4.png" width="50">
					         		</a>
	                   			</div>
	                   		</div>

		    			</div>
                               
                    </div>
                </div>	

   
			</c:forEach>
    	
    	
    	</c:when>
    	<c:otherwise>
    	
    		<style>
    			  
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
		text-align: center;
     }
    		
    		</style>
    	
    		<div class="col-12">
    		
    			
			<div id="divAlert" class="divAlert" style="display: none">
			</div>
	
    		<p style="text-align: center;">
    		Sem resultados
    		</p>
    		</div>
    		
    		<script type="text/javascript">
	    		$('#divAlert').html("Sem resultados!");
	      		$('#divAlert').css('display','block');
	      		setTimeout(function() {
	      			$('#divAlert').css('display','none');
		        }, 3000);
    		</script>
    		
    		
	    		        
	    		        
    	</c:otherwise>
    </c:choose>                
         
						
			 </div>		

			 
			 