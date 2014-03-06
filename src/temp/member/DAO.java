package temp.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import ch11.logon.LogonDataBean;

public class DAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private DAO() {
	} // 생성자

	private static DAO dao = new DAO();

	public static DAO getInstance() {
		return dao;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}

	public void insert(DTO dto) {
		try {
			conn = getConnection();
			String sql = "insert into TEMP_MEMBER (id,password,lastname,firstname,dob,gender,tel,email,reg_date)"
					+ "values(?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getLastname());
			pstmt.setString(4, dto.getFirstname());
			pstmt.setString(5, dto.getDob());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getTel());
			pstmt.setString(8, dto.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {

		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
			try {
				conn.close();
			} catch (SQLException e) {
			}
		}
	}

	public void update() {
		//
	}

	public void delete() {
		//
	}

	public ArrayList<DTO> select() {
		ArrayList<DTO> list = new ArrayList<DTO>();
		try {
			conn = getConnection();
			String sql = "select * from TEMP_MEMBER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DTO dto = new DTO();
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setLastname(rs.getString("lastname"));
				dto.setFirstname(rs.getString("firstname"));
				dto.setDob(rs.getString("dob"));
				dto.setGender(rs.getString("gender"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
			}
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
			try {
				conn.close();
			} catch (SQLException e) {
			}
		}
		return list;
	}

	public boolean passProc(String id, String password) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from TEMP_MEMBER where id=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
			}
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
			try {
				conn.close();
			} catch (SQLException e) {
			}
		}
		return result;
	}

	public int checkDuplicateId(String id) throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select id from TEMP_MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				x = 1; // 해당 아이디 있음
			else
				x = 0; // 해당 아이디 없음
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

	public DTO selectMember(String id) throws Exception {
		DTO member = null;
		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select * from TEMP_MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new DTO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setLastname(rs.getString("lastname"));
				member.setFirstname(rs.getString("firstname"));
				member.setDob(rs.getString("dob"));
				member.setGender(rs.getString("gender"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
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

	public void updateMember(DTO member) throws Exception {
		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("update TEMP_MEMBER set password=?,firstname=?,gender=?,tel=?,email=?"
							+ "where id=?");
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getFirstname());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getId());
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

	public int deleteMember(String id, String password) throws Exception {
		String dbpw = "";
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select password from TEMP_MEMBER where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpw = rs.getString("password");
				if (dbpw.equals(password)) {
					pstmt = conn
							.prepareStatement("delete from TEMP_MEMBER where id=?");
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
}