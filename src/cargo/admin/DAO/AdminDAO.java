package cargo.admin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.admin.DTO.AdminDTO;
import cargo.admin.DTO.OverdueDTO;
import cargo.common.DTO.MemberDTO;

public class AdminDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql;
	
	//연결 메서드 따로있습니다..
	private Connection connect() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jspbeginner");
		return ds.getConnection();
	}//end of connect

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
	}//end of freeResource
	
	public ArrayList<AdminDTO> getTables(String category){
		sql="";
		ArrayList<AdminDTO> list = new ArrayList<>();
		
		/*String인데 값 없는경우 '-'
		 *int인데 값없는 경우 -1
		 *Timestamp인데 값 없는경우 null
		 *로 DB에서 가져옵니다.
		 *null 피하기 위해.. Timestamp경우에는 표시해줄때 꼬일 것 같아서 그냥 null로 받아옵니다.*/
		String resev = 
				"select '예약' as state, '-' as item, r.num, r.email, r.house,"
						+ " r.start_day, r.end_day, r.payment, r.res_day,"
						+ " m.name, m.phone"
						+ " from reservation as r"
						+ " left join member as m"
						+ " on r.email = m.email";

		String itm =
				"select '보관' as state, i.item, i.email, i.house,"
						+ " i.start_day, i.end_day, i.payment, i.item_price,"
						+ " m.name, m.phone"
						+ " from items as i"
						+ " left join member as m"
						+ " on i.email = m.email";

		/*예전 기록의 경우 회원이 탈퇴했을때 없어진 정보는 null대신 "탈퇴한 회원"으로 채움
		 * ifnull은 oracle NVL함수와 같은 기능으로 ifnull(v1,v2) v1이 null이면 v2로 대체
		 * String이  null 이면 '탈퇴한 회원'
		 * int null 이면 -1*/
		String cld=
				"select '완료' as state, c.item, c.email, c.house,"
						+ " c.start_day, c.end_day, c.payment, c.item_price, c.return_day,"
						+ " ifnull(m.name, '탈퇴한 회원') as name, ifnull(m.phone, '탈퇴한 회원') as phone"
						+ " from closed as c"
						+ " left join member as m"
						+ " on c.email = m.email";
		
		if("reservation".equals(category)){
			sql = resev;
		}else if("items".equals(category)){
			sql = itm;
		}else if("closed".equals(category)){
			sql = cld;
		}else if("all".equals(category)){
			sql = "("+resev+") UNION all ("+itm+") UNION all ("+cld+")";
		}
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AdminDTO dto = new AdminDTO();	
				
				dto.setState(rs.getString("state"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setHouse(rs.getString("house"));
				dto.setItem(rs.getString("item"));
				
				dto.setPayment(rs.getInt("payment"));
				
				dto.setStart_day(rs.getTimestamp("start_day"));
				dto.setEnd_day(rs.getTimestamp("end_day"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getTables err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return list;
	}//end of getTables(String category)
	
	public ArrayList<AdminDTO> getTables(){
		return getTables("all");
	}//다 받아오는거는 getInfo()만 호출하면 되도록... 인자 안넣도록..... 왜냐.. 귀찮으니까.... 
	
	public ArrayList<MemberDTO> getMembersTable() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		sql="select * from member";
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setAdmin(rs.getInt("admin"));
				mdto.setName(rs.getString("name"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setPwd(rs.getString("pwd"));
				mdto.setPostCode(rs.getInt("postCode"));
				mdto.setDetailAddr(rs.getString("detailAddr"));
				mdto.setRoadAddr(rs.getString("roadAddr"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
				
				list.add(mdto);
			}
		} catch (Exception e) {
			System.out.println("getMembersTable err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return list;
	}//end of getMembersTable
	
	public ArrayList<OverdueDTO> getOverdueTable() {
		ArrayList<OverdueDTO> list = new ArrayList<>();
		sql=
				"select datediff(curdate(),end_day) as overdue, datediff(curdate(),end_day)*w.price as arrears,"
						+ " round((i.payment*0.1),-1)-(datediff(curdate(),end_day)*w.price) as now_deposit,"
						+ " m.email, m.name, m.phone, m.postCode, m.roadAddr, m.detailAddr,"
						+ " w.house, w.price,"
						+ " i.item ,i.start_day, i.end_day, i.payment, i.item_price"
						+ " from items as i"
						+ " join member as m on i.email = m.email"
						+ " join warehouse as w on i.house = w.house"
						+ " where end_day<curdate()";
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int overdue = rs.getInt("overdue");
				int arrears = rs.getInt("arrears");
				int now_deposit = rs.getInt("now_deposit");
				
				OverdueDTO odto = new OverdueDTO(overdue, arrears, now_deposit);
				
				odto.setHouse(rs.getString("house"));
				odto.setPrice(rs.getInt("price"));
				
				odto.setEmail(rs.getString("email"));
				odto.setName(rs.getString("name"));
				odto.setPhone(rs.getString("phone"));
				odto.setPostCode(rs.getInt("postCode"));
				odto.setDetailAddr(rs.getString("detailAddr"));
				odto.setRoadAddr(rs.getString("roadAddr"));
				
				odto.setStart_day(rs.getTimestamp("start_day"));
				odto.setEnd_day(rs.getTimestamp("end_day"));
				odto.setPayment(rs.getInt("payment"));
				odto.setItem_price(rs.getInt("item_price"));
				odto.setItem(rs.getString("item"));
				
				list.add(odto);
			}
		} catch (Exception e) {
			System.out.println("getOverdueTable err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return list;
	}//end of getOverdueTable
	
	public AdminDTO getInfo(String category){
		AdminDTO dto = new AdminDTO();
		sql="";
		
		/*String인데 값 없는경우 '-'
		 *int인데 값없는 경우 -1
		 *Timestamp인데 값 없는경우 null
		 *로 DB에서 가져옵니다.
		 *null 피하기 위해.. Timestamp경우에는 표시해줄때 꼬일 것 같아서 그냥 null로 받아옵니다.*/
		String resev = 
				"select '예약' as state, '-' as item, r.num, r.email, r.house,"
				+ " r.start_day,  r.end_day, r.res_day, r.payment, -1 as item_price, null as return_day,"
				+ " m.name, m.phone, m.postCode, m.roadAddr, m.detailAddr"
				+ " from reservation as r"
				+ " left join member as m"
				+ " on r.email = m.email";
		
		String itm =
				"select '보관' as state, i.item, -1 as num, i.email, i.house,"
				+ " i.start_day, i.end_day, null as res_day, i.payment, i.item_price, null as return_day,"
				+ " m.name, m.phone, m.postCode, m.roadAddr, m.detailAddr"
				+ " from items as i"
				+ " left join member as m"
				+ " on i.email = m.email";
		
		/*예전 기록의 경우 회원이 탈퇴했을때 없어진 정보는 null대신 "탈퇴한 회원"으로 채움
		 * ifnull은 oracle NVL함수와 같은 기능으로 ifnull(v1,v2) v1이 null이면 v2로 대체
		 * String이  null 이면 '탈퇴한 회원'
		 * int null 이면 -1*/
		String cld=
				"select '완료' as state, c.item, null as num, c.email, c.house,"
				+ " c.start_day, c.end_day, null as res_day, c.payment, c.item_price, c.return_day,"
				+ " ifnull(m.name, '탈퇴한 회원') as name, ifnull(m.phone, '탈퇴한 회원') as phone,"
				+ " ifnull(m.postCode, -1) as postCode, ifnull(m.roadAddr, '탈퇴한 회원') as roadAddr,"
				+ " ifnull(m.detailAddr, '탈퇴한 회원') as detailAddr"
				+ " from closed as c"
				+ " left join member as m"
				+ " on c.email = m.email";
		
		if("reservation".equals(category)){
			sql = resev;
		}else if("items".equals(category)){
			sql = itm;
		}else if("closed".equals(category)){
			sql = cld;
		}else if("all".equals(category)){
			sql = "("+resev+") UNION all ("+itm+") UNION all ("+cld+")";
		}
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				
				dto.setState(rs.getString("state"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setRoadAddr(rs.getString("roadAddr"));
				dto.setDetailAddr(rs.getString("detailAddr"));
				dto.setHouse(rs.getString("house"));
				dto.setItem(rs.getString("item"));
				
				dto.setNum(rs.getInt("num"));
				dto.setPostCode(rs.getInt("postCode"));
				dto.setPayment(rs.getInt("payment"));
				dto.setItem_price(rs.getInt("item_price"));
				
				dto.setRes_day(rs.getTimestamp("res_day"));
				dto.setStart_day(rs.getTimestamp("start_day"));
				dto.setEnd_day(rs.getTimestamp("end_day"));
				dto.setReturn_day(rs.getTimestamp("return_day"));
				
			}
		} catch (Exception e) {
			System.out.println("getInfo err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return dto;
	}//end of getInfo(String category)
	

	public ArrayList<MemberDTO> getMemberInfo() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		sql="select * from member";
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setAdmin(rs.getInt("admin"));
				mdto.setName(rs.getString("name"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setPwd(rs.getString("pwd"));
				mdto.setPostCode(rs.getInt("postCode"));
				mdto.setDetailAddr(rs.getString("detailAddr"));
				mdto.setRoadAddr(rs.getString("roadAddr"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
				
				list.add(mdto);
			}
		} catch (Exception e) {
			System.out.println("getMemberInfo err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return list;
	}//end of getMemberInfo

	public ArrayList<OverdueDTO> getOverdueInfo() {
		ArrayList<OverdueDTO> list = new ArrayList<>();
		sql=
				"select datediff(curdate(),end_day) as overdue, datediff(curdate(),end_day)*w.price as arrears,"
						+ " round((i.payment*0.1),-1)-(datediff(curdate(),end_day)*w.price) as now_deposit,"
						+ " m.email, m.name, m.phone, m.postCode, m.roadAddr, m.detailAddr,"
						+ " w.house, w.price,"
						+ " i.item ,i.start_day, i.end_day, i.payment, i.item_price"
						+ " from items as i"
						+ " join member as m on i.email = m.email"
						+ " join warehouse as w on i.house = w.house"
						+ " where end_day<curdate()";
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int overdue = rs.getInt("overdue");
				int arrears = rs.getInt("arrears");
				int now_deposit = rs.getInt("now_deposit");
				
				OverdueDTO odto = new OverdueDTO(overdue, arrears, now_deposit);
				
				odto.setHouse(rs.getString("house"));
				odto.setPrice(rs.getInt("price"));
				
				odto.setEmail(rs.getString("email"));
				odto.setName(rs.getString("name"));
				odto.setPhone(rs.getString("phone"));
				odto.setPostCode(rs.getInt("postCode"));
				odto.setDetailAddr(rs.getString("detailAddr"));
				odto.setRoadAddr(rs.getString("roadAddr"));

				odto.setStart_day(rs.getTimestamp("start_day"));
				odto.setEnd_day(rs.getTimestamp("end_day"));
				odto.setPayment(rs.getInt("payment"));
				odto.setItem_price(rs.getInt("item_price"));
				odto.setItem(rs.getString("item"));
				
				list.add(odto);
			}
		} catch (Exception e) {
			System.out.println("getOverdueInfo err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return list;
	}//end of getOverdueInfo
}
