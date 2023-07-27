<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		function go() {
			let username = document.getElementById("username").value;
			let password = document.getElementById("password").value;
			
			if (!username) {
				let error = "! Please enter";
				document.getElementById("outputSpanUsername").textContent = error;
			}else {
				document.form.action = "add.o";
				document.form.submit();
			}
		}

		function hide() {
			let go = document.getElementById("f").value;
			if (go) {
				let error = "";
				document.getElementById("outputSpan").textContent = error;
			}
		}
	</script>
	<style>
	body {
		margin: 0;
		padding: 0;
		font-family: Arial, sans-serif;
		background-image: url('https://images.unsplash.com/photo-1683464874351-fa0afa0c5140?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1932&q=80');
		background-repeat: no-repeat;
		background-size: cover;
		display: flex;
		justify-content: center;
		align-items: center;
		min-height: 100vh;
    }
    
    #login-container {
    	background: linear-gradient(to bottom right, rgba(166, 217, 235, 0.995), rgba(255, 255, 255, 0.553));
		padding: 40px;
		border-radius: 10px;
		box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
		max-width: 400px;
		width: 100%;
		margin-left:40%;
    }
    
    #headerText1{
      text-align: center;
      color: #222223;
    }
    
    #clickIt{
      padding: 8px 183px;
      background-color: #039be5;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      text-decoration: none;
    }
    
    input[type="text"],
    input[type="password"] {
      width: 96%;
      padding: 10px 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    
    label, input {
      display: block;
      margin-bottom: 20px;
    }
    #headerText{
      color: white;
      margin-left: 20%;
    }
    
    span{
    	color: red;
    	font-size : 10px;
    }
    
    #forgetPassword{
    	color : blue;
    	text-decoration:none;
    	padding: 3px 183px;
    	font-size : 8px;
    }
    
	</style>
</head>
<body>
<header>
<h1 id="headerText">Let's <br>Connect<br>Everyone</h1></header>
<div id="login-container">
	<h1 id="headerText1">Make Conversation</h1>
	<form name="form" method="post">
	<label for="username">Username:</label>
	<input type="text" id="username" name="username" placeholder="Enter your username" required>
	<span id="outputSpanUsername"></span>
	<label for="password">Password:</label>
	<input type="password" id="password" placeholder="Enter your password" required>
	<span id="outputSpanPassword"></span><br>
	<a href="#" id="clickIt" onClick="go()">Login</a>
	<!-- <a href="#"	id="forgetPassword" onClick="">Forget Password</a> -->
	</form>
</div>
</body>
</html>
