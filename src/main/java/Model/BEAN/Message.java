package Model.BEAN;

import java.time.LocalDateTime;

public class Message {
	private int Message_ID;
	private int From_ID;
	private int To_ID;
	private LocalDateTime TimeSent;
	private String Content;
	

	public Message(int message_ID, int from_ID, int to_ID, LocalDateTime timeSent, String content) {
		Message_ID = message_ID;
		From_ID = from_ID;
		To_ID = to_ID;
		TimeSent = timeSent;
		Content = content;
	}
	public int getFrom_ID() {
		return From_ID;
	}
	public void setFrom_ID(int from_ID) {
		From_ID = from_ID;
	}
	public int getTo_ID() {
		return To_ID;
	}
	public void setTo_ID(int to_ID) {
		To_ID = to_ID;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getMessage_ID() {
		return Message_ID;
	}
	public void setMessage_ID(int message_ID) {
		Message_ID = message_ID;
	}
	public LocalDateTime getTimeSent() {
		return TimeSent;
	}
	public void setTimeSent(LocalDateTime timeSent) {
		TimeSent = timeSent;
	}
}
