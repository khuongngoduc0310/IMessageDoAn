package Model.DO;

import Model.BEAN.Message;
import Model.DAO.MessageDAO;

public class sendmessageDO {
	public boolean postMessage(Message message) {
		MessageDAO mess= new MessageDAO();
		return mess.postMessage(message);
	}

}
