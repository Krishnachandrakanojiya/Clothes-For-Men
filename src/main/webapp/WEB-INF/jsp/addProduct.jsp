<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Our Site</title>
    <style>
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

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }

        button {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<!-- Add the navbar -->
<div class="navbar">
    <a  href="admin">Order History</a>
    <a class="active" href="addProduct">Product List</a>
    <a href="addNewProduct">Add Product</a>
    <a href="login">Logout</a>
</div>

<!-- Add the page content -->
<!-- Add the page content -->
<div style="display: flex; justify-content: center; text-align: center">
    <h1>Product</h1>
</div>
<table>
    <tr>
        <th>S.No</th>
        <th>Name</th>
        <th>Price</th>
        <th>Image</th>
        <th>Quantity</th>
        <th>Operation</th>
    </tr>
    <%
        // Establish database connection
        String url = "jdbc:mysql://localhost:3306/db";
        String user = "root";
        String password = "Akash@766";
        Connection conn = DriverManager.getConnection(url, user, password);

        Statement stmt2 = conn.createStatement();
        ResultSet rs2 = stmt2.executeQuery("SELECT * FROM db.product");
        int i = 1;
        while (rs2.next()) {
            out.println("<tr>");
            out.println("<td>" + i + "</td>");
            out.println("<td>" + rs2.getString("name") + "</td>");
            out.println("<td>" + rs2.getString("price") + "</td>");
            // in td there is image
            out.println("<td><img src=" + rs2.getString("image") + " width=\"100\" height=\"100\"></td>");
            out.println("<td>" + rs2.getString("quantity") + "</td>");
            // add a button to update the quantity
            out.println("<td><button type=\"button\" onclick=\"location.href='updateQuantity?id=" + rs2.getString("id") + "'\">Update Quantity</button></td>");
            out.println("</tr>");
            i++;
        }
        conn.close();
    %>
</table>

</body>
</html>
