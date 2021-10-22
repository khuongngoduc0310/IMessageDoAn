package ModelDAO;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import Model.Message;


public class MessageDAO {
	
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
	public List<Message> getMessages(int sendID, int receiveID) {
		try {
			String sql = "select * from Message where (From_ID = ? and To_ID = ?) or (From_ID = ? and To_ID = ?) order by Time";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1,sendID+"");
			statement.setString(2, receiveID+"");
			statement.setString(3, receiveID+"");
			statement.setString(4,sendID+"");
			ResultSet rs = statement.executeQuery();
			List<Message> messages = new ArrayList<Message>();
			while(rs.next()) {
				Integer messID = rs.getInt("Message_ID");
				Integer fr_ID = rs.getInt("From_ID");
				Integer to_ID = rs.getInt("To_ID");
				Timestamp time = rs.getTimestamp("Time");
				String content = rs.getNString("Message_Content");
				messages.add(new Message(messID, fr_ID, to_ID, time.toLocalDateTime(), content));
			}
			return messages;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean postMessage(Message message) {
		try {
			String sql = "insert into Message values (?, ?, ?, ?)";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1,message.getFrom_ID()+"");
			statement.setString(2,message.getTo_ID()+"");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			statement.setString(3, message.getTimeSent().format(formatter));
			statement.setNString(4,message.getContent());
			Integer count = statement.executeUpdate();
			return count > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
