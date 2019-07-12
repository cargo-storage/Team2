package cargo.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminModalAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cate = request.getParameter("cate");
		String email = request.getParameter("email");
		String house = request.getParameter("house");
		
		JSONObject jobj=null;
		AdminDAO dao = new AdminDAO();
		
		if ("overdue".equals(cate)) {
			jobj = new JSONObject(dao.getOverdueInfo(email, house));
		}else if("예약".equals(cate)){
			jobj = new JSONObject(dao.getInfo("reservation", email, house));
		}else if("보관".equals(cate)){
			jobj = new JSONObject(dao.getInfo("items", email, house));
		}else if("완료".equals(cate)){
			jobj = new JSONObject(dao.getInfo("closed", email, house));
		}else if("member".equals(cate)){
			jobj = new JSONObject(dao.getMemberInfo(email));
		}
		System.out.println(jobj.toJSONString());
		
		response.setContentType("application/json");
		response.getWriter().println(jobj.toJSONString());
		
		ActionForward forward = new ActionForward();
		forward.setAjax(true);
		
		return forward;
	}

}
