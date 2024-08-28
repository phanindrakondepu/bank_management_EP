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

@WebServlet("/BalanceServlet")
public class BalanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String dbUrl = "jdbc:mysql://localhost:3306/banking_app";
    private static final String dbUser = "root";
    private static final String dbPassword = "klu123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
            String sql = "SELECT amount FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        double balance = rs.getDouble("amount");
                        request.setAttribute("balance", balance);
                        request.getRequestDispatcher("/bankbalance.jsp").forward(request, response);
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script>alert('Invalid credentials. Please try again.'); window.location='bankbalance.jsp';</script>");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
