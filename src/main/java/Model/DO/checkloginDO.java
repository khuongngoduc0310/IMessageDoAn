package Model.DO;

import Model.BEAN.User;
import Model.DAO.LoginDAO;

public class checkloginDO {
public User checkLogin(String username,String password) {
	LoginDAO log = new LoginDAO();
	return log.checkLogin(username, password);
}
}
