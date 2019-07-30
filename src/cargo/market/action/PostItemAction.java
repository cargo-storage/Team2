package cargo.market.action;

import java.sql.Timestamp;
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
	
		bb.setItem(request.getParameter("item"));
		bb.setTitle(request.getParameter("title"));
		bb.setImage(request.getParameter("image"));
		bb.setContent(request.getParameter("content"));
		bb.setDate(new Timestamp(System.currentTimeMillis()));
		
		MarketDAO mdao = new MarketDAO();
		mdao.postItem(bb);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/mk/market.do");
		return forward;
	}
	
	
	
}
