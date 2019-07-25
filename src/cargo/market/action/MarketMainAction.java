package cargo.market.action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class MarketMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("왔느뇨?");
		request.setCharacterEncoding("UTF-8");
		String category;
		
		if(request.getParameter("cate") == null){
			 category = "all";
		}else{
			category = request.getParameter("cate");
		}
		
		MarketDAO mdao = new MarketDAO();
		ArrayList<M_boardDTO> boardList = mdao.selectBList(category);
		
		request.setAttribute("category", "market_list.jsp");
		request.setAttribute("boardList", boardList);
		
		System.out.println(category);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_main.jsp");
		
		return forward;
	}

}
