<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--
  This JSP directive tells the server:
  - Content type is HTML
  - Character encoding is UTF-8 (for special characters like emojis, Nepali text)
  - Language used is Java
-->

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>

    <!--
      This <style> block contains internal CSS to define how the page looks.
      We’re applying a dark theme using dark background colors and light text.
    -->
    <style>
        /* Apply consistent box-sizing to all elements */
        * {
            box-sizing: border-box;
        }

        /* Full-page styling: dark background and center contents using Flexbox */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #121212; /* dark background */
            color: #e0e0e0; /* light text for contrast */
            height: 100vh; /* full screen height */
            margin: 0;
            display: flex; /* enable Flexbox */
            justify-content: center; /* center horizontally */
            align-items: center;     /* center vertically */
        }

        /* The login form container box */
        .login-container {
            background-color: #1e1e1e; /* slightly lighter box than background */
            padding: 30px 40px; /* spacing inside box */
            border-radius: 12px; /* rounded corners */
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4); /* shadow for depth */
            max-width: 350px; /* don’t go wider than this */
            width: 100%; /* fill available space */
            text-align: center; /* center headings/text inside */
        }

        /* Heading styling */
        h2 {
            margin-bottom: 20px;
            color: #ffffff;
        }

        /* Form block spacing and left-alignment of labels */
        form {
            margin-top: 10px;
            text-align: left;
        }

        /* Labels above input fields */
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #ccc; /* lighter than pure white */
        }

        /* Style for both username and password inputs */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #333;
            background-color: #2c2c2c; /* dark input background */
            color: #f5f5f5; /* light input text */
            border-radius: 6px;
            transition: all 0.2s ease-in-out; /* smooth animation */
        }

        /* Highlight input when focused */
        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #00bfa5; /* highlight with accent color */
            background-color: #333;
        }

        /* Style for the login submit button */
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #00bfa5; /* teal accent color */
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s ease, transform 0.1s ease;
        }

        /* Change button color slightly when hovered */
        input[type="submit"]:hover {
            background-color: #009e89;
        }

        /* Button tap animation */
        input[type="submit"]:active {
            transform: scale(0.97); /* tiny shrink on click */
        }

        /* Error message styling */
        .error {
            background-color: #2e1a1a; /* dark red background */
            color: #ff6b6b; /* soft red text */
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        /* Signup link under form */
        a {
            color: #00bfa5; /* teal */
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 15px;
        }

        /* Underline link when hovered */
        a:hover {
            text-decoration: underline;
        }

        /* Make form look better on small/mobile screens */
        @media (max-width: 480px) {
            .login-container {
                padding: 20px;
                border-radius: 8px;
            }
            h2 {
                font-size: 20px;
            }
            input {
                padding: 8px;
            }
        }

        /* Fix yellow autofill background from Chrome */
        input:-webkit-autofill {
            background-color: #2c2c2c !important;
            color: #f5f5f5 !important;
        }
    </style>
</head>

<body>

<!--
  The main box containing the login form.
  It’s centered using Flexbox (in body) and styled with .login-container
-->
<div class="login-container">
    <h2>Login</h2>

    <%-- 
        This JSP block checks if the URL contains ?error=something.
        If it does, it shows an error message.
        For example, after a failed login, logincheck.jsp might redirect here using:
        response.sendRedirect("login.jsp?error=1");
    --%>
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <div class="error">Invalid username or password.</div>
    <%
        }
    %>

    <!--
        This is the login form.
        When submitted, it sends data to logincheck.jsp using the POST method.
        It contains:
        - Username input
        - Password input
        - Login button
    -->
    <form method="post" action="logincheck.jsp">

        <!-- Username input field -->
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" placeholder="Enter your username" required>

        <!-- Password input field -->
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" placeholder="Enter your password" required>

        <!-- Submit button -->
        <input type="submit" value="Login">
    </form>

    <!-- Link to signup page -->
    <a href="signup.jsp">Don't have an account? Sign up here</a>
</div>

</body>
</html>