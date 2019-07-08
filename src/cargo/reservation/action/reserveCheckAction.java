package cargo.reservation.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.ReservationDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class reserveCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ReservationDTO rsdto = new ReservationDTO();
		
		String email = request.getParameter("email");
		String house = request.getParameter("house");
		Timestamp start_day = Timestamp.valueOf(request.getParameter("start_day")+" 00:00:00");
		Timestamp end_day = Timestamp.valueOf(request.getParameter("end_day")+" 00:00:00");
		Timestamp res_day = Timestamp.valueOf(request.getParameter("res_day")+" 00:00:00");
		int payment = Integer.parseInt(request.getParameter("payment"));
		
		System.out.println();
		
		 rsdto.setEmail(email);
		 rsdto.setHouse(house);
		 rsdto.setStart_day(start_day);
		 rsdto.setEnd_day(end_day);
		 rsdto.setRes_day(res_day);
		 rsdto.setPayment(payment);
		 
		
		ReservationDAO rsdao = new ReservationDAO();
		rsdao.rsCheck(rsdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setAjax(false);
		
		forward.setPath("../reservation/reservePro.jsp");
		return forward;
	}

}
