package cargo.reservation.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.WarehouseDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class ResInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ReservationDAO dao = new ReservationDAO();
		
		ArrayList<WarehouseDTO> hList = dao.getAllHouse();
		
		request.setAttribute("hList", hList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../reservation/reservation.jsp");
		
		return forward;
	}

}