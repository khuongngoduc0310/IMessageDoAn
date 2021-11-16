package Model.DO;

import java.util.ArrayList;
import java.util.List;

import Model.BEAN.Message;
import Model.DAO.MessageDAO;

public class loadmessageDO {
	public List<Message> getMessages(int sendID, int receiveID){
		MessageDAO mess= new MessageDAO();
		return mess.getMessages(sendID, receiveID);
		
	}

}
