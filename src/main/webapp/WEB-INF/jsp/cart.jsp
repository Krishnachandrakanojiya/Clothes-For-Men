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
        button{
            cursor: pointer;
            background-color: #007bff;
            color: #fff;
            border: none;
            height: 30px;
            width: 30px;
            font-size: 20px;
        }
        .product {
            width: 200px;
            height: 200px;
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            float: left;
        }
        .plusMinus{
            display: flex;
            flex-direction: row;
            justify-content: center;
            text-align: center;
            gap: 2px;
        }
    </style>
</head>
<body>

<!-- Add the navbar -->
<div class="navbar">
    <a href="welcome">Products</a>
    <a  class="active" href="cart">Cart</a>
    <a href="checkout">Checkout</a>
    <a href="login">Logout</a>
</div>

<div>
    <h1>User Cart</h1>
    <div style="display: flex; flex-direction: row; justify-content: space-between">
        <h1 style="text-align: left;">Total Item: <%=request.getAttribute("totalItem")%></h1>
        <h1 style="text-align: right; margin-right: 5px">Total Price: $<%=request.getAttribute("totalPrice")%></h1>

    </div>

</div>



<%
    // Establish database connection
    String url = "jdbc:mysql://localhost:3306/db";
    String user = "root";
    String password = "Akash@766";
    Connection conn = DriverManager.getConnection(url, user, password);

// Retrieve categories and products from the database
    Statement stmt1 = conn.createStatement();
    ResultSet rs1 = stmt1.executeQuery("SELECT * FROM category");

// Iterate over the categories and their corresponding products

    // Retrieve products for the current category from the database
    Statement stmt2 = conn.createStatement();
    ResultSet rs2 = stmt2.executeQuery("SELECT * FROM product inner join cart on product.id=cart.productId");

    // Display the category name and its products in a grid

    while (rs2.next()) {
        out.println("<div class=\"product\">");
        String productId = rs2.getString("id");
        String productName = rs2.getString("name");
        String productPrice = rs2.getString("price");
        String productImage = rs2.getString("image");
        String productQuantity = rs2.getString("qty");
        out.println("<img src=\"" + productImage + "\">");
        out.println("<h3>" + productName + "</h3>");
        out.println("<p>$" + productPrice + "</p>");
        out.println("<p> Qty:" + productQuantity + "</p>");
        out.println("<div class=\"plusMinus\">");
        out.println("<form method=\"post\"  action=\"" + "increment" + "\">");
        out.println("<input type=\"hidden\" id=\"productId\" name=\"productId\" value=\"" + productId + "\">");
        out.println("<button type=\"submit\" name=\"action\" value=\"add\">+</button>");;
        out.println("</form>");
        out.println("<form method=\"post\"  action=\"" + "decrement" + "\">");
        out.println("<input type=\"hidden\" id=\"productId\" name=\"productId\" value=\"" + productId + "\">");
        out.println("<button type=\"submit\" name=\"action\" value=\"remove\">-</button>");
        out.println("</form>");
        out.println("</div>");
        out.println("</div>");
    }


// Close database connection
    conn.close();
%>

</body>
</html>
