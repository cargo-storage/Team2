package cargo.market.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_orderDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class OrderConfirmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String order_id = (String) request.getAttribute("order_id");
		
		MarketDAO mdao = new MarketDAO();
		List<M_orderDTO> oLIst = mdao.getOrders(order_id);
		request.setAttribute("olist", oLIst);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_payConfirm.jsp");
		
		return forward;
	}

}
