package cargo.market.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.websocket.Transformation;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import cargo.common.DTO.BoardDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class PostItemAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		
		//리턴 시킬 객체를 준비
		ActionForward Forwardaction = new ActionForward();
		
		String uploadPath = request.getRealPath("market/uploaded");
		
		int size = 10*1024*1024;
		String item="";
		String title="";
		String content="";
		Timestamp date= new Timestamp(System.currentTimeMillis());
		String filename="";
		String originfilename="";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			
			item = multi.getParameter("item");
			title = multi.getParameter("title");
			content = multi.getParameter("content");	
			
						
			System.out.println("item");
			System.out.println("title");
			System.out.println("content");
			System.out.println("date");
			
			Enumeration files = multi.getFileNames();
			
			String file1 = (String)files.nextElement();
			filename = multi.getFilesystemName(file1);
			originfilename = multi.getOriginalFileName(file1);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		BoardDTO bb = new BoardDTO(item, title, content, date, filename);		
	
		System.out.println(uploadPath+"/"+filename);
		
		MarketDAO mdao = new MarketDAO();
		boolean b = mdao.postItem(bb);
		
		if(b) //디비에 게시물 넣었는지 확인
		{
			HttpSession session = request.getSession();
			session.setAttribute("listSuccess", bb);
			
			ActionForward forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/mk/market.do");
			return forward;	
			
		}else {
			String msg = "게시물 등록에 실패했습니다.";
			request.setAttribute("errMsg", msg);
			ActionForward forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Error.jsp");
			return forward;	
		
		}
		
	}
	
	
	
}
