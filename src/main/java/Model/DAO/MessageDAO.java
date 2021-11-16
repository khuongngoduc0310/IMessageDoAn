package Model.DAO;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;

import Model.BEAN.Message;


public class MessageDAO {
	
	java.sql.Connection con;
	public void connectDatabase() {
		try {
			SQLServerDriver a = new SQLServerDriver(); 
			System.out.println(a);
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionURL = "jdbc:sqlserver://DESKTOP-UPKO6D9\\\\SQLEXPRESS:1433;DatabaseName=IMessage;integratedSecurity=false;";
			con = DriverManager.getConnection(connectionURL,"sa","160501");
			} catch (Exception e) {
			System.out.println("Kết nối thất bại");
			}
	}
	public List<Message> getMessages(int sendID, int receiveID) {
		connectDatabase();
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
		connectDatabase();
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
