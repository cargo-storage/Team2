package cargo.market.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardJoinDTO;
import cargo.common.DTO.M_board_replyDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class ShowContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		int board_no = Integer.parseInt(request.getParameter("no"));
		
		MarketDAO mdao = new MarketDAO();
		M_boardJoinDTO mjdto = mdao.selectJoinItem(board_no);
		ArrayList<M_board_replyDTO> replyList = mdao.selectAllComment(board_no);
		
		request.setAttribute("mjdto", mjdto);
		request.setAttribute("replyList", replyList);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("../market/market_content.jsp");
		
		return forward;
	}

}
