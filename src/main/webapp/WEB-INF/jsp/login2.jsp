<!DOCTYPE html>
<html>
<head>
    <title> Login form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     

<style>
	
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: arial;
}
.main{
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #ad74e2;
}
.profile-card{
  position: relative;
  width: 250px;
  height: 250px;
  background: #fff;
  padding: 30px;
  border-radius: 50%;
  box-shadow: 0 0 22px #3336;
  transition: .6s;
  margin: 0 25px;
 
}
.profile-card:hover{
  border-radius: 10px;
  
   
   
}
.profile-card .img{
  position: relative;
  width: 100%;
  height: 100%;
  transition: .6s;
  z-index: 99;
  cursor: pointer;
}
.img img{
  width: 100%;
  height: 100%;
  border-radius: 50%;
  box-shadow: 0 0 22px #3336;
  transition: .6s;
}
.profile-card:hover .img{
  transform: translateY(-130px);
}
.profile-card:hover img{
  border-radius: 10px;
   
}
.caption{
  text-align: center;
  transform: translateY(-120px);
  opacity: 0;
  transition: .6s;
   
}
.profile-card:hover .caption{
  opacity: 1;
}
form input{
    width: 100%;
    padding: 7px;
    margin: 7px;
    border: none;
    border: 1px solid gray;
    border-radius: 5px;
    outline: none;;  
}
 
 
button{
    padding: 7px;
    background: rgb(77, 95, 26);
    margin: 10px;
    font-size: 15px;
    border: none;
    font-weight: bold;
    text-transform: uppercase;
    cursor: pointer;
    border-radius: 5px;
    color: #fff;
     
}

</style>

</head>
<body>
    <div class="main">
 
         
 
        <div class="profile-card">
            <div class="img">
                <img src="/img/loja-logo2.png">
            </div>
            <div class="caption">
               <form>
                <input type="text" placeholder="Username">
                <input type="password" placeholder="Password">
                <button>Submit Now </button>
               </form>
                
            </div>
        </div>
    </div>
</body>
</html>
