package cargo.reservation.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cargo.common.DTO.ItemsDTO;
import cargo.common.DTO.ReservationDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.DAO.ReservationDAO;

public class reserveProAction implements Action{
	
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	request.setCharacterEncoding("UTF-8");

	
	ActionForward forward = new ActionForward();
	forward.setRedirect(false);
	forward.setAjax(false);
	
	SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String today = formatter.format(new java.util.Date());
    
    
    String house = request.getParameter("house");
    ReservationDAO dao = new ReservationDAO();
	
	ArrayList<ItemsDTO> rList = dao.getCurReservation(house);
	ArrayList<ReservationDTO> rList2 = dao.getReservation(house);
	
	
	ArrayList<String> sdayList = new ArrayList<>();
	
	for(int i=0;i<rList.size();i++){
		ItemsDTO idto = rList.get(i);
		String start_day = formatter.format(idto.getStart_day());
		sdayList.add(start_day);
	}
	
	for(int i=0;i<rList2.size();i++){
		ReservationDTO rdto = rList2.get(i);
		String start_day = formatter.format(rdto.getStart_day());
		sdayList.add(start_day);
	}
	
	ArrayList<String> edayList = new ArrayList<>();
	
	for(int i=0;i<rList.size();i++){
		ItemsDTO idto = rList.get(i);
		String end_day = formatter.format(idto.getEnd_day());
		edayList.add(end_day);
	}
	
	for(int i=0;i<rList2.size();i++){
		ReservationDTO rdto = rList2.get(i);
		String end_day = formatter.format(rdto.getEnd_day());
		edayList.add(end_day);
	}
	
	
	

    request.setAttribute("res_day", today);
    
	
    request.setAttribute("sList", sdayList);
    request.setAttribute("eList", edayList);
    
	
	
	forward.setPath("../reservation/reservePro.jsp");
	return forward;
	}

}
