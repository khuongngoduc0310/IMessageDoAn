package Model;

import java.sql.Time;

public class Group_Message {
	private int Group_ID;
	private int Message_ID;
	private int From_ID;
	private Time TimeSent;
	private String Content;
	public int getGroup_ID() {
		return Group_ID;
	}
	public void setGroup_ID(int group_ID) {
		Group_ID = group_ID;
	}
	public int getMessage_ID() {
		return Message_ID;
	}
	public void setMessage_ID(int message_ID) {
		Message_ID = message_ID;
	}
	public int getFrom_ID() {
		return From_ID;
	}
	public void setFrom_ID(int from_ID) {
		From_ID = from_ID;
	}
	public Time getTimeSent() {
		return TimeSent;
	}
	public void setTimeSent(Time timeSent) {
		TimeSent = timeSent;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
}
