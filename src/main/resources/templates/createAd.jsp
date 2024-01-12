<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

        
    <%@ include file="common/header.jspf" %>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<div class="container">
	
	<form id="form_send" name="form_send" action="/mycard-api/sendInvite" method="post">
	<input type="hidden" id="numCartao" name="numCartao">
	
	<div style="width: 400px;border:5px solid blue;text-align: center;margin: auto;	">
		<br>
		<div class="form-group">
			<div class="col-sm">
				<input class="form-control" type="number" id="cidcard" name="cid" placeholder="cid">
			</div>
		</div>
	</div>
	
	<div class="row" style="overflow:auto; width:800px;margin: auto">
		
		<table class="table">
		<tr>
		
			
		
			<td>
				<div class="createcard2">
					<a href="#" onclick="criaCartao()">
					<div class="cardnumber" style="height: 60px">
						
					</div>
					<div class="photo" align="center">
						<img src="/images/plus.svg" width="120">
					</div>
					<hr/>
					<div class="cardcenter">
						<strong>Criar cartão</strong> 
					</div>
					</a>
				</div>
			
			</td>
			</tr>
		</table>
	</div>
	<br>
	<div class="row" style="text-align: center">
		<div class="col-sm">
		<button id="btnSend" class="btn btn-primary" onclick="return validar()">Enviar</button>
		</div>
	</div>
	
		
	</form>
	
</div>

<div id="alert3"></div>


	<script type="text/javascript">
	
	function criaCartao(){
    	dialog1.load('/mycard-api/createcard').dialog('open');
	}
	
	function createCard(num){
		cartao=num;
		dialog1.load('/mycard-api/createcard'+num).dialog('open'); //.dialog('open');
	}
	
	
	function sendInvite() {
		var cid = $("#cidcard");
		$.ajax({
		   	 url: '/mycard-api/sendInvite?cid='+cid.val()+"&numCartao="+cartaoMarcado
		   	,type: 'POST' 
		   	,dataType: 'json'
	        ,contentType: 'application/json'
	        /*,data: {
		   		"cid" : cid.val(),
		   		"numCartao" : cartaoMarcado
		   	}*/
		   	 ,success:function(res){
		   		if (res) {
		   			//$( "#dialog" ).dialog( "close" );
		   			closeDialog1();
		   			$("#alert2").html("Convite enviado com sucesso.");
		   			var alert2 = $("#alert2").dialog({
		   				modal:true,
						  dialogClass: "alert",
						  buttons: [
							    {
							      text: "Fechar",
							      click: function() {
							    	  alert2.dialog( "close" );
							      }
							    }]
						});
					
		   		}else{
		   			alert(res)
		   		}
		   	 },
		   	 error: function (XMLHttpRequest, textStatus, errorThrown){
		   		 //debugger;
		   		 alert('error: '+errorThrown)
		   	 }
		 });
	}
	
	var cartaoMarcado = 0;

	function marca(id) {
		if (cartaoMarcado != id){
			$("#c"+id).css("background-color", "blue");
			if (cartaoMarcado>0){
				$("#c"+cartaoMarcado).css("background-color", "white");
			}
			cartaoMarcado = id;
		}
	}
	
	function validar(){
		var cid = $("#cidcard");
		if (cid.val().length == 0){
			$("#alert2").html("Deve indicar um número de cartão.");
			$("#alert2").dialog({
					modal:true,
				  dialogClass: "alert"
				});
			
			cid.focus();
			return false;
		}
		if (cartaoMarcado == 0){
			$("#alert2").html("Deverá marcar um cartão.");
			$("#alert2").dialog({
				modal:true,
				  dialogClass: "alert"
				});
			
			return false;
		}
		
		
		$("#alert2").html("Tem a certeza que pretende partilhar o cartão "+cartaoMarcado+" com esta pessoa ?");
		var alert3 = $("#alert2").dialog({
				modal:true,
			  dialogClass: "alert",
			  buttons: [
	    		    {
	    		      text: "Sim",
	    		      click: function() {
	    		        alert3.dialog( "close" );
	    		        sendInvite();
	    		      }
	    		    },
	    		    {
	    		      text: "Não",
	    		      click: function() {
	    		        $( this ).dialog( "close" );
	    		        return false;
	    		      }
	    		    }
	    		  ]
			});
		return false;
	}
</script>





