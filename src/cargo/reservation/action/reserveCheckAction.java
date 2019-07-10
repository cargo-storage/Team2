package cargo.reservation.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.ReservationDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.DAO.ReservationDAO;

public class reserveCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ReservationDTO rsdto = new ReservationDTO();
		
		String email = request.getParameter("email");
		String house = request.getParameter("house");
		Timestamp start_day = Timestamp.valueOf(request.getParameter("start_day")+" 00:00:00");
		Timestamp end_day = Timestamp.valueOf(request.getParameter("end_day")+" 00:00:00");
		Timestamp res_day = Timestamp.valueOf(request.getParameter("res_day")+" 00:00:00");
		
		rsdto.setEmail(email); 
		rsdto.setHouse(house); 
		rsdto.setStart_day(start_day);
		rsdto.setEnd_day(end_day); 
		rsdto.setRes_day(res_day);
		
		ReservationDAO rsdao1 = new ReservationDAO();
		
		long diffSec = (end_day.getTime() - start_day.getTime())/1000 ;       
		long total = diffSec/(60 * 60 * 24); 
		System.out.println("일수 = " + total);  

		
		System.out.println(total);
		
		int payment = (int)total * rsdao1.rsPayment(house);
		rsdto.setPayment(payment);
		
		
		 rsdto.setEmail(email);
		 rsdto.setHouse(house);
		 rsdto.setStart_day(start_day);
		 rsdto.setEnd_day(end_day);
		 rsdto.setRes_day(res_day);
		 rsdto.setPayment(payment);
		 
		
		request.setAttribute("totalDay", total);
		request.setAttribute("payment", payment);
		
		SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        String today = formatter.format(new java.util.Date());
        request.setAttribute("today", today);
		
        /*
		 ReservationDAO rsdao = new ReservationDAO(); 
		 rsdao.rsCheck(rsdto);
		 */
        
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setAjax(false);
		
		forward.setPath("../reservation/reservePay.jsp");
		return forward;
	}

}
