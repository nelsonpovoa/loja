// Call the dataTables jQuery plugin
$(document).ready(function() {

});


async function registrar(){

    let datos = {};
    datos.nome = document.getElementById("firstName").value;
    datos.apelido = document.getElementById("lastName").value;
    datos.email = document.getElementById("inputEmail").value;
    datos.password = document.getElementById("inputPassword").value;

    let repetirPassword = document.getElementById("repeatPassword").value;

    //alert('repetir: '+repetirPassword +' datos senha: '+datos.password)
    if (repetirPassword !=  datos.password) {
        alert('La contrasenha que escribiste es diferente.');
        return;
    }

    const request = await fetch('usuario', {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(datos)
    });

    alert('La cuenta fue creada con exito!');
    window.location.href="login.html";
}


