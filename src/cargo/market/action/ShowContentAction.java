package cargo.market.action;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardJoinDTO;
import cargo.common.DTO.M_board_replyDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class ShowContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		int board_no = Integer.parseInt(request.getParameter("no"));
		
		MarketDAO mdao = new MarketDAO();
		M_boardJoinDTO mjdto = mdao.selectJoinItem(board_no);
		ArrayList<M_board_replyDTO> replyList = mdao.selectAllComment(board_no);
		int count = mdao.getTotalComment(board_no);
		
		request.setAttribute("mjdto", mjdto);
		request.setAttribute("replyList", replyList);
		request.setAttribute("totalComment", count);
		
		
		/* 최근 본 아이템 쿠키 설정 */
		M_boardJoinDTO cookieDTO;
		
		ArrayList<M_boardJoinDTO> cookies = new ArrayList<>();
		Cookie[] ckList = request.getCookies();
		System.out.println(ckList.length);
		
		if(ckList.length != 0){
			for(int i=ckList.length-1;i>=0;i--){
				Cookie ck = ckList[i];
				String name = URLDecoder.decode(ck.getName(), "utf-8");
				System.out.println("cookieName"+name);
				if(name.substring(0, 2).equals("iN")){
					int bno = Integer.parseInt(URLDecoder.decode(ck.getValue(), "utf-8"));
					System.out.println("bno"+bno);
					cookieDTO = mdao.selectJoinItem(bno);
					cookies.add(cookieDTO);
				}
				if(cookies.size()>4) break;
			}
		}
		
		System.out.println(cookies.size());
		
		request.setAttribute("cookies", cookies);
		
		Cookie c = new Cookie("iN"+board_no, request.getParameter("no"));
		c.setMaxAge(60*60*24);
		response.addCookie(c);
		
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("../market/market_content.jsp");
		
		return forward;
	}

}
