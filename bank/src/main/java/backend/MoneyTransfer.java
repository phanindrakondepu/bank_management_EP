package backend;

import java.io.IOException;
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

@WebServlet("/MoneyTransfer")
public class MoneyTransfer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/banking_app";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "klu123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fromUsername = request.getParameter("fromUsername");
        String toUsername = request.getParameter("toUsername");
        String amountStr = request.getParameter("amount");

        String message = "";

        if (fromUsername == null || toUsername == null || amountStr == null ||
            fromUsername.isEmpty() || toUsername.isEmpty() || amountStr.isEmpty()) {
            message = "Please fill all fields.";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/bank/transferpage.jsp").forward(request, response);
            return;
        }

        try {
            double amount = Double.parseDouble(amountStr);
            boolean transferSuccessful = performTransferWithDatabase(fromUsername, toUsername, amount, request);

            if (transferSuccessful) {
                response.sendRedirect("bankbalance.jsp");
                return;
            } else {
                message = (String) request.getAttribute("message");
                if (message == null) {
                    message = "Transfer failed. Please check your input.";
                }
            }
        } catch (NumberFormatException e) {
            message = "Invalid amount format.";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("/bank/transferpage.jsp").forward(request, response);
    }

    private boolean performTransferWithDatabase(String fromUsername, String toUsername, double amount, HttpServletRequest request) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean success = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "SELECT amount FROM users WHERE username = ?";
            stmt = conn.prepareStatement(sql);

            conn.setAutoCommit(false);

            stmt.setString(1, fromUsername);
            rs = stmt.executeQuery();
            double fromBalance = 0.0;
            if (rs.next()) {
                fromBalance = Double.parseDouble(rs.getString("amount"));
            } else {
                request.setAttribute("message", "Account not found: " + fromUsername);
                return false;
            }
            rs.close();

            stmt.setString(1, toUsername);
            rs = stmt.executeQuery();
            double toBalance = 0.0;
            if (rs.next()) {
                toBalance = Double.parseDouble(rs.getString("amount"));
            } else {
                request.setAttribute("message", "Account not found: " + toUsername);
                return false;
            }
            rs.close();

            if (fromBalance >= amount) {
                double newFromBalance = fromBalance - amount;
                double newToBalance = toBalance + amount;

                sql = "UPDATE users SET amount = ? WHERE username = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, String.valueOf(newFromBalance));
                stmt.setString(2, fromUsername);
                int rowsUpdatedFrom = stmt.executeUpdate();

                stmt.setString(1, String.valueOf(newToBalance));
                stmt.setString(2, toUsername);
                int rowsUpdatedTo = stmt.executeUpdate();

                if (rowsUpdatedFrom > 0 && rowsUpdatedTo > 0) {
                    conn.commit();
                    success = true;
                } else {
                    conn.rollback();
                    request.setAttribute("message", "Failed to update one or both accounts.");
                }
            } else {
                request.setAttribute("message", "Insufficient balance in account: " + fromUsername);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred: " + e.getMessage());
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }
}
