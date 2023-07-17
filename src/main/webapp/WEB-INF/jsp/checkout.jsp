<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Our Site</title>
    <style>

        /* Center the header */
        h1 {
            text-align: center;
        }

        /* Style the category and product grid */
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        td {
            width: 25%;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        tr {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            width: 50px;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Style the product image and name */
        img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-bottom: 10px;
        }

        h3 {
            margin: 0;
        }

        /* Style the add to cart button */
        form {
            margin-top: 10px;
            text-align: center;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0062cc;
        }


        /* Add styles to the navbar */
        .navbar {
            background-color: #333;
            overflow: hidden;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        /* Style the links inside the navbar */
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        /* Change the color of links on hover */
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Add a color to the active/current link */
        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }

        /* Center the page content */
        .content {
            padding: 50px;
            text-align: center;
        }

        .product {
            width: 200px;
            height: 200px;
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            float: left;
        }

        body {
            background-color: #f2f2f2;
            font-family: Arial, Helvetica, sans-serif;
        }

        .container {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
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

<!-- Add the navbar -->
<div class="navbar">
    <a href="welcome">Products</a>
    <a href="cart">Cart</a>
    <a class="active" href="checkout">Checkout</a>
    <a href="login">Logout</a>
</div>

<div>
    <h1>Checkout</h1>
    <h1 style="text-align: right; margin-right: 5px">Total Price: $<%=request.getAttribute("totalPrice")%>
    </h1>

</div>

<div class="container">
    <h1>Bill</h1>
    <form method="post" action="">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>
        <label for="email">Email</label>
        <input type="text" id="email" name="email" required>
        <label for="name">Credit Card Number</label>
        <input type="text" id="credit" name="credit" minlength=10 maxlength=10 required>
        <label for="name">CVV</label>
        <input type="text" id="cvv" name="cvv" required>
        <label for="name">Expiry</label>
        <input type="text" id="expiry" name="expiry" required>
        <input type="submit" value="Place Order">
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger" role="alert">${errorMsg}</div>
        </c:if>
    </form>
</div>

</body>
</html>
