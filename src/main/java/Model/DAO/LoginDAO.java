package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;

import Model.BEAN.User;

public class LoginDAO {
      Connection con;
	void connectDatabase() {
		try {
			SQLServerDriver a = new SQLServerDriver(); 
			System.out.println(a);
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionURL = "jdbc:sqlserver://DESKTOP-UPKO6D9\\\\SQLEXPRESS:1433;DatabaseName=IMessage;integratedSecurity=false;";
			con = DriverManager.getConnection(connectionURL,"sa","160501");
			} 
		catch (Exception e) {
			}
	}
	public User checkLogin(String username, String password) {
		connectDatabase();
		try {
			String sql = "select * from UserI where Username = ? and Password = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				Integer userID = rs.getInt("User_ID");
				String fullname = rs.getNString("Full_name");
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
