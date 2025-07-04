<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Redirect to login if session is not active
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Retrieve current user data from session
    String fullname = (String) session.getAttribute("fullname");
    String email = (String) session.getAttribute("email");
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .edit-container {
            background-color: #1e1e1e;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #00bfa5;
            margin-bottom: 20px;
        }

        form label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #ccc;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #2c2c2c;
            border: 1px solid #333;
            color: #f5f5f5;
            border-radius: 6px;
        }

        input:focus {
            outline: none;
            border-color: #00bfa5;
            background-color: #333;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #00bfa5;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #009e89;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #00bfa5;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="edit-container">
    <h2>Edit Profile</h2>

    <!-- 
        This form will send updated info to editprocess.jsp.
        Note: Username is not editable.
    -->
    <form method="post" action="editprocess.jsp">
        <!-- Full Name -->
        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname" value="<%= fullname %>" required>

        <!-- Email -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>" required>

        <!-- Password (optional update) -->
        <label for="password">New Password (leave blank to keep current):</label>
        <input type="password" id="password" name="password" placeholder="New password">

        <!-- Username (read-only) -->
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<%= username %>" readonly>

        <input type="submit" value="Save Changes">
    </form>

    <a href="home.jsp" class="back-link">← Back to Home</a>
</div>

</body>
</html>