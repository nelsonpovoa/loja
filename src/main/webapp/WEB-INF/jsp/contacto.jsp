<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>

<%@ page import="java.time.format.DateTimeFormatter" %>

    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/string-1.1" prefix="str"%>

<%
	System.out.println("contacto !!");
%>
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link type="text/css" href="/ckeditor5-build-classic38/sample/css/sample.css" rel="stylesheet" media="screen" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">


<style>

        
</style>




	<div style="text-align: center;width: 97%">

		<div class="container" style="text-align: center;margin: auto;">
			<c:if test="${contactoPAi.user != null && contactoPAi.user.photo != null}">
			<div class="row" style="padding-bottom: 20px; text-align: right;">
				<div class="col-sm-12" style="text-align: right: ;">
					<img alt="" src="${contactoPAi.user.photo}" style="width: 100px;border-radius: 10px">
				</div>
			</div>
			</c:if>
			
			<div class="row" style="padding-bottom: 20px">
				<div class="col-sm-6" style="text-align: left;">
					<label>Nome</label>
					<input class="form-control" type="text" id="name" name="name" value="${contactoPAi.nome}" disabled="disabled">
				</div>
				<div class="col-sm-6" style="text-align: left;">
					<label>Email</label>
					<input class="form-control" type="text" id="email" name="email" value="${contactoPAi.email}" disabled="disabled">
				</div>

			</div>
			


<div class="accordion" id="accordionPanelsStayOpenExample">

<!-- Primeiro contacto -->
  <div class="accordion-item">
    <h2 class="accordion-header">
		<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse0" aria-expanded="false" aria-controls="panelsStayOpen-collapse0">
    	<div class="row" style="width: 100%">
    		<div class="col-sm-6">
				${contactoPAi.assunto}
   	      </div>
	      <div class="col-sm-6" style="text-align: right;padding-right: 20px">
	      	
	      	${contactoPAi.data.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))}
	      </div>
      	</div>
		</button>
		
    </h2>
    <div id="panelsStayOpen-collapse0" class="accordion-collapse collapse">
      <div class="accordion-body">
        ${contactoPAi.descricao}
      </div>
    </div>
  </div>


<c:forEach var="item" items="${contactos}" varStatus="i">

  <div class="accordion-item">
    <h2 class="accordion-header">
		<button class="accordion-button <c:if test="${i.count < contactos.size() }">collapsed</c:if>" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${i.count}" aria-expanded="<c:if test="${i.count == contactos.size() }">true</c:if>" aria-controls="panelsStayOpen-collapse${i.count}">
    	<div class="row" style="width: 100%">
    		<div class="col-sm-6">
				${item.assunto}
   	      </div>
	      <div class="col-sm-6" style="text-align: right;padding-right: 20px">
	      	<c:if test="${item.mail != null}">
	      		<i class="fas fa-envelope fa-fw" title="Enviado por Email"></i> &nbsp;
	      	</c:if>
	      	
	      	${item.data.format( DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))}
	      </div>
      	</div>
		</button>
		
    </h2>
    <div id="panelsStayOpen-collapse${i.count}" class="accordion-collapse <c:if test="${i.count < contactos.size() }">collapse</c:if> <c:if test="${i.count == contactos.size() }">show</c:if>">
      <div class="accordion-body">
        ${item.descricao}
      </div>
    </div>
  </div>
  
  
  </c:forEach>
  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
      <div class="accordion-body">
        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
        Accordion Item #3
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div>
			
<br>

			<div class="row" style="background-color: #e3f2fd;padding-top:20px; padding-bottom: 20px; border-radius: 10px">
			
				<fieldset>
					<legend>Resposta</legend>
					<div class="col-sm-12" style="text-align: right;font-weight: bold;">
						<input class="form-check-input" type="checkbox" value="" id="checkEnvio">
					      <label class="form-check-label" for="checkEnvio">
					        Enviar por Email
					      </label>
					</div>
					
					<div class="col-sm-12" style="text-align: left;font-weight: bold;">
						<lable>Assunto<lable>
						<input class="form-control" type="text" id="assunto" name="assunto" value="" size="40" style="width: 100%" />
					</div>
					<div class="col-sm-12" style="text-align: left;font-weight: bold;">
						<lable>Descrição<lable>
						<textarea id="texto" name="texto" placeholder="texto" rows="6" style="width: 100%"></textarea>
						
						<div id="editor"> sadasdasdasdas
						</div>
					</div>
				</fieldset>
				
			</div>

			<br> <br>

			
			<div class="row">
				<div class="col-sm">
					<button class="btn btn-primary" type="button" id="submitButton" onclick="gravar()">
				      <span class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true"></span>
				      Registar
				    </button>
    
						<!-- button id="btnCreate" type="button" class="btn btn-primary" onclick="gravar()">Registar</button -->
				</div>
			</div>
			
		</div>
	
	
	</div>



<script src="/ckeditor5-build-classic38/ckeditor.js"></script>

<script>
	var iduser = "${contactoPAi.user.id}";
	var idContactoPai = "${contactoPAi.id}";

	function gravar(){
		var assunto = $("#assunto");
		if (assunto.val().length==0){
			alert('Deve preencher o assunto!')
			assunto.focus();
			return false;
		}

		var texto = $("#texto");
		if (texto.val().length==0){
			alert('Deve preencher a descrição!')
			texto.focus();
			return false;
		}

		
		var submitButton = document.getElementById("submitButton");

		// Show the spinner
		submitButton.querySelector(".spinner-border").classList.remove("d-none");
		
		// Disable the button to prevent further clicks
		submitButton.disabled = true;
		      
		      
		//var checkEnvio2 = $("#checkEnvio"); // nao funciona!!!
		var checkEnvio = document.getElementById("checkEnvio");
		
		var obj =  {
				"pai" : {"id" : idContactoPai},
				"assunto" : assunto.val(),
		   		"descricao" : texto.val()
		   	};
		
		//alert(checkEnvio.checked);
		
		$.ajax({
		   	 url: "/contacts/create?email="+checkEnvio.checked
		   	,type: 'POST' 
		   	//,dataType: 'json'
	        ,contentType: 'application/json'
	        ,data: JSON.stringify(obj)
		   	 ,success:function(res){
		//alert('res: '+res)
		   		if (res === true) {
		   			alert("Contacto registado!")
		   		}
		
		submitButton.querySelector(".spinner-border").classList.add("d-none");

        // Enable the button after the action is completed
        submitButton.disabled = false;
		   	},
		   	 error: function (XMLHttpRequest, textStatus, errorThrown){
		   		 alert("erro: "+errorThrown)
		   	 }
		 });

	}
	
	
	function enviar(){
		var assunto = $("#assunto");
		if (assunto.val().length==0){
			alert('Deve preencher o assunto!')
			assunto.focus();
			return false;
		}

		var texto = $("#texto");
		if (texto.val().length==0){
			alert('Deve preencher a descrição!')
			texto.focus();
			return false;
		}

		
		var obj =  {
				"subject" : assunto.val(),
		   		"text" : texto.val()
		   	};
		
		$.ajax({
		   	 url: "/contacts/sending-email"
		   	,type: 'POST' 
		   	//,dataType: 'json'
	        ,contentType: 'application/json'
	        ,data: JSON.stringify(obj)
		   	 ,success:function(res){
		
		   		if (res == "true") {
		   			alert("Email enviado com sucesso.")
		   		}
		   	},
		   	 error: function (XMLHttpRequest, textStatus, errorThrown){
		   		 alert("erro: "+errorThrown)
		   	 }
		 });
	}


	ClassicEditor
		.create( document.querySelector( '#editor' ), {
			// toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ]
		} )
		.then( editor => {
			window.editor = editor;
		} )
		.catch( err => {
			console.error( err.stack );
		} );
</script>






