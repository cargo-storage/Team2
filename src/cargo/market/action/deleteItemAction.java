package cargo.market.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class deleteItemAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		MarketDAO mdao = new MarketDAO();
		
		boolean result = false;
		
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		
		result = mdao.deleteItem(no);
		
		if(result == false) {
			System.out.println("board delete fail");
			return null;
		}
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("../mk/market.do");
		
		return forward;
	
	}	
		
}
	

