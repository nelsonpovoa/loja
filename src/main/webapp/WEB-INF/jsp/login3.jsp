<!DOCTYPE html>
<html>
<head>
    <title>Glassmorphism login Form</title>

<style type="text/css">

	
*,
*:before,
*:after{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
        font-family: verdana;
        color: #ffffff;
        letter-spacing: 0.5px;
        outline: none;
        border: none;
        text-decoration: none;
    }
 
body{
    background-color: #080710;
}
.wrap{
    width: 430px;
    height: 520px;
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 50%;
}
.wrap .shape{
    height: 200px;
    width: 200px;
    position: absolute;
    border-radius: 50%;
}
.shape:first-child{
    background: linear-gradient(
        #1845ad,
        #23a2f6
    );
    left: -50px;
    top: -50px;
}
.shape:last-child{
    background: linear-gradient(
        to right,
        #ff512f,
        #f09819
    );
    right: -30px;
    bottom: -50px;
}
form{
    height: 500px;
    width: 350px;
    background-color: rgba(255,255,255,0.13);
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    border-radius: 20px;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255,255,255,0.1);
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 50px 35px;
}
h2{
    text-align: center;
    font-size: 2em;
}
p{
    margin: 10px;
    text-align: center;
}
 
 
.form-group{
    margin-top: 50px;
}
input{
    display: block;
    height: 50px;
    width: 100%;
    background-color: rgba(255,255,255,0.07);
    border-radius: 5px;
    padding: 0 10px;
    margin-top: 30px;
    font-size: 14px;
    font-weight: 300;
}
::placeholder{
    color: #e5e5e5;
}
button{
    margin-top: 30px;
    width: 100%;
    background: rgb(131,58,180);
    background: cyan;
    color: #080710;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}
button:hover{
    background: #e5e5e5;
}
.social{
  margin-top: 20px;
  display: flex;
}
.social div{
  background: red;
  width: 150px;
  border-radius: 3px;
  padding: 5px 10px 10px 5px;
  background-color: rgba(255,255,255,0.27);
  color: #eaf0fb;
  text-align: center;
   
}
.social div:hover{
  background-color: rgba(255,255,255,0.47);
}
.social .fb{
  margin-left: 25px;
}
</style>

</head>
<body>
    <div class="wrap">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form>
        <h2>LogIn Here</h2>
        <div class="form-group">
        <input type="text" placeholder="Email or Phone" id="username">
        <input type="password" placeholder="Password" id="password">
             
        <button>LogIn Now</button>
    </div>
    <p>LogIn With</p>
        <div class="social">
             
          <div class="go"><a href ="#"> Google</a></div>
          <div class="fb"><a href="#"> Facebook</a></div>
        </div>
    </form>
</body>
</html>

