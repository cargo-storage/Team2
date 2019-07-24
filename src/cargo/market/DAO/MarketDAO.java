package cargo.market.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.ItemsDTO;
import cargo.common.DTO.M_boardDTO;
import cargo.common.DTO.M_boardJoinDTO;
import cargo.common.DTO.M_board_replyDTO;
import cargo.common.DTO.M_itemDTO;
import cargo.common.DTO.ReservationDTO;
import cargo.common.DTO.WarehouseDTO;

public class MarketDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	private void getConnection(){
		
		Context init;
		try {
			init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			System.out.println("Error in getConnection()");
			e.printStackTrace();
		}
		
	}
	
	private void freeResource(){
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void postItem(){ // m_board insert 글쓰기 - 파일업로드 해야함
		
	}
	
	public void modifyItem(){ // m_board 글수정
		
	}
	
	public void deleteItem(){ // m_board 글삭제
		
	}
	
	public int getTotalItem(){// m_board 게시글 총 갯수 불러오기
		return 0;
	}
	
	public ArrayList<M_boardDTO> selectAllItem(){ // m_board 목록 불러오기 
		return null;
	}
	
	public M_boardDTO selectBoardItem(){ // board 테이블 1개
		return null;
	}
	
	public M_itemDTO selectItem(){ // item 테이블 1개
		return null;
	}
	
	public M_boardJoinDTO selectJoinItem(){ // board, item JOIN 객체 반환
		return null;
	}
	
	public void addComment(){// 댓글 등록
		
	}
	
	public ArrayList<M_board_replyDTO> selectAllComment(){// 댓글 등록
		return null;
	}
	
	public void orderItem(){ // 아이템 주문 - 결제 후 order 테이블로 삽입. 
		
	}
	
}
