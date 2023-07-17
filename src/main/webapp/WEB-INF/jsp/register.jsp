<!DOCTYPE html>
<html>
<head>
	<title>Signup</title>
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, Helvetica, sans-serif;
		}
		.container {
			background-color: #fff;
			border-radius: 5px;
			box-shadow: 0 0 10px rgba(0,0,0,0.2);
			margin: auto;
			padding: 20px;
			width: 400px;
		}
		.container h1 {
			font-size: 24px;
			margin-bottom: 20px;
			text-align: center;
		}
		input[type="text"], input[type="password"] {
			border-radius: 5px;
			border: 1px solid #ccc;
			box-sizing: border-box;
			margin-bottom: 20px;
			padding: 10px;
			width: 100%;
		}
		input[type="submit"] {
			background-color: #4CAF50;
			border: none;
			border-radius: 5px;
			color: #fff;
			cursor: pointer;
			font-size: 16px;
			padding: 10px;
			width: 100%;
		}
		input[type="submit"]:hover {
			background-color: #3e8e41;
		}
		.error {
			color: red;
			font-size: 14px;
			margin-top: 10px;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>Signup</h1>
		<form method="post" action="">
			<label for="name">Name</label>
			<input type="text" id="name" name="name" required>
			<label for="email">Email</label>
			<input type="text" id="email" name="email" required>
			<label for="password">Password</label>
			<input type="password" id="password" name="password" required>
			<label for="number">Phone No</label>
			<input type="text" id="number" name="number" required>
			<input type="submit" value="Sign up">
			<c:if test="${not empty errorMsg}">
	     <div class="alert alert-danger" role="alert">${errorMsg}</div>
	        </c:if>
		</form>
	</div>
</body>
</html>
