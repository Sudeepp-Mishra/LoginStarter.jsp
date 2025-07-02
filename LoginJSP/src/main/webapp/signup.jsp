<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--
  This page directive defines:
  - The content type to be HTML
  - UTF-8 encoding (for proper display of all characters)
  - Java as the scripting language
-->

<!DOCTYPE html>
<html>
<head>
    <title>Signup Page</title>

    <!--
      This <style> block provides the same dark-themed styling as login.jsp,
      ensuring consistency between pages.
    -->
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #121212;
            color: #e0e0e0;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup-container {
            background-color: #1e1e1e;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #ffffff;
        }

        form {
            margin-top: 10px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #ccc;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #333;
            background-color: #2c2c2c;
            color: #f5f5f5;
            border-radius: 6px;
            transition: all 0.2s ease-in-out;
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
            transition: background-color 0.2s ease, transform 0.1s ease;
        }

        input[type="submit"]:hover {
            background-color: #009e89;
        }

        input[type="submit"]:active {
            transform: scale(0.97);
        }

        .error {
            background-color: #2e1a1a;
            color: #ff6b6b;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        a {
            color: #00bfa5;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 15px;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .signup-container {
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

        input:-webkit-autofill {
            background-color: #2c2c2c !important;
            color: #f5f5f5 !important;
        }
    </style>
</head>

<body>

<!--
  This is the main signup box — styled similarly to login.
  It contains the form and error message if signup fails.
-->
<div class="signup-container">
    <h2>Create Account</h2>

    <%-- 
        Display an error message if signup failed.
        For example: signupprocess.jsp can redirect back like:
        response.sendRedirect("signup.jsp?error=1");
    --%>
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <div class="error">Signup failed. Please try again.</div>
    <%
        }
    %>

    <!--
      Signup form — sends data to signupprocess.jsp via POST.
      Includes:
      - Full name
      - Email
      - Username
      - Password
    -->
    <form method="post" action="signupprocess.jsp">
        <!-- Full Name -->
        <label for="fullname">Full Name:</label>
        <input type="text" name="fullname" id="fullname" placeholder="Your full name" required>

        <!-- Email -->
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" placeholder="Your email address" required>

        <!-- Username -->
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" placeholder="Choose a username" required>

        <!-- Password -->
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" placeholder="Create a password" required>

        <!-- Submit button -->
        <input type="submit" value="Sign Up">
    </form>

    <!-- Link back to login page -->
    <a href="login.jsp">Already have an account? Login here</a>
</div>

</body>
</html>