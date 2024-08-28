package backend;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class Profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/banking_app";
        String dbUser = "root";
        String dbPassword = "klu123";

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a connection
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL query to fetch user details based on username and password
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Create a User object and set its fields
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                // Set other fields as needed

                // Set user object in session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Forward to profile.jsp
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                // Invalid login
                response.sendRedirect("login.jsp?error=Invalid username or password");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Login failed", e);
        }
    }
    
    public class User {
        private int id;
        private String firstName;
        private String lastName;
        private String email;
        private String phone;
        private String username;
        // Add other fields as needed
    	public int getId() {
    		return id;
    	}
    	public void setId(int id) {
    		this.id = id;
    	}
    	public String getFirstName() {
    		return firstName;
    	}
    	public void setFirstName(String firstName) {
    		this.firstName = firstName;
    	}
    	public String getLastName() {
    		return lastName;
    	}
    	public void setLastName(String lastName) {
    		this.lastName = lastName;
    	}
    	public String getEmail() {
    		return email;
    	}
    	public void setEmail(String email) {
    		this.email = email;
    	}
    	public String getPhone() {
    		return phone;
    	}
    	public void setPhone(String phone) {
    		this.phone = phone;
    	}
    	public String getUsername() {
    		return username;
    	}
    	public void setUsername(String username) {
    		this.username = username;
    	}

        // Getters and setters for each field
        // ...
    }

}

