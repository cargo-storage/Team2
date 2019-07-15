package cargo.member.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.fabric.Response;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import cargo.common.DTO.MemberDTO;
import cargo.member.action.SMTPAuthenticator;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	private String query;

	// 연결 메서드 따로있습니다..
	private Connection connect() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jspbeginner");
		return ds.getConnection();
	}

	// 자원해재
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
	}// end of free

	public int insertMember(MemberDTO mdto) { // 회원 가입
		int result = 0; // 0: 실패, 1: 성공

		try {
			con = connect();
			query = "INSERT INTO member(email, pwd, name, phone, postCode, roadAddr, detailAddr, admin, reg_date) VALUES(?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mdto.getEmail());
			pstmt.setString(2, mdto.getPwd());
			pstmt.setString(3, mdto.getName());
			pstmt.setString(4, mdto.getPhone());
			pstmt.setInt(5, mdto.getPostCode());
			pstmt.setString(6, mdto.getRoadAddr());
			pstmt.setString(7, mdto.getDetailAddr());
			pstmt.setInt(8, mdto.getAdmin());
			pstmt.setTimestamp(9, mdto.getReg_date());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertMember()에서 오류: " + e);
		} finally {
			freeResource();
		}

		return result;
	}

	public int LogingetMember(String email, String pwd) { // 로그인
		int state = 0; // 0: 아이디 없음, -1: 비밀번호 틀림, 1: 성공
		try {
			con = connect();
			query = "SELECT * FROM member WHERE email=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pwd.equals(rs.getString("pwd")))
					state = 1;
				else
					state = -1;
			}

		} catch (Exception e) {
			System.out.println("LogingetMember()에서 오류: " + e);
		} finally {
			freeResource();
		}
		return state;
	}

	public String randomNum() { // 이메일 인증 랜덤 숫자
		String authNum = "";
		for (int i = 0; i < 6; i++) {
			authNum += (int) (Math.random() * 10);
			System.out.println(authNum);
		}
		return authNum;
	}

	public int sendEmail(String to_email, String subject, String content) { // 이메일 인증 메일 발송, 임시 비밀번호 메일 발송
		String from_email = "hbaymail@naver.com";

		Properties p = new Properties(); // 정보를 담을 객체

		p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP 서버에 접속하기 위한 정보들

		try {
			Authenticator auth = new SMTPAuthenticator();
			Session ses = Session.getInstance(p, auth);

			ses.setDebug(true);

			MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			msg.setSubject(subject); // 제목

			Address fromAddr = new InternetAddress(from_email);
			msg.setFrom(fromAddr); // 보내는 사람

			Address toAddr = new InternetAddress(to_email);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

			msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

			Transport.send(msg); // 전송

			return 1;
		} catch (Exception e) {
			System.out.println("sendEmail()에서 오류: " + e);
			return 0;
		}
	}

	public MemberDTO getMember(String email) { // 이메일 중복/여부 확인, 내정보 확인(패스워드 없이 세션의 이메일 유무로 확인하기 위해 MemberDTO 리턴)
		MemberDTO mdto = new MemberDTO();
		try {
			con = connect();
			query = "SELECT * FROM member WHERE email=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mdto.setEmail(email);
				mdto.setPwd(rs.getString("pwd"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setPostCode(rs.getInt("postCode"));
				mdto.setRoadAddr(rs.getString("roadAddr"));
				mdto.setDetailAddr(rs.getString("detailAddr"));
				mdto.setAdmin(rs.getInt("admin"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
			}

		} catch (Exception e) {
			System.out.println("getMember()에서 오류: " + e);
		} finally {
			freeResource();
		}
		return mdto;
	}

	public ArrayList<MemberDTO> getEmail(String name, String phone) { // 이메일 찾기
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();

		try {
			con = connect();
			query = "SELECT * FROM member WHERE name=? AND phone=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setEmail(rs.getString("email"));
				mdto.setPwd(rs.getString("pwd"));
				mdto.setName(name);
				mdto.setPhone(phone);
				mdto.setPostCode(rs.getInt("postCode"));
				mdto.setRoadAddr(rs.getString("roadAddr"));
				mdto.setDetailAddr(rs.getString("detailAddr"));
				mdto.setAdmin(rs.getInt("admin"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));

				list.add(mdto);
			}

		} catch (Exception e) {
			System.out.println("getEmail()에서 오류: " + e);
		} finally {
			freeResource();
		}

		return list;
	}

	public String newPwd() { // 임시 비밀번호 생성
		String numeric_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder newPwd = new StringBuilder();
		for (int i = 0; i < 8; i++) {
			int num = (int) (Math.random() * numeric_string.length());
			newPwd.append(numeric_string.charAt(num));
		}
		return newPwd.toString();
	}

	public int updateMember(MemberDTO mdto) { // 비밀번호 초기화, 회원정보 수정
		int state = 0; // 0: 실패, 1: 성공
		try {
			con = connect();
			query = "UPDATE member SET pwd=?, name=?, phone=?, postCode=?, roadAddr=?, detailAddr=? WHERE email=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mdto.getPwd());
			pstmt.setString(2, mdto.getName());
			pstmt.setString(3, mdto.getPhone());
			pstmt.setInt(4, mdto.getPostCode());
			pstmt.setString(5, mdto.getRoadAddr());
			pstmt.setString(6, mdto.getDetailAddr());
			pstmt.setString(7, mdto.getEmail());

			state = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateMember()에서 오류: " + e);
		} finally {
			freeResource();
		}
		return state;
	}
}
