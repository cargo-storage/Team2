package cargo.market.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;
import cargo.market.DTO.Cart;
import cargo.market.DTO.CartDTO;

public class OrderCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		MarketDAO mdao = new MarketDAO();
		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		List<CartDTO> clist = cart.getItemList();
		
		if(request.getParameter("id")==""){// 카트전체주문
			
			System.out.println("전체주문");
			mdao.insertMOrder(email, clist);
			
		}else{// 부분주문 아이디값 있음!
			
			System.out.println("선택주문");
			String id = request.getParameter("id");
			String[] idArray = id.split(",");
			mdao.insertMOrder(email, clist, idArray);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_payConfirm.jsp");
		
		return forward;
	}

}
