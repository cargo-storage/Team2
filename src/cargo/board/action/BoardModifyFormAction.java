package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardqDAO;
import cargo.common.DTO.BoardqDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class BoardModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int no=0;
		String name = request.getParameter("name");
		if(request.getParameter("no") == null) {
		    response.sendRedirect(request.getContextPath()+"/bo/QuestionListAction.bo");
		}else {
		   no = Integer.parseInt(request.getParameter("no"));
		     
		    BoardqDAO bqDAO = new BoardqDAO();
			BoardqDTO bqDTO = bqDAO.getBoardq(no);
			request.setAttribute("bqDTO", bqDTO);
			
			ActionForward forward = new ActionForward();	
			forward.setPath("../board/QuestionModify.jsp");  
			
			return forward;
		
	}
		return null;
 
	}
}