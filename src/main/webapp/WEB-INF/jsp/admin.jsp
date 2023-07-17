<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Our Site</title>
    <style>
        .navbar {
            background-color: #333;
            overflow: hidden;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }

        .content {
            padding: 50px;
            text-align: center;
        }

        .orderDiv {
            border: 1px solid black;
            padding: 10px;
            margin: 10px;
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
    </style>
</head>
<body>

<!-- Add the navbar -->
<div class="navbar">
    <a class="active" href="admin">Order History</a>
    <a href="addProduct">Products</a>
    <a href="login">Logout</a>
</div>

<!-- Add the page content -->
<div style="display: flex; justify-content: center; text-align: center">
    <h1>Orders......</h1>
</div>
<table>
    <tr>
        <th>S.No</th>
        <th>User Name</th>
        <th>Email</th>
        <th>Credit Card</th>
        <th>CVV</th>
        <th>Expiry</th>
        <th>Total Amount</th>
    </tr>
    <%
        // Establish database connection
        String url = "jdbc:mysql://localhost:3306/db";
        String user = "root";
        String password = "Akash@766";
        Connection conn = DriverManager.getConnection(url, user, password);

        Statement stmt2 = conn.createStatement();
        ResultSet rs2 = stmt2.executeQuery("SELECT * FROM db.order");
        int i = 1;
        while (rs2.next()) {
            out.println("<tr>");
            out.println("<td>" + i + "</td>");
            out.println("<td>" + rs2.getString("userName") + "</td>");
            out.println("<td>" + rs2.getString("email") + "</td>");
            out.println("<td>" + rs2.getString("credit") + "</td>");
            out.println("<td>" + rs2.getString("cvv") + "</td>");
            out.println("<td>" + rs2.getString("expiry") + "</td>");
            out.println("<td>" + rs2.getString("totalAmount") + "</td>");
            out.println("</tr>");
            i++;
        }
        conn.close();
    %>
</table>


</body>
</html>
