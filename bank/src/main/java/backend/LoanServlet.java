package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/submitloan")
public class LoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String loanType = request.getParameter("loanType");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String amount = request.getParameter("amount");
        String message = request.getParameter("message");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/banking_app";
        String dbUser = "root";
        String dbPassword = "klu123";

        // SQL insert statement
        String sql = "INSERT INTO loan (loan_type, name, email, phone, amount, message) VALUES (?, ?, ?, ?, ?, ?)";

        // Response setup
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Try-with-resources to ensure resources are closed
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement statement = connection.prepareStatement(sql)) {
             
            // Set the parameters for the SQL statement
            statement.setString(1, loanType);
            statement.setString(2, name);
            statement.setString(3, email);
            statement.setString(4, phone);
            statement.setString(5, amount);
            statement.setString(6, message);

            // Execute the SQL statement
            int rowsInserted = statement.executeUpdate();
            
            // Check if the insertion was successful
            if (rowsInserted > 0) {
                out.println("<html><head><title>Loan Application Submitted</title></head><body>");
                out.println("<h1>Loan Application Submitted</h1>");
                out.println("<p>Thank you, " + name + ". Your application for a " + loanType + " has been received and processed successfully.</p>");
                out.println("<p>Details:</p>");
                out.println("<ul>");
                out.println("<li>Email: " + email + "</li>");
                out.println("<li>Phone: " + phone + "</li>");
                out.println("<li>Loan Amount: " + amount + "</li>");
                out.println("<li>Additional Information: " + message + "</li>");
                out.println("</ul>");
                out.println("</body></html>");
            } else {
                out.println("<html><head><title>Loan Application Failed</title></head><body>");
                out.println("<h1>Loan Application Failed</h1>");
                out.println("<p>Sorry, " + name + ". There was an error processing your application. Please try again later.</p>");
                out.println("</body></html>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<html><head><title>Error</title></head><body>");
            out.println("<h1>Error</h1>");
            out.println("<p>There was an error processing your request: " + e.getMessage() + "</p>");
            out.println("</body></html>");
        }

        out.close();
    }
}
