package cargo.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ExampleDAO {
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
	
	public ExampleDTO exerciseOne(ExampleDTO edto){
		ExampleDTO dto = null;
		try {
			con = connect();
			
/*			
 			String sql = "sql 구문";
			pstmt = con.prepareStatement(sql);
			
			//디비의 값만 변경하는 경우
			pstmt.executeUpdate();
			
			
			//디비에서 값이 반환되는 경우
			rs=pstmt.executeQuery();
			while (rs.next()) {
			ExampleDTO edto  = new ExampleDTO();
			edto.setGo(rs.getInt("go"));
			}
*/
	
			//대충 디비에 넣어주고 뭐 받아왔다고 칩시다.
			dto = new ExampleDTO(edto.getGo()+10);
			
		} catch (Exception e) {
			System.out.println("exerciseOne err:"+e.getMessage());
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return dto;
	}
}
