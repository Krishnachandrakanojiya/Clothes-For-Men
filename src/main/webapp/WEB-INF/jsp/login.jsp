<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
<style>
body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
}

.container {
	margin: 0 auto;
	max-width: 300px;
	padding: 50px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0px 0px 10px #888888;
}

h1 {
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	font-weight: bold;
	margin-top: 10px;
}

input[type=Email], input[type=password] {
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 10px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0px 5px #888888;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.signup-btn {
	background-color: #008CBA;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
	font-weight: bold;
}

.signup-btn:hover {
	background-color: #006F8C;
}

.alert {
	text-align: center;
	margin-top: 20px;
}

.alert-danger {
	background-color: #f2dede;
	color: #a94442;
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<c:if test="${not empty errorMsg}">
			<div class="alert alert-danger" role="alert">${errorMsg}</div>
		</c:if>
		<h1>Sign In</h1>
		<form method="post" action="">
			<label for="Email">Email:</label>
			 <input type="Email" id="Email" name="Email" required> <br> 
			<label for="password">Password:</label>
			<input type="password" id="password" name="password" required>
			<br> <input type="submit" value="Sign In">  <br>  
			<div class="error-message">${errorMessage}</div>
		</form>
		<div class="sign-up">
			Don't have an account? <a href="register">Sign Up</a>
		</div>
	</div>
</body>
</html>
