<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Criar Utilizador</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <link href="/css/jquery.multiselect.css" rel="stylesheet">
        
        
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<script src="/js/jquery.multiselect.js"></script>


<script type="text/javascript">

var contents;

var utilId = '${util.id}';

var reader  = new FileReader();


$(document).ready(function() {
	  
    $('.custom-file-input').on('change', function(event) {
    	
      const file = event.target.files[0];
      console.log('Selected file:', file);
      // Do something with the file
      
      var reader  = new FileReader();
      //console.log('reader 0:', reader);
      
      //reader.readAsText(file);
      
      reader.readAsDataURL(file);
      //console.log('reader:', reader);
      
      
      reader.onload = function(event) {
  	    contents = event.target.result;
  	    //console.log('File contents:', contents);
  	    //preview.src = contents;
  		//console.log("fluid: "+$('.img-fluid'));
  		
  		$('.img-fluid').attr('src', contents);;
  	    // Do something with the file contents
  	  }
      
      //console.log("src: "+preview.src)
      
      //console.log("reader result: "+reader.result)
	  //preview.src = reader.result;
	  
    });
    
	$("#inputFirstName").focus();


  });
  

function criar(){
	
	console.log("criar");
	//alert('create')
	
	var name = $("#inputFirstName");
	if (name.val().length==0){
		alert('Deve preencher o nome!')
		name.focus();
		return false;
	}
	
	var lastName = $("#inputLastName");
	if (lastName.val().length==0){
		alert('Deve preencher o Apelido!')
		lastName.focus();
		return false;
	}
	
	var email = $("#inputEmail");
	if (email.val().length==0){
		alert('Deve preencher o endereço de Email!')
		email.focus();
		return false;
	}
	
	var username = $("#inputUsername");
	if (username.val().length==0){
		alert('Deve selecionar o nome de utilizador!');
		username.focus();
		return false;
	}
	
	
	var passwd = $('#inputPassword')
	//alert(selectedValues)
	if (passwd.val().length==0){
		alert('Deve selecionar a Password!');
		passwd.focus();
		return false;
	}
	
	var confirmPasswd = $('#inputPasswordConfirm')
	//alert(selectedValues)
	if (confirmPasswd.val().length==0){
		alert('Deve selecionar a confirmação de Password!');
		confirmPasswd.focus();
		return false;
	}

	if(passwd.val() != confirmPasswd.val()) {
		alert('Password e confirmação de Password nao coincidem. Corrija as passwords');
		confirmPasswd.focus();
		return false;
	}
	
	var checkActivo = document.getElementById("checkActivo");
	
	var profiles = $('select#multipleSelect').val()
	if(profiles.length == 0) {
		alert('Deve selecionar pelo menos um perfil!');
		return false;
	}
	
	//console.log(profiles)
	var obj = {
			"id" : utilId,
			"nome" : name.val(),
			"apelido" : lastName.val(),
			"email" : email.val(),
			"username" : username.val(),
	   		"password" : passwd.val(),
	   		"activo" : checkActivo.checked,
	   		"profiles" : profiles
	   	};

	
	
	if (contents != null){
		var img = contents.split(",");
		//console.log(img);
		//console.log(img[0]);
		obj.photo = img[1];
	}
	
	
	//alert(11)
	//console.log(obj);
	$.ajax({
	   	 url: "/utils/create"
	   	,type: 'POST' 
	   	//,dataType: 'json'
	    ,contentType: 'application/json'
	    ,data: JSON.stringify(obj)
	   	 ,success:function(res){
	//alert('res: '+res)
	//console.log(res);
	//alert("|"+res+"|")
			if (res === "true") {
				if (utilId.length == 0) {
					alert("Utilizador criado com sucesso.")
				}else {
					alert("Utilizador alterado com sucesso.")
				}
			}
			
			 $('#btnCreate').prop('disabled', true);
			 
			 
	   	 },
	   	 error: function (XMLHttpRequest, textStatus, errorThrown){
	   		 
	   		console.info("erro: ",errorThrown," | ",XMLHttpRequest," | ",textStatus)
	   	 }
	 });
//alert(22)
}

</script>

    </head>
    
    <body>
          <div class="container">
              <form name="form">
                  <div class="row mb-3">
                      <div class="col-md-6">
                      
	                      	<div class="row mb-3">
	                      		<div class="col-md-12">
		                            <div class="form-floating mb-3 mb-md-0">
		                                <input class="form-control" id="inputFirstName" type="text" name="firstName" placeholder="Primeiro Nome" value="${util.nome}" />
		                                <label for="inputFirstName">Primeiro Nome</label>
		                            </div>
		                        </div>
		                    </div>
	                    
		                     <div class="row mb-3">
		                    	<div class="col-md-12">
		                            <div class="form-floating">
		                                <input class="form-control" id="inputLastName" type="text" name="lastName" placeholder="Apelido" value="${util.apelido}" />
		                                <label for="inputLastName">Apelido</label>
		                            </div>
		                        </div>
		                    </div>
	                    
		                     <div class="row mb-3">
		                    	<div class="col-md-12">
		                    		<div class="form-floating">
		                     	<input class="form-control" id="inputEmail" type="email" name="Email" placeholder="name@example.com" value="${util.email}" />
		                         <label for="inputEmail">Endereço Email</label>
		                         </div>
		                    	</div>
		                    </div>
                    
                    
                      </div>
                      <div class="col-md-6 text-center">
                      
                      	<div class="text-right">
                      		<input class="form-check-input" type="checkbox" value="" id="checkActivo" <c:if test="${util.activo}">checked</c:if>>
					      <label class="form-check-label" for="checkActivo">
					        Activo
					      </label>
                      	</div>
                      
                      	<label>Foto</label>
                      	<br>
                      	<a href="#">

								<c:choose>
								<c:when test="${util.photo != null}">
								<img id="img" alt="" src="${util.photo}" width="150" class="img-fluid">
								</c:when>
								<c:otherwise>
								<img id="img" src="/img/user.png" width="150" class="img-fluid">
								</c:otherwise>
								</c:choose>
								
								</a>

					<div class="custom-file">
					  <input type="file" class="custom-file-input" id="fileInput">
					  <label class="custom-file-label" for="fileInput">Choose file</label>
					</div>
					
                                   </div>
                               </div>
                              
                              <div class="row mb-3">
                                   <div class="col-md-6">
                                       <div class="form-floating mb-3 mb-md-0">
                                           <input class="form-control" id="inputUsername" type="text" name="username" placeholder="Username" value="${util.username}" />
                                           <label for="inputUsername">Username</label>
                                       </div>
                                   </div>

                               		<div class="col-sm-6" style="text-align: left;font-weight: bold;">
					Perfil:

					<select id="multipleSelect" multiple="multiple" name="profiles[]"  class="form-control 2col active" style="width: 100%">
<!-- 					<option value=""> - Selecione - </option> -->
					
					<c:forEach var="value" items="${enumValues}">
						<c:out value="${value}  ${value.code} ${util.profiles}"/>
						<c:set var="existe" value="false"/>
						<c:forEach var="value2" items="${util.profiles}">
							<c:if test="${value2 == value}">
								<c:set var="existe" value="true"/>
							</c:if>
						</c:forEach>
        			    <option value="${value.code}" <c:if test="${existe == true}">selected</c:if>> ${value.description} </option>
       				</c:forEach>
       				
					</select> 
					
<script>
	$('select[multiple]').multiselect({
	    columns: 2,
	    placeholder: ' - Selecione Sub Categoria - '
	});
</script>

                                   </div>
                                   
								</div>

                               <div class="row mb-3">
                                   <div class="col-md-6">
                                       <div class="form-floating mb-3 mb-md-0">
                                           <input class="form-control" id="inputPassword" type="password" name="password" placeholder="Digitar password" />
                                           <label for="inputPassword">Password</label>
                                       </div>
                                   </div>
                                   <div class="col-md-6">
                                       <div class="form-floating mb-3 mb-md-0">
                                           <input class="form-control" id="inputPasswordConfirm" type="password" name="confirmPassword" placeholder="Confirmar password" />
                                           <label for="inputPasswordConfirm">Confirmação Password</label>
                                       </div>
                                   </div>
                               </div>
                               <div class="row mb-3">
                                   <div class="col-md-12 text-center">
                                   
                                   <c:choose>
                                   <c:when test="${util.id == null}">
	                                   <a id="btnCreate" class="btn btn-primary" href="#" onclick="criar()">Criar Conta</a>
                                   </c:when>
                                   <c:otherwise>
                                   		<a id="btnCreate" class="btn btn-primary" href="#" onclick="criar()">Alterar Conta</a>
                                   </c:otherwise>
                                   </c:choose>
                      </div>
                  </div>
              </form>
          </div>
                       
                       
<!--         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
        <script src="/js/scripts.js"></script>
    </body>
</html>
