package ModelDAO;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.User;

public class LoginDAO {

	java.sql.Connection con;
	public void connectDatabase() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		con = DriverManager.getConnection(
				"jdbc:sqlserver://localhost;DatabaseName=IMessage;" + "integratedSecurity=false","sa","123456");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public User checkLogin(String username, String password) {
		try {
			String sql = "select * from WebUser where Username = ? and Password = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				Integer userID = rs.getInt("User_ID");
				String fullname = rs.getNString("Fullname");
				boolean gender = rs.getBoolean("Gender");
				Integer age = rs.getInt("Age");
				User user = new User(userID, fullname,gender,age,username,password);
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
