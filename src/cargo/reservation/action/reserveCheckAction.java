package cargo.reservation.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.ReservationDTO;
import cargo.common.DTO.WarehouseDTO;

public class reserveCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ReservationDTO rsdto = new ReservationDTO();
		
		String email = request.getParameter("email");
		String house = request.getParameter("house");
		String start_day = request.getParameter("start_day");
		String end_day = request.getParameter("end_day");
		String res_day = request.getParameter("res_day");
		int payment = Integer.parseInt(request.getParameter("payment"));
		
		
		/*
		 * rsdto.setEmail(email); rsdto.setHouse(house); rsdto.setStart_day(start_day);
		 * rsdto.setEnd_day(end_day); rsdto.setRes_day(res_day);
		 * rsdto.setPayment(payment);
		 */
		System.out.println(email);
		System.out.println(house);
		System.out.println(start_day);
		System.out.println(end_day);
		System.out.println(res_day);
		System.out.println(payment);
		
		
		reserveDAO rsdao = new reserveDAO();
		rsdao.rsCheck(rsdto);
		
		
		//정보는 request영역에 지정 해 주었으니 이제 어떻게, 어디로 이동할 지 설정해 봅시다.
		ActionForward forward = new ActionForward();
		// 리다이렉트 방식으로 보내지 않을것임!
		// Redirect방식으로 보낼것이냐 안보낼것이냐?
		// 기본적인 경우: DB에 변화가 있다? forward.setRedirect(true) ex)회원 추가
		forward.setRedirect(false);
		//ajax방식으로 온것도 아니니
		forward.setAjax(false);
		
		/*
		 * Redirect방식으로 보낼때와 Dispatcher방식으로 보낼때 시작하는 폴더가 다릅니다. Redirect방식은
		 * 클라이언트에게 넘겨줘서 클라이언트가 다시 다른 사이트로 가므로 프로젝트에서 가장 밖? 에서 접근하므로
		 * contextPath부터 시작함니다
		 * 
		 * Dispatcher방식은 바로 서버에서 바로 다른 페이지를 열어주므로 어노테이션 혹은 xml페이지에서 설정해줬던 경로에서 그
		 * 페이지를 열게됩니다. ex) @WebServlet({"/ex/*"}) 이거였으므로 WebContent 폴더 안에 ex폴더에서
		 * 다른 페이지를 연다고 생각하심될듯.
		 */
		forward.setPath("./reservePro.jsp");
		return forward;
	}

}
