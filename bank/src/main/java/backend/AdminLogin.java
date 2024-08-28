package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String dbUrl = "jdbc:mysql://localhost:3306/banking_app";
    private static final String dbUser = "root";
    private static final String dbPassword = "klu123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null) {
            response.getWriter().println("Username and password are required.");
            return;
        }

        // Database connection and user authentication
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setString(2, password);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        // User authenticated
                        HttpSession session = request.getSession();
                        session.setAttribute("username", rs.getString("username"));

                        // Display a success message using JavaScript
                        response.setContentType("text/html");
                        PrintWriter out = response.getWriter();
                        out.println("<html><body>");
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Login successful!');");
                        out.println("window.location.href = 'AdminServlet';");
                        out.println("</script>");
                        out.println("</body></html>");
                        out.close();
                    } else {
                        // Authentication failed
                        response.setContentType("text/html");
                        PrintWriter out = response.getWriter();
                        out.println("<html><body>");
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Invalid username or password.');");
                        out.println("window.location.href = 'login';");
                        out.println("</script>");
                        out.println("</body></html>");
                        out.close();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<form method='POST' action='login'>");
        out.println("Username: <input type='text' name='username'><br>");
        out.println("Password: <input type='password' name='password'><br>");
        out.println("<input type='submit' value='Login'>");
        out.println("</form>");
        out.println("</body></html>");
        out.close();
    }
}