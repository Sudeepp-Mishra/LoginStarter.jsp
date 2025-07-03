<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Redirect if user is not logged in
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String fullname = (String) session.getAttribute("fullname");
    String email = (String) session.getAttribute("email");
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .header {
            background-color: #1e1e1e;
            padding: 20px;
            text-align: center;
            border-bottom: 2px solid #333;
        }

        .header h2 {
            margin: 0;
            color: #00bfa5;
        }

        .details {
            text-align: center;
            margin-top: 40px;
        }

        .details p {
            font-size: 18px;
            margin: 8px 0;
            color: #cccccc;
        }

        .button {
            display: inline-block;
            margin: 10px 8px 0;
            padding: 10px 20px;
            background-color: #00bfa5;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.2s ease;
        }

        .button:hover {
            background-color: #009e89;
        }

        .button-container {
            margin-top: 30px;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Welcome, <%= fullname %>!</h2>
</div>

<div class="details">
    <p><strong>Full Name:</strong> <%= fullname %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Username:</strong> <%= username %></p>

    <div class="button-container">
        <a href="edit.jsp" class="button">Edit Profile</a>
        <a href="login.jsp" class="button">Logout</a>
    </div>
</div>

</body>
</html>