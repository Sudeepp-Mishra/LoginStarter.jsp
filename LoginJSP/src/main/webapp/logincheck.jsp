<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LoginDB", "root", "");

        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);

        rs = stmt.executeQuery();

        if (rs.next()) {
            // Save user info in session
            session.setAttribute("username", rs.getString("username"));
            session.setAttribute("fullname", rs.getString("fullname"));
            session.setAttribute("email", rs.getString("email"));

            // Redirect to home.jsp
            response.sendRedirect("home.jsp");
        } else {
            // Invalid login
            response.sendRedirect("login.jsp?error=1");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("login.jsp?error=1");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>