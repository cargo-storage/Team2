package cargo.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class EmailAuthAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String to_email = request.getParameter("email");
		
		MemberDAO mdao = new MemberDAO();
		String authNum = mdao.randomNum(); 
		
		int state = mdao.sendEmail(to_email, authNum);
		
		ActionForward forward = new ActionForward();
		
		JSONObject obj= new JSONObject();
		obj.put("state", state);
		obj.put("authNum", authNum);
		
		System.out.println(obj);
		response.setContentType("application/json");
		response.getWriter().println(obj.toJSONString());
		
		forward.setAjax(true); //ajax 방식이기 때문에 무조건 true
		
		if(state == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("authNum", authNum);
		}
		return forward;
	}
}
