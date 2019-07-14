package cargo.reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.action.ResInfoAction;
import cargo.reservation.action.ResInfoMoreAction;
import cargo.reservation.action.reserveAction;
import cargo.reservation.action.reserveCheckAction;
import cargo.reservation.action.reserveProAction;

public class ReserveController extends HttpServlet{
	private static final long serialVersionUID = 1L;

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
		
		String RequestURI = request.getRequestURI();
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
		
		ActionForward forward = null;
		Action action= null;
		
		try {
			
			if(command.equals("/goIndex.me")){ // 로그인 필요!
				forward = new ActionForward();
				forward.setPath("../index.jsp");
				forward.setRedirect(true);
			}else if(command.substring(0,8).equals("/info.me")){ // 예약페이지 메인 - 창고현황
				action = new ResInfoAction();
				forward = action.execute(request, response);
			}else if(command.equals("/moreInfo.me")){ // 공간별 상세정보
				action = new ResInfoMoreAction();
				forward = action.execute(request, response);
			}else if(command.equals("/reservePro.me")){
	            action = new reserveProAction();
	            forward = action.execute(request, response);
	        }else if(command.equals("/reserveCheck.me")){
				action = new reserveCheckAction();
				forward = action.execute(request, response);
			}else if(command.equals("/doResPay.me")){
				forward = new ActionForward();
				forward.setPath("../reservation/reservePayPro.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/reserveConfirm.me")){
				action = new reserveAction();
				forward = action.execute(request, response);
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
			System.out.println("ReserveController 에러" + e);
			e.printStackTrace();
			
		}
	}

}
