

<!DOCTYPE html>
<html>
<head>
<title> Login Form</title>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<style>
*{
    box-sizing:border-box;
}
body{
    font-family:Arial;
    background:url('bg.jpg');
    background-size: cover;
}
 
form{
    left:50%;
    top:50%;
    position:absolute;
    transform:translate(-50%,-50%);
    background:#262626;
    padding:20px 20px 80px 20px;
    text-align:center;
    border-radius:20px;
    width:350px;
}
img{
    width:130px;
    height:130px;
    border:5px solid dodgerblue;
    border-radius:50%;
    margin-top:20px;
    margin-bottom:20px;
     
}
.input-container{
    display:flex;
    width:100%;
    margin-bottom:15px;
}
.icon{
    padding:10px;
    background:dodgerblue;
    color:#fff;
    min-width:50px;
    text-align:center;
}
.input-field{
    width:100%;
    padding:10px;
    outline:none;
    font-size:15px;
    outline: none;
    border: none;
}
.input-field:focus{
    border:2px solid dodgerblue;
}
.btn{
    background:dodgerblue;
    color:#fff;
    padding:15px 20px;
    border:none;
    cursor:pointer;
    width:100%;
    font-size:18px;
}
.btn:hover{
    background:orange;
}
</style>

</head>
<body>
<form>
    <img src ="profile.jpg">
     
    <div class ="input-container">
        <i class ="fa fa-user icon"></i>
        <input class ="input-field" type ="text" placeholder ="Username">
    </div>
     
    <div class ="input-container">
        <i class ="fa fa-envelope icon"></i>
        <input class ="input-field" type ="text" placeholder ="Email">
    </div>
     
    <div class ="input-container">
        <i class ="fa fa-key icon"></i>
        <input class ="input-field" type ="password" placeholder ="Password">
    </div>
    <button type ="submit" class ="btn"> LogIn</button>
</form>
</body>
</html>
	
