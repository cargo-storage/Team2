package cargo.reservation.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import cargo.common.DTO.ReservationDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;


public class ResInfoMoreAction implements Action {


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		ActionForward forward = new ActionForward();
		forward.setAjax(true);
	
		
		JSONObject resObj = new JSONObject();
		JSONArray resArray = new JSONArray();
		
		String house = request.getParameter("house");
		
		ReservationDAO dao = new ReservationDAO();
		ArrayList<ReservationDTO> rList = dao.getReservation(house);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0; i<rList.size();i++){
			
			ReservationDTO rDTO = rList.get(i);
			JSONObject aHouse = new JSONObject();
			
			aHouse.put("email", rDTO.getEmail());
			aHouse.put("end_day", dateFormat.format(rDTO.getEnd_day()));
			aHouse.put("house", rDTO.getHouse());
			aHouse.put("num", Integer.toString(rDTO.getNum()));
			aHouse.put("payment", Integer.toString(rDTO.getPayment()));
			aHouse.put("res_day", dateFormat.format(rDTO.getRes_day()));
			aHouse.put("start_day", dateFormat.format(rDTO.getStart_day()));
			
			resArray.add(aHouse);
			
			resObj.put("reservations", resArray);
			
			
		}
		response.getWriter().print(resObj);
		return forward;
		
	}

}
