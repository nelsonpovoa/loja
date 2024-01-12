// Call the dataTables jQuery plugin
$(document).ready(function() {

  //alert(12321);

  carregar();

  $('#usuarios').DataTable();

  actualizarEmailUsuario();
});

function actualizarEmailUsuario() {
  document.getElementById("txt-email-usuario").outerHTML = localStorage.email;
}


// esta funcao foi retirada da pagina:
// https://stackoverflow.com/questions/29775797/fetch-post-json-data
async function carregar(){

//(async () => {
  const request = await fetch('usuarios', {
    method: 'GET',
    headers: getHeaders()
    /*headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    } */ //,
    //body: JSON.stringify({a: 1, b: 'Textual content'})
  });
  const usuarios = await request.json();


  let html = '';
  for(let u1 of usuarios) {
    let botonEliminar = '<a href="#" onclick="eliminarUsuario('+u1.id+')" class="btn btn-danger btclassNamecle btn-sm"> <i clas="fas fa-trash"></i> </a>';

    let usrHtml = '<tr> <td>'+u1.nome+'</td> <td>'+u1.email+'</td> '+
      '<td>'+u1.telefone+'</td>'+
      '<td> '+botonEliminar+' </td> ' +
    '</tr> ';

    html += usrHtml;

  }

  document.querySelector("#usuarios tbody").outerHTML = html;

  //document.querySelector("#usuarios tbody").outerHTML();
  console.log(usuarios);
//})();

}

function getHeaders() {
  return {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization' : localStorage.token
  };
}

async function eliminarUsuario(id){

  //alert(id);

  if (confirm('Desea eliminar este usuario?')) {
    const request = await fetch('usuario/' + id, {
      method: 'DELETE',
      headers: getHeaders()
    });

    location.reload();
  }

}

