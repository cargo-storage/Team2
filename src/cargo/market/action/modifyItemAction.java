package cargo.market.action;

import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import cargo.common.DTO.BoardDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class modifyItemAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		
		MarketDAO mdao = new MarketDAO();
		BoardDTO bb = new BoardDTO();
		
		boolean result = false;
		
		int no = Integer.parseInt(request.getParameter("no"));

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

			
			bb.setNo(no);					
			
			bb.setItem(multi.getParameter("item")); 
			bb.setTitle(multi.getParameter("title"));
			
			bb.setContent(multi.getParameter("content"));
			
			System.out.println(multi.getParameter("item"));
			
			Enumeration files = multi.getFileNames();
			
			String file1 = (String)files.nextElement();
			filename = multi.getFilesystemName(file1);
			originfilename = multi.getOriginalFileName(file1);
			
			bb.setPath(filename);
			
			result = mdao.modifyItem(bb);
			
			
			if(result==false) {
				System.out.println("Board Modify Fail");
				return null;
			}
			
			ActionForward forward=new ActionForward();
//			forward.setRedirect(true);
			forward.setPath("../mk/showcontent.do?no="+no);
			return forward;	
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
