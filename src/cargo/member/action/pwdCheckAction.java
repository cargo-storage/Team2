package cargo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class pwdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		String pastPwd = request.getParameter("pastPwd");
		
		ActionForward forward = new ActionForward();
		forward.setAjax(true);
		
	
		int state = 0; //0: 비밀번호 틀림, 1: 비밀번호 같음
		if(mdto.getPwd().equals(pastPwd))
			state =	1;
		
		response.getWriter().println(state);

		return forward;		
	}

}
