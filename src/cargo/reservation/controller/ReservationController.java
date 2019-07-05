package cargo.reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.action.ResInfoAction;
import cargo.reservation.action.ResInfoMoreAction;

@WebServlet("/reserve/*")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String path = request.getPathInfo();
		System.out.println(path);
		
		ActionForward forward = null;
		Action action = null;
		
		
		if(path.equals("/info.do")){
			try {
				action = new ResInfoAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("error /info.do");
				e.printStackTrace();
			}
		}else if(path.equals("/moreInfo")){
			try {
				action = new ResInfoMoreAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("error /moreinfo");
				e.printStackTrace();
			}
		}
		
		
		if(forward != null){
			if(forward.isAjax()){}
			else{
				if(forward.isRedirect()){
					response.sendRedirect(forward.getPath());
				}else{
					RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
					dis.forward(request, response);
				}
			}
		}
	}
	
	
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	

}
