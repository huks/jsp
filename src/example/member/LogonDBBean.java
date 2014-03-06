package example.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LogonDBBean {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private LogonDBBean() {}

	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}	

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/orcl");
		return ds.getConnection();
	}

	public void insertMember(LogonDataBean member) throws Exception {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into EXAMPLE_MEMBER values (?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin1());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getBlog());
			pstmt.setTimestamp(8, member.getReg_date());
			pstmt.setString(9, "normal");
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}

	public int userCheck(String id, String passwd) throws Exception {
		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from EXAMPLE_MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd))
					x = 1; // 인증 성공
				else
					x = 0; // 비밀번호 틀림
			} else
				x = -1;// 해당 아이디 없음

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null)
				try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null)
				try { conn.close(); } catch (SQLException ex) {}
		}
		return x;
	}

	public int confirmId(String id) throws Exception {
		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select id from EXAMPLE_MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = 1; // 해당 아이디 있음
			else
				x = -1;// 해당 아이디 없음
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	public LogonDataBean getMember(String id) throws Exception {
		LogonDataBean member = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from EXAMPLE_MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new LogonDataBean();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setJumin1(rs.getString("jumin1"));
				member.setJumin2(rs.getString("jumin2"));
				member.setEmail(rs.getString("email"));
				member.setBlog(rs.getString("blog"));
				member.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return member;
	}

	public void updateMember(LogonDataBean member) throws Exception {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update EXAMPLE_MEMBER set passwd=?,name=?,email=?,blog=? where id=?");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getBlog());
			pstmt.setString(5, member.getId());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}

	public int deleteMember(String id, String passwd) throws Exception {
		String dbpasswd = "";
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from EXAMPLE_MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from EXAMPLE_MEMBER where id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1; // 회원탈퇴 성공
				} else
					x = 0; // 비밀번호 틀림
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// 관리자 여부 체크
	public boolean isAdmin(String id) throws Exception {
		boolean isAdmin = false; // 초기화

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select member_level from EXAMPLE_MEMBER where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {				
				if (rs.getString("member_level").equals("admin")) { // 관리자 레벨
					isAdmin = true;
				} else {
					isAdmin = false;
				}
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null)
				try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null)
				try { conn.close(); } catch (SQLException ex) {}
		}
		return isAdmin;
	}
	
	// 모든 멤버 select
	public ArrayList<LogonDataBean> getMemberAll() {
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		try {
			conn = getConnection();
			String sql = "select * from EXAMPLE_MEMBER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				LogonDataBean dto = new LogonDataBean();
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setJumin1(rs.getString("jumin1"));
				dto.setJumin2(rs.getString("jumin2"));
				dto.setEmail(rs.getString("email"));
				dto.setBlog(rs.getString("blog"));
				dto.setEmail(rs.getString("email"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setMember_level(rs.getString("member_level"));			
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { rs.close(); } catch (SQLException e) {}
			try { pstmt.close(); } catch (SQLException e) {}
			try { conn.close(); } catch (SQLException e) {}
		}
		return list;
	}
}