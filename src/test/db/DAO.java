package test.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private DAO() {
	} // »ý¼ºÀÚ

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
		try{
			conn = getConnection();
			String sql = "insert into test values(?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,dto.getId());
				pstmt.setString(2,dto.getPw());
				int age = Integer.parseInt(dto.getAge());
				pstmt.setInt(3,age);
			pstmt.executeUpdate();
		}catch(Exception e){
			
		}finally{
			try {pstmt.close();} catch (SQLException e) {}
			try {conn.close();} catch (SQLException e) {}
		}
	}

	public void update() {
		//
	}

	public void delete() {
		//
	}

	public ArrayList<DTO> select(){
		ArrayList<DTO> list = new ArrayList<DTO>();
		try{
			conn = getConnection();
			String sql = "select * from test";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				DTO dto = new DTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setAge(rs.getInt("age")+"");
				dto.setReg(rs.getTimestamp("reg"));
				list.add(dto);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
			}catch(SQLException e){
			}try{
				pstmt.close();
			}catch(SQLException e){
			}try{
				conn.close();
			}catch(SQLException e){
			}
		}
		return list;
	}
	
	public boolean loginCh(String id,String pw){
		boolean result = false;
		try{
			conn = getConnection();
			String sql = "select * from test where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {rs.close();} catch (SQLException e) {}
			try {pstmt.close();} catch (SQLException e) {}
			try {conn.close();} catch (SQLException e) {}
		}
		return result;
	}
}


