package cargo.market.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.BoardDTO;
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
	
	
	public void postItem(BoardDTO bb){ // m_board insert 글쓰기 - 파일업로드 해야함
		int num = 0;
		String sql="";
		try {
			getConnection();

			sql="insert into m_board(item,title,content,image,date) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bb.getItem());
			pstmt.setString(2, bb.getTitle());
			pstmt.setString(3, bb.getContent());
			pstmt.setString(4, bb.getImage());
			pstmt.setTimestamp(5, bb.getDate());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		
		
	}
	
	public void modifyItem(){ // m_board 글수정
		
	}
	
	public void deleteItem(){ // m_board 글삭제
		
	}
	
	public int getTotal(){// m_board 게시글 총 갯수 불러오기
		
		int count=0;
		
		try {
			
			getConnection();
			String sql = "SELECT count(*) FROM m_board";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt("count(*)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return count;
		
	}
	
	public ArrayList<M_boardDTO> selectBList(String category, String keyWord, int startRecNum, int recPerPage){ // m_board 목록 불러오기 - 카테고리, 검색 등 !

		ArrayList<M_boardDTO> boardList = new ArrayList<>();
		M_boardDTO bDTO;
		
		try {
			String sql ="";
			getConnection();
			
			switch (category) {
			
				case "all": sql = "SELECT * FROM m_board";
					break;
				case "fur": sql = "SELECT * FROM m_board WHERE item LIKE 'F%'";
					break;
				case "elec": sql = "SELECT * FROM m_board WHERE item LIKE 'E%'";
					break;
				case "mat": sql = "SELECT * FROM m_board WHERE item LIKE 'M%'";
					break;
				case "oth": sql = "SELECT * FROM m_board WHERE item LIKE 'O%'";
					break;
			}
			
			if(keyWord != ""){
				if(category.equals("all")) sql += " WHERE title LIKE '%"+keyWord+"%'";
				else sql +=  " AND title LIKE '%"+keyWord+"%'";
			}
				
			sql += " ORDER BY no DESC LIMIT ?, ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRecNum-1);
			pstmt.setInt(2, recPerPage);
			rs = pstmt.executeQuery();
			
			System.out.println(sql);
			
			while(rs.next()){
				bDTO = new M_boardDTO();
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getTimestamp("date"));
				bDTO.setImage(rs.getString("image"));
				bDTO.setItem(rs.getString("item"));
				bDTO.setNo(rs.getInt("no"));
				bDTO.setOnStock(rs.getInt("onStock"));
				bDTO.setTitle(rs.getString("title"));
				
				boardList.add(bDTO);
			}
			
		} catch (Exception e) {
			System.out.println("error in selectAllItem()");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return boardList;
		
		
	}
	
	public M_boardDTO selectBoardItem(){ // board 테이블 1개
		return null;
	}
	
	public M_itemDTO selectItem(String item){ // item 테이블 1개
		M_itemDTO iDTO = new M_itemDTO();
		
		try {
			getConnection();
			String sql = "SELECT * FROM m_item WHERE item=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				iDTO.setCategory(rs.getString("category"));
				iDTO.setItem(rs.getString("item"));
				iDTO.setName(rs.getString("name"));
				iDTO.setPrice(rs.getInt("price"));
				iDTO.setStock(rs.getInt("stock"));
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectItem :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return iDTO;
	}
	
	public ArrayList<M_itemDTO> selectAllItems(){ // item 테이블 전체
		ArrayList<M_itemDTO> list = new ArrayList<>();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM m_item";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				M_itemDTO iDTO = new M_itemDTO();
				
				iDTO.setCategory(rs.getString("category"));
				iDTO.setItem(rs.getString("item"));
				iDTO.setName(rs.getString("name"));
				iDTO.setPrice(rs.getInt("price"));
				iDTO.setStock(rs.getInt("stock"));
				
				list.add(iDTO);
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectAllItems :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return list;
	}//end of selelctAllItmes
	
	public M_boardJoinDTO selectJoinItem(int board_no){ // board, item JOIN 객체 반환
		
		M_boardJoinDTO bDTO = new M_boardJoinDTO();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM m_item JOIN m_board ON m_item.item = m_board.item WHERE m_board.no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				bDTO.setCategory(rs.getString("category"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getTimestamp("date"));
				bDTO.setImage(rs.getString("image"));
				bDTO.setItem(rs.getString("item"));
				bDTO.setName(rs.getString("name"));
				bDTO.setNo(rs.getInt("no"));
				bDTO.setOnStock(rs.getInt("onStock"));
				bDTO.setPrice(rs.getInt("price"));
				bDTO.setStock(rs.getInt("stock"));
				bDTO.setTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectJoinItem");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return bDTO;
	}
	
	
	public int getTotalComment(int board_no){ // 댓글 갯수 가져오기
		
		int count=0;
		
		try {
			
			getConnection();
			String sql = "SELECT count(*) FROM m_board_reply WHERE board_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt("count(*)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return count;
	}
	
	public ArrayList<M_board_replyDTO> selectAllComment(int board_no){// 댓글 가져오기
		
		ArrayList<M_board_replyDTO> replyList = new ArrayList<>();
		M_board_replyDTO rDTO ;
		
		try {
			getConnection();
			String sql = "SELECT * FROM m_board_reply WHERE board_no=? ORDER BY no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				rDTO = new M_board_replyDTO();
				rDTO.setBoard_no(board_no);
				rDTO.setContent(rs.getString("content"));
				rDTO.setDate(rs.getTimestamp("date"));
				rDTO.setEmail(rs.getString("email"));
				rDTO.setName(rs.getString("name"));
				rDTO.setNo(rs.getInt("no"));
				
				replyList.add(rDTO);
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectAllComment");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return replyList;
	}
	
	public void insertReply(M_board_replyDTO mrdto) {   //댓글작성

        try {
           getConnection();
           String sql="insert into m_board_reply(board_no, content, email, name, date) values(?,?,?,?,?)";
           pstmt=conn.prepareStatement(sql);
           pstmt.setInt(1, mrdto.getBoard_no());
           pstmt.setString(2, mrdto.getContent());
           pstmt.setString(3, mrdto.getEmail());
           pstmt.setString(4, mrdto.getName());
           pstmt.setTimestamp(5, mrdto.getDate());
           
           pstmt.executeUpdate();
           System.out.println("작성 완료");      
        } catch (Exception e) {
           e.printStackTrace();
        }finally {
           freeResource();
        }
     }
	
	public void orderItem(){ // 아이템 주문 - 결제 후 order 테이블로 삽입. 
		
	}

	public String makeItemID(String category) {
		String ID = "";

		try {
			SimpleDateFormat form = new SimpleDateFormat("MMdd");
			boolean same=true;
			getConnection();
			
			while(same){
				ID = Character.toUpperCase(category.charAt(0))+form.format(new Date());
				System.out.println(ID);
				
				for(int i=0; i<4; i++){
					Random rd = new Random();
					ID += rd.nextInt(9)+1;
				}
				
				String sql = "select item from M_item where item like ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ID);
				rs = pstmt.executeQuery();
				
				if(!rs.next()) same = false;
			}
		} catch (SQLException e) {
			System.out.println("error in makeItemID :"+e.getMessage());
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return ID;
	}

	public void insertMItem(M_itemDTO idto) {
		try {
			getConnection();
			String sql ="insert into m_item(item, name, price, category, stock) values(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idto.getItem());
			pstmt.setString(2, idto.getName());
			pstmt.setInt(3, idto.getPrice());
			pstmt.setString(4, idto.getCategory());
			pstmt.setInt(5, idto.getStock());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("error in insertMItem :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}
	
}


