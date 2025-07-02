<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 🔹 Step 1: Get form data from signup.jsp
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // JDBC variables
    Connection conn = null;
    PreparedStatement checkStmt = null;
    PreparedStatement insertStmt = null;
    ResultSet rs = null;

    try {
        // 🔹 Step 2: Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 🔹 Step 3: Establish connection to your LoginDB database
        String dbURL = "jdbc:mysql://localhost:3306/LoginDB"; // <-- your DB
        String dbUser = "root";      
        String dbPass = "";    
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // 🔹 Step 4: Check if the username already exists
        String checkQuery = "SELECT * FROM users WHERE username = ?";
        checkStmt = conn.prepareStatement(checkQuery);
        checkStmt.setString(1, username);
        rs = checkStmt.executeQuery();

        if (rs.next()) {
            // Username already taken — redirect back to signup with error
            response.sendRedirect("signup.jsp?error=1");
        } else {
            // Username is new — proceed with inserting the new user
            String insertQuery = "INSERT INTO users (fullname, email, username, password) VALUES (?, ?, ?, ?)";
            insertStmt = conn.prepareStatement(insertQuery);
            insertStmt.setString(1, fullname);
            insertStmt.setString(2, email);
            insertStmt.setString(3, username);
            insertStmt.setString(4, password); // You should hash this in real apps - later we will implement that too

            int rowsInserted = insertStmt.executeUpdate();

            if (rowsInserted > 0) {
                // Successfully inserted user — redirect to login page
                response.sendRedirect("login.jsp");
            } else {
                // Something went wrong — redirect with error
                response.sendRedirect("signup.jsp?error=1");
            }
        }

    } catch (Exception e) {
        e.printStackTrace(); // show error in server logs
        response.sendRedirect("signup.jsp?error=1"); // redirect on error
    } finally {
        // 🔹 Step 5: Clean up JDBC resources
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (checkStmt != null) checkStmt.close(); } catch (Exception e) {}
        try { if (insertStmt != null) insertStmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>