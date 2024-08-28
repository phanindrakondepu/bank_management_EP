package backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String dbUrl = "jdbc:mysql://localhost:3306/banking_app";
    private static final String dbUser = "root";
    private static final String dbPassword = "klu123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String accountType = request.getParameter("accounttype");
        String amount = request.getParameter("amount");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        // Validate input
        if (firstName == null || lastName == null || email == null || phone == null ||
                dob == null || address == null || city == null || state == null ||
                zip == null || accountType == null || username == null ||
                password == null || confirmPassword == null || !password.equals(confirmPassword)) {
            response.getWriter().println("All fields are required and passwords must match.");
            return;
        }

       

        // Database connection and insertion
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
            String sql = "INSERT INTO users (first_name, last_name, email, phone, dob, address, city, state, zip, account_type, amount, username, password) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, firstName);
                pstmt.setString(2, lastName);
                pstmt.setString(3, email);
                pstmt.setString(4, phone);
                pstmt.setString(5, dob);
                pstmt.setString(6, address);
                pstmt.setString(7, city);
                pstmt.setString(8, state);
                pstmt.setString(9, zip);
                pstmt.setString(10, accountType);
                pstmt.setString(11, amount);
                pstmt.setString(12, username);
                pstmt.setString(13, password);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("loginpage.jsp");
                } else {
                    response.getWriter().println("Failed to register user.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
