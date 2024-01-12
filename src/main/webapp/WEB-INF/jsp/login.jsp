<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Bootstrap Login Form</title> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

    
    
    <style>
    body{
        background-color: #e3deee;
    }
    .col-md-offset-4 {
        justify-content: center;
        align-items: center;
        display: flex;
        height: 100vh;
    }
    .form-container{
        background: linear-gradient(150deg,#1B394D 33%,#2D9DA7 34%,#2D9DA7 66%,#EC5F20 67%);
        font-family: Arial;
        text-align: center;
        padding: 30px 20px 50px;
         
         
        
    }
    .form-container .title{
        color: #fff;
        font-size: 30px;
        text-transform: uppercase;
        font-weight: bold;
        letter-spacing: 1px;
        margin: 0 0 60px;
    }
    .form-container .form-horizontal{
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 20px rgba(0,0,0,0.4);
    }
    .form-horizontal .form-icon{
        color: #fff;
        background-color: #1B394D;
        font-size: 75px;
        line-height: 92px;
        height: 90px;
        width: 90px;
        margin: -65px auto 10px;
        border-radius: 50%;
    }
    .form-horizontal .form-group{
        margin: 0 0 10px;
        position: relative;
    }
    .form-horizontal .form-group:nth-child(3){ margin-bottom: 30px; }
    .form-horizontal .form-group .input-icon{
        color: #e7e7e7;
        font-size: 23px;
        position: absolute;
        left: 0;
        top: 10px;
    }
    .form-horizontal .form-control{
        color: #000;
        font-size: 16px;
        font-weight: 600;
        height: 50px;
        padding: 10px 10px 10px 40px;
        margin: 0 0 5px;
        border: none;
        border-bottom: 2px solid #e7e7e7;
        border-radius: 0px;
        box-shadow: none;
    }
    .form-horizontal .form-control:focus{
        box-shadow: none;
        border-bottom-color: #EC5F20;
    }
    .form-horizontal .form-control::placeholder{
        color: #000;
        font-size: 16px;
        font-weight: 600;
    }
    .form-horizontal .forgot{
        font-size: 13px;
        font-weight: 600;
        text-align: right;
        display: block;
    }
    .form-horizontal .forgot a{
        color: #777;
        transition: all 0.3s ease 0s;
    }
    .form-horizontal .forgot a:hover{
        color: #777;
        text-decoration:  underline;
    }
    .form-horizontal .signin{
        color: #fff;
        background-color: #EC5F20;
        font-size: 18px;
        text-transform: uppercase;
        font-weight: bold;
        letter-spacing: 2px;
        width: 100%;
        padding: 12px;
        box-shadow: 0 0 10px rgba(0,0,0,0.3);
        transition: all 0.4s ease 0s;
    }
    .form-horizontal .signin:hover,
    .form-horizontal .signin:focus{
        font-weight: 600;
        letter-spacing: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.3) inset;
    }
    </style>
    
    </head>
    <body>
         
        <div class="form-bg">
            <div class="container">
                <div class="row justify-content-md-center">
                                    <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6">
                        <div class="form-container">
                            <h3 class="title">Bem Vindo(a)</h3>
                            <form class="form-horizontal" action="/login" method="POST">
                                <div class="form-icon">
                                    <i class="fa fa-user-circle"></i>
                                </div>
                                <div class="form-group">
                                    <span class="input-icon"><i class="fa fa-user"></i></span>
                                    <input id="username" type="username" class="form-control" placeholder="Utilizador">
                                </div>
                                <div class="form-group">
                                    <span class="input-icon"><i class="fa fa-lock"></i></span>
                                    <input type="password" class="form-control" placeholder="Senha">
                                    <span class="forgot"><a href="">Esqueceu a Senha?</a></span>
                                </div>
                                <button class="btn signin">Entrar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
        	$("#username").focus();
        </script>
        
    </body>
</html>
