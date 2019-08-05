package cargo.market.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_itemDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class UploadPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MarketDAO mdao = new MarketDAO();
		List<M_itemDTO> idto = mdao.selectAllItems();
		System.out.println(idto.get(0).getItem());
		
		request.setAttribute("itemList", idto);
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_post.jsp");
		return forward;
	}

}
