package Model.BO;

import Model.BEAN.Message;
import Model.DAO.MessageDAO;

public class sendmessageBO {
	public boolean postMessage(Message message) {
		MessageDAO mess= new MessageDAO();
		return mess.postMessage(message);
	}

}
