package cargo.reservation.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.ReservationDTO;
import cargo.common.DTO.WarehouseDTO;

public class ReservationDAO {
	
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
	
	private void closeRes(){
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<WarehouseDTO> getAllHouse(){
		
		WarehouseDTO hBean;
		ArrayList<WarehouseDTO> hList = new ArrayList<>();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM warehouse ORDER BY house";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				hBean = new WarehouseDTO();
				
				hBean.setHouse(rs.getString("house"));
				hBean.setPrice(rs.getInt("price"));
				hBean.setArea(rs.getString("area"));
				hBean.setHeight(rs.getInt("height"));
				hBean.setIsEmpty(rs.getInt("isEmpty"));
				
				hList.add(hBean);
			}
			
		} catch (SQLException e) {
			System.out.println("Error in getAllHouse()");
			e.printStackTrace();
		}finally {
			closeRes();
		}
		return hList;
	}
	
	public ArrayList<ReservationDTO> getReservation(String house){
		ReservationDTO rdto;
		ArrayList<ReservationDTO> rList = new ArrayList<>();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM reservation WHERE house=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, house);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				rdto = new ReservationDTO();
				
				rdto.setEmail(rs.getString("email"));
				rdto.setEnd_day(rs.getTimestamp("end_day"));
				rdto.setHouse(rs.getString("house"));
				rdto.setNum(rs.getInt("num"));
				rdto.setPayment(rs.getInt("payment"));
				rdto.setRes_day(rs.getTimestamp("res_day"));
				rdto.setStart_day(rs.getTimestamp("start_day"));
				
				rList.add(rdto);
			}
			
		} catch (SQLException e) {
			System.out.println("Error in getAllReservation()");
			e.printStackTrace();
		}finally {
			closeRes();
		}
		return rList;
	}

}