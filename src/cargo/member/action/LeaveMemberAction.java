package cargo.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class LeaveMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		String pwd = request.getParameter("pwd");

		MemberDAO mdao = new MemberDAO();

		int state = mdao.deleteMember(mdto.getEmail(), pwd);
		
		ActionForward forward = null;
		
		if (state == 0) { // 실패했을 때
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('보관과 예약 정보가 있어 \n탈퇴가 실패했습니다.');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println("회원 탈퇴 오류");
			out.close();
			
			return null;
		} else { // 성공했을 때
			forward =  new ActionForward();
			String path = request.getContextPath();
			forward.setRedirect(true);
			
			forward.setPath(path+"/index.jsp");
		}
		return forward;
	}

}
