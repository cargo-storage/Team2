package cargo.reservation.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reserveController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String RequestURI=request.getRequestURI();
		
		String contextPath=request.getContextPath();
		
		String command=RequestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action= null;
		
		try {
			if(command.equals("/reservation.me")){
				action = new reserveboxAction();
				forward = action.execute(request, response);
			}else if(command.equals("/reservePro.me")){
				action = new reserveProAction();
				forward = action.execute(request, response);
			}else if(command.equals("/reserveCheck.me")){
				action = new reserveCheckAction();
				forward = action.execute(request, response);
				System.out.println(command);
			}
			
			
			//모든 과정 후 페이지 이동부분
			if(forward !=null){
				if(forward.isAjax()){
					//Ajax방식이였으면 이동시키지 말아야합니다.
				}else if(forward.isRedirect()){
					//sendRedirect 방식으로 보내는 경우
					response.sendRedirect(forward.getPath());
				}else{
					//Dispatcher방식으로 보낼 때 forwarding 해준다
					RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
			
		} catch (Exception e) {
			System.out.println("controller 에러" + e);
			e.printStackTrace();
			
		}
	}

}
