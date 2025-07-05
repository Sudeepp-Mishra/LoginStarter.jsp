<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Prevent direct access without login
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get submitted data from form
    String newFullname = request.getParameter("fullname");
    String newEmail = request.getParameter("email");
    String newPassword = request.getParameter("password");
    String username = (String) session.getAttribute("username"); // Username is fixed

    // DB setup
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // 1️⃣ Load JDBC driver and connect to DB
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LoginDB", "root", "");

        // 2️⃣ Prepare update query
        String updateQuery;
        if (newPassword != null && !newPassword.trim().isEmpty()) {
            // Password is being changed
            updateQuery = "UPDATE users SET fullname=?, email=?, password=? WHERE username=?";
            stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, newFullname);
            stmt.setString(2, newEmail);
            stmt.setString(3, newPassword);  // You can hash this later
            stmt.setString(4, username);
        } else {
            // Password not changed
            updateQuery = "UPDATE users SET fullname=?, email=? WHERE username=?";
            stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, newFullname);
            stmt.setString(2, newEmail);
            stmt.setString(3, username);
        }

        // 3️Execute update
        int rows = stmt.executeUpdate();

        if (rows > 0) {
            // Update session values to reflect changes in home.jsp
            session.setAttribute("fullname", newFullname);
            session.setAttribute("email", newEmail);

            // 4️Redirect to home.jsp
            response.sendRedirect("home.jsp");
        } else {
            // Update failed — optionally redirect to error page
            out.println("<p style='color:red;'>Update failed. Please try again.</p>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>An error occurred while updating. Please try again later.</p>");
    } finally {
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>