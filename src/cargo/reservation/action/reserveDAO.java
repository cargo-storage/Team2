package cargo.reservation.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.ReservationDTO;

public class reserveDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql;
	
	//연결 메서드 따로있습니다..
	private Connection connect() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jspbeginner");
		return ds.getConnection();
	}
	
	//자원해재
		public void freeResource() {
			try {
				if (this.con != null) {
					this.con.close();
				}
				if (this.rs != null) {
					this.rs.close();
				}
				if (this.pstmt != null) {
					this.pstmt.close();
				}
			} catch (Exception e) {
				System.out.println("자원해제 err: " + e.getMessage());
				e.printStackTrace();
			}
		}//end of free
		
		public void rsCheck(ReservationDTO rsdto){
			
			try {
				con = connect();
				sql = "insert into reservation (email, house, start_day, end_day, res_day, payment) "
						+ "values(?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rsdto.getEmail());
				pstmt.setString(2, rsdto.getHouse());
				pstmt.setTimestamp(3, rsdto.getStart_day());
				pstmt.setTimestamp(4, rsdto.getEnd_day());
				pstmt.setTimestamp(5, rsdto.getRes_day());
				pstmt.setInt(6, rsdto.getPayment());
				
				pstmt.executeUpdate();			
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				freeResource();
			}
		}

}
