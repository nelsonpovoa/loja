<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>


    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/string-1.1" prefix="str"%>

<%
	System.out.println("createAd 2!!");
%>


<!-- <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"> -->

	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- link rel="stylesheet" href="/css/style.css" -->

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> -->

<!-- <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->


<!-- <script src="/webjars/jquery/3.6.4/jquery.min.js"></script> -->

<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<!-- JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->


<!-- Include Quill stylesheet -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

<link href="/css/jquery.multiselect.css" rel="stylesheet">

<style>

        
</style>

<script src="/js/jquery.multiselect.js"></script>

<script src="/ckeditor5-build-classic/ckeditor.js"></script>

<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<!-- script src="/quill-1.3.6/quill.js"></script -->



     



	<div style="text-align: center;width: 97%">

		<div class="container" style="text-align: center;margin: auto;">
		



			
			<div class="row">
				<div class="col-sm">
					<a href="#" onclick="carregaFoto()">
 
					<c:choose>
					<c:when test="${prod.dadosImagem != null}">
						<img id="img" alt="" src="${prod.dadosImagem}" width="150" class="img-fluid">
						</c:when>
						<c:otherwise>
						<img id="img" src="/img/clothes.jpg" width="150" class="img-fluid">
						</c:otherwise>
					</c:choose>
					
					</a>
					<!-- 
					<input id="inpfile" class="form-control" type="file" onchange="previewFile()">
					-->
					
					<div class="custom-file">
					  <input type="file" class="custom-file-input" id="fileInput">
					  <label class="custom-file-label" for="fileInput">Choose file</label>
					</div>
					<button onclick="readFile()">Read File</button>
					aaaaaaa
					
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-3" style="font-weight: bold;">
					<c:choose>
						<c:when test="${prod.ano != null}">
							<c:set var="currentYear" value="${prod.ano}"></c:set>
						</c:when>
						<c:otherwise>
							<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
							<fmt:formatDate var="currentYear" value="${now}" pattern="yyyy"/>

						</c:otherwise>
					</c:choose>
				
				
					Ano
					<input class="form-control" type="number" id="ano" name="ano" size="5" maxlength="4" value="${currentYear}" >
				</div>
				<div class="col-sm-3" style="font-weight: bold;">
					<input class="form-check-input" type="checkbox" value="" id="checkActivo" <c:if test="${prod.activo}">checked</c:if>>
					      <label class="form-check-label" for="checkActivo">
					        Activo
					      </label>
				</div>
				<div class="col-sm-3" style="font-weight: bold;" nowrap>

					<input class="form-check-input" type="checkbox" value="" id="checkNovidade" <c:if test="${prod.novidade}">checked</c:if>>
					<label class="form-check-label" for="checkNovidade">
					        Novidade
					      </label>
				</div>

			</div>
			
			<div class="row">
				<div class="col-sm">
					
					<input class="form-control" type="text" id="namead" name="name" placeholder="Nome" value="${prod.name}">
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-6" style="text-align: left;font-weight: bold;">
					Categoria da roupa
				</div>
				<div class="col-sm-12">
					<select class="form-control" id="seltipo" name="tipo">
					<option value="">- Selecione -</option>
					<c:forEach var="value" items="${enumValues}">
						<c:out value="${value}  ${value.code} ${prod.tipo.code}"/>
        			    <option value="${value.code}" <c:if test="${prod.tipo.code == value.code}">selected</c:if>> ${value.description} </option>
       				</c:forEach>
					</select> 
				</div>

			</div>


<div class="row">
				<div class="col-sm-6" style="text-align: left;font-weight: bold;">
					SubCategoria
				</div>
				<div class="col-sm-12">
	<select id="multipleSelect" name="subTipo"  class="form-control 2col active" style="width: 100%">
<option value=""> - Selecione - </option>

<c:set var="idpai" value="0"/>
<c:set var="descricao" value=""/>
 <c:forEach var="m" items="${menu}" varStatus="i">
       
       <%
       	//System.out.println("entrei!!!!");
       %>
       
       <c:if test="${m.idPai != idpai and i.count > 1}">
       		</optgroup>
       		
       </c:if>
       
       <c:choose>
       <c:when test="${(m.id == 3 || m.id == 4) && !m.link}">
       <c:set var="descricao" value="${m.descricao}"/>
       </c:when>
       <c:when test="${(m.idPai == null) || m.id == 30 || m.id == 40 || m.id == 50 || m.id == 60}">
       
       		<%
       			String desc = (String)pageContext.getAttribute("descricao");
       			if (desc != null && desc.length()>0) {
       		%>
       			<optgroup label="${descricao} - ${m.descricao}">
       		<% } else { %>
       			<optgroup label="${m.descricao}">
       		<% } %>
       		
       		
       		
       		<c:if test="${m.idPai != idpai }">
       			<c:set var="descricao" value=""/>
       		</c:if>
       		
       		
       </c:when>
       <c:otherwise>
       		<option value="${m.id}" <c:if test="${m.id == prod.subTipo}">selected</c:if>>${m.descricao}</option>
       </c:otherwise>
       </c:choose>
       
       	
 </c:forEach>    
 

    </select>
    
    
    <script>
$('select[multiple]').multiselect({
    columns: 3,
    placeholder: ' - Selecione Sub Categoria - '
});
</script>

		</div>

			</div>

			<div class="row">
				<div class="col-sm" style="text-align: left;font-weight: bold;">
					Descrição
				</div>

				<div class="col-sm-12">
					<textarea id="descricao" placeholder="Texto" rows="6" style="width: 100%">${prod.descricao}</textarea>
					
					<div id="editor">
					 <c:out value="${prod.descricao}"/>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
				
<!-- Create the toolbar container -->
<div id="toolbar">
  <button class="ql-bold">Bold</button>
  <button class="ql-italic">Italic</button>
</div>

<!-- Create the editor container -->
<div id="editor2">
  <c:out value="${prod.descricao}"/>
</div>
			
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-sm-4" style="text-align: left;font-weight: bold;">
					Referência
				</div>
				<div class="col-sm-12">
					<input class="form-control" type="text" id="referencia" name="referencia" placeholder="referencia" value="${prod.referencia}">
				</div>
			</div>

			<div class="row">
				<div class="col-sm-4" style="text-align: left;font-weight: bold;">
					Marca
				</div>
				<div class="col-sm-12">
					<input class="form-control" type="text" id="marca" name="marca" placeholder="marca" value="${prod.marca}">
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-4" style="text-align: left;font-weight: bold;">
					Cor de fundo
				</div>
				<div class="col-sm-12">
					<select class="form-control" id="selcor" name="color">
						<option value="">- Selecione -</option>
						<option value="yellow" <c:if test="${prod.cor == 'yellow'}">selected</c:if>>Amarelo</option>
						<option value="blue" <c:if test="${prod.cor == 'blue'}">selected</c:if>>Azul</option>
						<option value="green" <c:if test="${prod.cor == 'green'}">selected</c:if>>Verde</option>
						<option value="red" <c:if test="${prod.cor == 'red'}">selected</c:if>>Vermelho</option>
						<option value="orange" <c:if test="${prod.cor == 'orange'}">selected</c:if>>Laranja</option>
					</select> 
				</div>

			</div>
			
			<div class="row">
				<div class="col-sm-2" style="text-align: left;font-weight: bold;">
					Expira
				</div>
				<div class="col-sm-4">
					<select class="form-control" id="selTimeExp" name="tempoExpira">
						<option value="">- Selecione -</option>
						<option value="1S"> 1 semana </option>
						<option value="2S"> 2 semana </option>
						<option value="3S"> 3 semana </option>
						<option value="1M"> 1 mês </option>
						<option value="2M"> 2 mêses </option>
					</select>
				</div>
				<div class="col-sm-2" style="text-align: left;font-weight: bold;">Data Expira: </div>
				<div class="col-sm-4">
					<input class="form-control" type="date" id="data_exp" name="expira">
				</div>				
			</div>

			<div class="row">
				<div class="col-sm" style="text-align: left;font-weight: bold;">
					Epoca
				</div>
				<div class="col-sm-12">
					<select class="form-control" id="selEpoca" name="epoca">
						<option value="">- Selecione -</option>
						<option value="1"> Primavera </option>
						<option value="2"> Verão </option>
						<option value="3"> Outono </option>
						<option value="4"> Inverno </option>
					</select>
				</div>
			</div>
			
			<br>
			
			<div class="row">
				<div class="col-sm">
					<c:choose>
					<c:when test="${prod.id == null or prod.id ==0}">
						<button id="btnCreate" type="button" class="btn btn-primary" onclick="create()">Inserir Anúncio</button>
					</c:when>
					<c:otherwise>
						<button id="btnCreate" type="button" class="btn btn-primary" onclick="create()">Alterar Anúncio</button>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			
		</div>
	
	
	</div>



<script type="text/javascript">

	
	var contents;
	
var prodId = '${prod.id}';

var alert1='';

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
    
	$("#namead").focus();


  });
  

function readFile() {
	var preview =  document.querySelector('#img');
	
	
	  const fileInput = document.getElementById('fileInput');
	  console.log(fileInput);
	  
	  // Check if a file is selected
	  if (fileInput.files.length === 0) {
	    console.log('No file selected.');
	    return;
	  }
	  
	  const file = fileInput.files[0];
	  const reader = new FileReader();
	  
	  reader.onload = function(event) {
	    contents = event.target.result;
	    
	    console.log('File contents:', contents);
	    // Do something with the file contents
	  }
	  
	  reader.readAsDataURL(file);
	  //reader.readAsText(file);
	  preview.src = reader.result;
}



function previewFile() {
	var preview =  document.querySelector('#img');
	const fileInput = document.getElementById("inpfile");
	//alert(fileInput)
	console.log(fileInput)
	
	const file = fileInput.files[0];
	console.log("f: "+file);
	
	//const fileInput = document.getElementById('inpfile');
	fileInput.onchange = () => {
	  const selectedFile = fileInput.files[0];
	  console.log(selectedFile);
	}
	
	//alert(document.querySelector('input[type=file]').files.length)
	//var file    = $('#inpfile').files[0]; //document.querySelector('input[type=file]').files[0];
	//alert(file+" "+$('#inpfile'))
	
	reader.onloadend = function (event) {
		const contents = event.target.result;
		console.log("contents: "+contents);
		
		//preview.src = reader.result;
	}
	if (file) {
	  reader.readAsDataURL(file);
	} else {
	  preview.src = "";
	}
}

/*
function showAlert(msg){
	$("#alert").html(msg);
	alert2 = $("#alert").dialog({
			modal: true,
		dialogClass: "alert",
			buttons: [
		    {
		      text: "Fechar",
		      click: function() {
		        alert2.dialog( "close" );
		      }
		    }
		  ]
	});
}*/

function create(){
	
	console.log("create");
	//alert('create')

	var name = $("#namead");
	if (name.val().length==0){
		alert('Deve preencher o nome!')
		//alert('Deve preencher o nome!');
		name.focus();
		return false;
	}
	
	var selTipo = $("#seltipo");
	if (selTipo.val().length==0){
		alert('Deve selecionar o tipo!')
		selTipo.focus();
		return false;
	}
	
	var descricao = $("#descricao");
	if (descricao.val().length==0){
		alert('Deve preencher a descrição!')
		descricao.focus();
		return false;
	}
	
	var referencia = $("#referencia");
	if (referencia.val().length==0){
		alert('Deve preencher a referencia!')
		referencia.focus();
		return false;
	}
	
	var selectCor = $("#selcor");
	if (selectCor.val().length==0){
		alert('Deve selecionar a cor!');
		selectCor.focus();
		return false;
	}

	
	var selectedValuesSubTipo = $('#multipleSelect')
	//alert(selectedValues)
	if (selectedValuesSubTipo.val().length==0){
		alert('Deve selecionar uma SubCategoria!');
		selectedValuesSubTipo.focus();
		return false;
	}

	var ano = $("#ano");
	var selTimeExp = $("#selTimeExp");
	var dataExpira = $("#data_exp");
	var marca = $("#marca");
	
	var checkActivo = document.getElementById("checkActivo");
	var checkNovidade = document.getElementById("checkNovidade");
	
	alert(checkNovidade.checked)
	
	var obj =  {
			"id" : prodId,
			"ano" : ano.val(),
			"activo" : checkActivo.checked,
			"novidade" : checkNovidade.checked,
			"marca" : marca.val(),
	   		"name" : name.val(),
	   		"tipo" : selTipo.val(),
	   		"subTipo" : selectedValuesSubTipo.val(),
	   		"descricao" : descricao.val(),
	   		"referencia" : referencia.val(), 
	   		"cor" : selectCor.val(),
	   		"tempoExpira" : selTimeExp.val(), 
	   		"expira" : dataExpira.val()
	   	};
	
/*
	if (reader.result != null){
		var img = reader.result.split(",");
		//console.log(img);
		console.log(img[0]);
		obj.dadosImagem = img[1];
	}*/
	
	if (contents != null){
		var img = contents.split(",");
		console.log(img);
		//console.log(img[0]);
		obj.dadosImagem = img[1];
	}
	
	//console.log(obj);
	//console.log(JSON.stringify(obj));
	
	$.ajax({
	   	 url: "/products/createAd"
	   	,type: 'POST' 
	   	//,dataType: 'json'
        ,contentType: 'application/json'
        ,data: JSON.stringify(obj)
	   	 ,success:function(res){
//alert('res: '+res)
//console.log(res);
//alert("|"+res+"|")
			/*if (res == "true") {
			}*/
	   		 <c:choose>
	   		 <c:when test="${prod.id == null}">
					//$("#alert" ).html("Anuncio criado com sucesso.");
					alert("Anuncio criado com sucesso.")
			 </c:when>
			 <c:otherwise>
			 	//$("#alert" ).html("Anuncio gravado com sucesso.");
			 	alert("Anuncio gravado com sucesso.")
			 </c:otherwise>
			 </c:choose>
			//}
			
			 //$("#btnCreate" ).disable("true");
			 $('#btnCreate').prop('disabled', true);
			 
			 
			 /*
	   		 alert1 = $( "#alert" ).dialog({
	   			 	  modal:true,
					  dialogClass: "alert",
					  buttons: [
			    		    {
			    		      text: "Fechar",
			    		      click: function() {
			    		        alert1.dialog( "close" );
			    		    	  
			    		      }
			    		    }
			    		  ]
					});
				*/
				
	   		// actualizaConteudo(res);
	   		
	   	 },
	   	 error: function (XMLHttpRequest, textStatus, errorThrown){
	   		 alert("erro: "+errorThrown)
	   	 }
	 });
	
}



	function carregaFoto(){
		
	}
	
	function create2(){
		alert(222)
	}

</script>

<script>
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



<!-- Initialize Quill editor -->
<script>
/*  var editor = new Quill('#editor2', {
    modules: { toolbar: '#toolbar' },
    theme: 'snow'
  }); */
</script>




