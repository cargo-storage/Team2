package cargo.reservation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.WarehouseDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class reserveProAction implements Action{
	
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		WarehouseDTO wdto = new WarehouseDTO();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setAjax(false);
		
		forward.setPath("../reservation/reservePro.jsp");
		return forward;
	}

}
