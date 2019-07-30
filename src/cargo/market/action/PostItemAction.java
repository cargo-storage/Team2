package cargo.market.action;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.BoardDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class PostItemAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("PostItemAction실행");
		
		request.setCharacterEncoding("UTF-8");
		
		BoardDTO bb = new BoardDTO();
	
		bb.setName(request.getParameter("name"));
		bb.setEmail(request.getParameter("email"));
		bb.setWebsite(request.getParameter("website"));
		bb.setMessage(request.getParameter("message"));	
		
		MarketDAO mdao = new MarketDAO();
		mdao.postItem(bb);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("../market/.jsp");
		return forward;
	}

	
	
	
	
}
