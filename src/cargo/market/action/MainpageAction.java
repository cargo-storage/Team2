package cargo.market.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class MainpageAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("UTF-8");
      MarketDAO mdao = new MarketDAO();
      
      
      ArrayList<M_boardDTO> boardList1 = mdao.selectBList();
      ArrayList<M_boardDTO> boardList = new ArrayList<>();
      
      for (int i = 0; i < 3; i++) {
         M_boardDTO mt = new M_boardDTO();
         mt= boardList1.get(i);
         boardList.add(mt);
      }
      
      request.setAttribute("boardList", boardList);
      
      ActionForward forward = new ActionForward();
      
      String login = request.getParameter("login");
      
      if(login=="true")	forward.setPath("../index.jsp?login=true");
  	  else	forward.setPath("../index.jsp");
      
      forward.setRedirect(false);
      return forward;
      
   }

}