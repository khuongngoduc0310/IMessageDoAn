package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BEAN.Message;
import Model.BO.loadmessageBO;

/**
 * Servlet implementation class loadmessageservlet
 */
@WebServlet("/C_loadmessage")
public class C_loadmessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public C_loadmessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String receiveID = request.getParameter("receiveID");
		String sendID = request.getParameter("sendID");
		loadmessageBO mess = new loadmessageBO();
		List<Message> messages = mess.getMessages(Integer.parseInt(sendID), Integer.parseInt(receiveID));
		String data = "";
		if (messages != null)
		for (Message message : messages){
			if (message.getFrom_ID() == Integer.parseInt(sendID))
				data += "<div class='col-message-sent'><div class='message-sent'><p>"+message.getContent()+"</p></div></div>";
				else
					data += "<div class='col-message-received'><div class='message-received'><p>"+message.getContent()+"</p></div></div>";
		}
		PrintWriter out = response.getWriter();
		out.println(data);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
