package cargo.admin.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.DAO.ReservationDAO;

public class AdminExtendReservAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("path", request.getParameter("path"));
		String jsonString = request.getParameter("result");
		
		JSONParser ps = new JSONParser();
		
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) ps.parse(jsonString);
		String end_day = map.get("end_day").toString();
		String house = map.get("house").toString();
		
		System.out.println(end_day +" "+ house);
		
		ReservationDAO rdao = new ReservationDAO();
		request.setAttribute("map", map);
		request.setAttribute("diableRanges", rdao.disabledMultipleRangesCalendar(end_day, house));
		
		ActionForward forward = new ActionForward();
		forward.setAjax(false);
		forward.setRedirect(false);
		forward.setPath("../reservation/reserveExtend.jsp");
		
		return forward;
	}

}
