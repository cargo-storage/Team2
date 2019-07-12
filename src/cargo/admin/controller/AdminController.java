package cargo.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.admin.action.AdminAllInfoAction;
import cargo.admin.action.AdminEachInfoAction;
import cargo.admin.action.AdminMemberAction;
import cargo.admin.action.AdminOverdueAction;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;


public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String contextPath=request.getContextPath();
		
		//가상요청 주소 가져오기
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
		System.out.println(RequestURI.lastIndexOf("/"));
		
		String command=RequestURI.substring(RequestURI.lastIndexOf("/"));
		System.out.println(command);
		
		ActionForward forward = null;
		Action action= null;
		try {
			//관리자 메인 페이지
			if("/admin_main".equals(command)){
				action = new AdminAllInfoAction();
				forward = action.execute(request, response);
				
			//각 상세 페이지 (예약, 창고 현황,  완료)
			}else if("/listTables".equals(command)){
				action = new AdminEachInfoAction();
				forward = action.execute(request, response);
			
			//맴버 관리 페이지
			}else if("/member_admin".equals(command)){
				action = new AdminMemberAction();
				forward = action.execute(request, response);
			
			//연체 관리 페이지
			}else if("/overdue_admin".equals(command)){
				action = new AdminOverdueAction();
				forward = action.execute(request, response);
			}
			
			//모든 과정 후 페이지 이동부분
			if(forward !=null){
				if(forward.isAjax()){
					//Ajax방식이였으면 이동시키지 말아야합니다.
				}else if(forward.isRedirect()){
					//sendRedirect 방식으로 보내는 경우
					System.out.println("sendRedirect");
					response.sendRedirect(forward.getPath());
				}else{
					//Dispatcher방식으로 보낼 때 forwarding 해준다
					System.out.println("Dispatcher");
					RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
			
		} catch (Exception e) {
			System.out.println("AdminController err: "+e.getMessage());
			e.printStackTrace();
		}
	}

}
