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

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            width: 50px;
        }

        tr {
            width: 100%;

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

        /*input[type="submit"] {*/
        /*    padding: 10px 20px;*/
        /*    background-color: #007bff;*/
        /*    color: #fff;*/
        /*    border: none;*/
        /*    cursor: pointer;*/
        /*}*/

        /*input[type="submit"]:hover {*/
        /*    background-color: #0062cc;*/
        /*}*/

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
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
    </style>
</head>
<body>

<!-- Add the navbar -->
<div class="navbar">
    <a class="active" href="welcome">Home</a>
    <a href="cart">Cart</a>
    
    <a href="login">Logout</a>
</div>

<h1>Product Catalog</h1>


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
    while (rs1.next()) {
        String categoryId = rs1.getString("category_id");
        String categoryName = rs1.getString("category_name");

        // Retrieve products for the current category from the database
        Statement stmt2 = conn.createStatement();
        ResultSet rs2 = stmt2.executeQuery("SELECT * FROM product WHERE category_id = " + categoryId);

        // Display the category name and its products in a grid
        out.println("<h2>" + categoryName + "</h2>");
        out.println("<table>");
        int productCount = 0;
        while (rs2.next()) {
            if (productCount % 4 == 0) {
                out.println("<tr>");
            }
            String productId = rs2.getString("id");
            String productName = rs2.getString("name");
            String productPrice = rs2.getString("price");
            String productImage = rs2.getString("image");
            out.println("<td>");
            out.println("<img src=\"" + productImage + "\">");
            out.println("<h3>" + productName + "</h3>");
            out.println("<p> $" + productPrice + "</p>");
%>
<form method="post" action="">
    <input type="hidden" id="Email" name="Email" value="<%=productId%>"><br>
    <button type="submit" name="action" value="signin">Add To Cart</button>
</form>
<%

            productCount++;
            if (productCount % 4 == 0) {
                out.println("</tr>");
            }
        }
        out.println("</table>");
    }

// Close database connection
    conn.close();
%>

</body>
</html>
