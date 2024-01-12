<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%
	short evento = com.example.teste3.controllers.HomeController.ImagensEventos.NATAL;
	com.example.teste3.controllers.HomeController home = new com.example.teste3.controllers.HomeController();
%>

<!DOCTYPE html>
<html>
<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Contacto</title>
    
    <!-- Custom styles for this template -->
<!--     <link href="/css/sb-admin-2.min.css" rel="stylesheet"> -->
    

<style type="text/css">
.form-control2:focus {
  border-color: #FF0000;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(255, 0, 0, 0.6);
}

.form-control3:focus {
        border-color: #28a745;
        box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
    } 
    
    .form-control4:focus {
  border-color: #6265e4 !important;
  box-shadow: 0 0 5px rgba(98, 101, 228, 1) !important;
}


.form-control {
  display: block;
  width: 100%;
  height: 34px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.428571429;
  color: #555555;
  vertical-align: middle;
  background-color: #ffffff;
  border: 1px solid #cccccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
          transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}

.form-control5 :focus {
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
}

.form-control:focus {
    border-color: rgba(82,168,236,.8);
    outline: 0;
    outline: thin dotted \9;
    -moz-box-shadow: 0 0 8px rgba(82,168,236,.6);
    box-shadow: 0 0 18px rgba(82,168,236,.6) !important;
}

<%
	short _POPUP = com.example.teste3.controllers.HomeController.ImagensEventos.POPUP;
	com.example.teste3.controllers.HomeController.ImagensEventos imgPOPUP = new com.example.teste3.controllers.HomeController.ImagensEventos(_POPUP, evento);
	String pathImagePOPUP = imgPOPUP.getImagem();
%>

.back{
	background-image: url("<%=pathImagePOPUP%>");
	background-repeat: no-repeat, repeat;
	background-size: 100% 100%;
	background-color: #cccccc;
}

.label{
	color: black;
}
</style>

<script type="text/javascript">
	
	function create(){
		
		//alert('create')
	
		var name = $("#nome");
		if (name.val().length==0){
			//showAlert('Deve preencher o nome!')
			alert('Deve preencher o nome!')
			//alert('Deve preencher o nome!');
			name.focus();
			return false;
		}
		
		
		var email = $("#email");
		if (email.val().length==0){
			//showAlert('Deve preencher o seu email!')
			alert('Deve preencher o seu email!')
			email.focus();
			return false;
		}
		
		var assunto = $("#assunto");
		if (assunto.val().length==0){
			//showAlert('Deve preencher o assunto!')
			alert('Deve preencher o assunto!')
			assunto.focus();
			return false;
		}
		
		var mensagem = $("#mensagem");
		if (mensagem.val().length==0){
			//showAlert('Deve preencher a mensagem!')
			alert('Deve preencher a mensagem!');
			mensagem.focus();
			return false;
		}
		
//alert(11)
		
		var obj =  {
				"nome" : name.val(),
				"assunto" : assunto.val(),
				"email" : email.val(),
				"descricao" : mensagem.val()
		   	};
		

		
		$.ajax({
		   	 url: "/contacts/create"
		   	,type: 'POST' 
		   	//,dataType: 'json'
	        ,contentType: 'application/json'
	        ,data: JSON.stringify(obj)
		   	 ,success:function(res){
//alert('res: '+res)
//console.log(res);
				if (res === true) {
				 	alert("Contacto enviado com sucesso.");
				}
				
				$('#contactModal').modal('hide');
				
				
				 //$("#btnCreate" ).disable("true");
				 //			$('#btnSend').prop('disabled', true);
				 
					
		   		// actualizaConteudo(res);
		   		
		   	 },
		   	 error: function (XMLHttpRequest, textStatus, errorThrown){
		   		 alert("erro: "+errorThrown)
		   	 }
		 });
		
	}
	
	$(document).ready(function() {

		/*
        setTimeout(function() {
        	$("#nome").focus();
        }, 2000);
*/
		//$("#nome").focus();

	});
		

</script>




</head>

<body >

<div <%=(pathImagePOPUP.length()>0 ? "class='back'" : "")%>>
<br>

<div class="container" style="text-align: center; background-color: rgba(255,255,255,0.5) ">

	<div class="row">
		<div class="col-sm-12" style="text-align: left">
		<label class="label"> Nome <span style="color:red">*</span> </label>
		<br />
    	<input class="form-control focusedInput" type="text" id="nome" name="nome" value="" size="40" style="width: 100%" placeholder="Nome"/> 
    	
    	</div>
    </div>
    <br>
    <div class="row">
		<div class="col-sm-12" style="text-align: left">
		<label class="label"> Email <span style="color:red">*</span> </label>
		<br />
    	<input class="form-control" type="email" id="email" name="email" value="" size="40"  style="width: 100%" placeholder="Email" />
    	</div>
    </div>
    <br />
    
    <div class="row">
		<div class="col-sm-12" style="text-align: left">
		<label class="label"> Assunto <span style="color:red">*</span> </label>
		<br />
    	<input class="form-control" type="text" id="assunto" name="assunto" value="" size="40" style="width: 100%" placeholder="Assunto" />
    	</div>
    </div>
	<br />
	
    <div class="row">
		<div class="col-sm-12" style="text-align: left">
		<label class="label"> Mensagem <span style="color:red">*</span> </label> 
		<br />
    	<textarea class="form-control" id="mensagem" name="messagem" cols="60" rows="10" style="width: 100%" placeholder="Mensagem"></textarea>
		</div>
    </div>
    
    
    <div class="row">
		<div class="col-sm-12" style="text-align: left;color: black;">
    		(<span style="color:red">*</span>) campos obrigatórios 
    	</div>
    </div>
    <br>
    <!--   div class="row">
		<div class="col-sm-12" style="text-align: center;padding-top: 30px; ">

			<button id="btnSend" type="submit" class="btn btn-primary" onclick="return create()">Enviar</button>	
		</div>
    </div -->
	
</div>

</div>

</body>

</html>    