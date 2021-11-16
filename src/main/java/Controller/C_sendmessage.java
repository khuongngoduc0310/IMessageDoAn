package Controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BEAN.Message;
import Model.DO.sendmessageDO;

/**
 * Servlet implementation class sendmessageservlet
 */
@WebServlet("/C_sendmessage")
public class C_sendmessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public C_sendmessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String receiveID = request.getParameter("receiveID");
		String sendID = request.getParameter("sendID");
		String content = request.getParameter("messContent");
		System.out.println(content);
		sendmessageDO mess = new sendmessageDO();
		Message message = new Message(-1, Integer.parseInt(sendID), Integer.parseInt(receiveID), LocalDateTime.now(), content );
		mess.postMessage(message);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
