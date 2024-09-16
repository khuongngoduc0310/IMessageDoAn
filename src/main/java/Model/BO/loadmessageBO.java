package Model.BO;

import java.util.ArrayList;
import java.util.List;

import Model.BEAN.Message;
import Model.DAO.MessageDAO;

public class loadmessageBO {
	public List<Message> getMessages(int sendID, int receiveID){
		MessageDAO mess= new MessageDAO();
		return mess.getMessages(sendID, receiveID);
		
	}

}
