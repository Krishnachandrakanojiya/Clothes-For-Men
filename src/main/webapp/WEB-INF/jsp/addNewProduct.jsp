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
            width: 150px;

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
    <a href="addProduct">Product List</a>
    <a class="active" href="addNewProduct">Add Product</a>
    <a href="login">Logout</a>
</div>

<div style="display: flex; justify-content: center; text-align: center">
    <h1>Add New Product</h1>
</div>
<div style="display: flex; flex-direction: row;justify-content: center">
    <table>
        <tr>
            <th>S.No</th>
            <th>CategoryName</th>
        </tr>
        <%
            // Establish database connection
            String url = "jdbc:mysql://localhost:3306/db";
            String user = "root";
            String password = "Akash@766";
            Connection conn = DriverManager.getConnection(url, user, password);

            Statement stmt2 = conn.createStatement();
            ResultSet rs2 = stmt2.executeQuery("SELECT * FROM db.category");
            int i = 1;
            while (rs2.next()) {
                out.println("<tr>");
                out.println("<td>" + i + "</td>");
                out.println("<td>" + rs2.getString("category_name") + "</td>");
                out.println("</tr>");
                i++;
            }
            conn.close();
        %>
    </table>
</div>
<div style="display: flex; flex-direction: row; justify-content: center; margin-top: 20px">
    <form action="addNewProduct" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name"><br><br>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price"><br><br>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity"><br><br>

        <label for="quantity">Category Name </label>
        <input type="text" id="categoryName" name="categoryName"><br><br>

        <input type="submit" value="Submit">
    </form>
</div>
<div style="display: flex; flex-direction: row; justify-content: center; margin-top: 20px">

</div>
<div style="display: flex; flex-direction: row; justify-content: center; margin-top: 20px">
    <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger" role="alert">${errorMsg}</div>
    </c:if>
</div>
</body>
</html>
