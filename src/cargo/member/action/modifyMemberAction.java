package cargo.member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class ModifyMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		if(request.getParameter("page")==null) { //내정보 확인->정보수정 눌렸을 때
			ActionForward forward = new ActionForward();
			
			request.setAttribute("modifyCheck", 0);
			forward.setPath("../member/mypage.jsp?content=modifyMember.jsp");
			return forward; //바로 return하기 때문에 else 필요 없음
		}
		//정보 수정 하기 버튼 눌렸을 때
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		String roadAddr = request.getParameter("roadAddr");
		String detailAddr = request.getParameter("detailAddr");
		String email = request.getParameter("email");
		int admin = Integer.parseInt(request.getParameter("admin"));
		Timestamp reg_date = Timestamp.valueOf(request.getParameter("reg_date"));
		
		MemberDTO mdto = new MemberDTO(email, pwd, name, phone, postCode, roadAddr, detailAddr, admin, reg_date);
		MemberDAO mdao = new MemberDAO();
		
		int state = mdao.updateMember(mdto);
		
		ActionForward forward = null;
		
		if (state == 0) { // 실패했을 때
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('회원정보 수정에 실패했습니다. \n다시 시도해 주세요');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println("회원정보 수정 오류 ");
			out.close();

		} else { // 성공했을 때
			forward = new ActionForward();
			forward.setRedirect(true);
						
			HttpSession session = request.getSession();
			session.setAttribute("mdto", mdto);
			String path = request.getContextPath();
			forward.setPath("../member/mypage.jsp");
		}
		return forward;
	}
	
}
