package cargo.market.action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;
import cargo.market.DAO.Paging;

public class MarketMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String category = "all";
		String keyWord = "";
		int curPage = 1;
		
		if(request.getParameter("cate") != null) category = request.getParameter("cate");
		if(request.getParameter("keyword") != null) keyWord = request.getParameter("keyword");
		if(request.getParameter("page")!= null) curPage = Integer.parseInt(request.getParameter("page"));
		
		
		MarketDAO mdao = new MarketDAO();
		
		ArrayList<M_boardDTO> boardList = mdao.selectBList(category, keyWord);
		
		request.setAttribute("category", category);
		request.setAttribute("boardList", boardList);
		
		
		/*Paging paging = new Paging();
		ArrayList<Integer> pageList = new ArrayList<>();
		
		paging.makeBlock(curPage);
		
		Integer blockStartNum = paging.getBlockStartNum();
		Integer blockLastNum = paging.getBlockLastNum();
		Integer lastPageNum = paging.getLastPageNum();
		
		pageList.add(lastPageNum);
		pageList.add(blockLastNum);
		pageList.add(blockStartNum);
		
		
		request.setAttribute("pageList", pageList);*/
		
		Paging paging = new Paging();
		paging.setPageNo(1);
		paging.setPageSize(10);
		paging.setTotalCount();

		request.setAttribute("paging", paging);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_main.jsp");
		
		return forward;
	}

}
