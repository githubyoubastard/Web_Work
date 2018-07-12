package test.clients.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.clients.dto.ClientsDto;
import test.util.DbcpBean;

public class ClientsDao {
	private static ClientsDao dao;
	private ClientsDao() {}
	public static ClientsDao getInstance() {
		if(dao==null) {
			dao=new ClientsDao();
		}
		return dao;
	}
	//업데이트
	public boolean update(ClientsDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
			try {
				conn=new DbcpBean().getConn();
				String sql="UPDATE CLIENTS SET PWD=?,EMAIL=? WHERE ID=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getPwd());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getId());
				flag=pstmt.executeUpdate();
			}catch(SQLException se) {
				se.printStackTrace();
			}finally {
				try {
					if(conn!=null)conn.close();
					if(pstmt!=null)pstmt.close();
				}catch(Exception e) {}
			}
			if(flag>0) {
				return true;
			}else {
				return false;
			}		
	}
	
	//회원 한명의 정보 리턴
	public ClientsDto getData(String id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ClientsDto dto=null;
			try {
				conn=new DbcpBean().getConn();
				String sql="SELECT ID,EMAIL,REGDATE FROM CLIENTS WHERE ID=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
					if(rs.next()) {
						dto=new ClientsDto();
						dto.setId(id);
						dto.setEmail(rs.getString("email"));
						dto.setRegdate(rs.getString("regdate"));
					}
			}catch(SQLException se) {
				se.printStackTrace();
			}finally {
				try {
					if(conn!=null)conn.close();
					if(pstmt!=null)pstmt.close();
				}catch(Exception e) {}
			}
			return dto;
	}
	
	//회원 가입 
	public boolean insert(ClientsDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
			try {
				conn=new DbcpBean().getConn();
				String sql="INSERT INTO CLIENTS (ID,PWD,EMAIL,REGDATE) VALUES(?,?,?,char_to(SYSDATE,'yyyymmdd')";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				pstmt.setString(3, dto.getEmail());
				flag=pstmt.executeUpdate();
			}catch(SQLException se) {
				se.printStackTrace();
			}finally {
				try {
					if(conn!=null)conn.close();
					if(pstmt!=null)pstmt.close();
				}catch(Exception e) {}
			}
			if(flag>0) {
				return true;
			}else {
				return false;
			}
	}
	
	//회원 정보 로그인
	public boolean isValid(ClientsDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean isValidate=false;
			try {
				conn=new DbcpBean().getConn();
				String sql="SELECT * from Clients where id=? and pwd=? ";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				rs=pstmt.executeQuery();
					if(rs.next()) {
						isValidate=true;
					}
			}catch(SQLException se) {
				se.printStackTrace();
			}finally {
				try {
					if(conn!=null)conn.close();
					if(pstmt!=null)pstmt.close();
					if(rs!=null)rs.close();
				}catch(Exception e) {}
			}
			return isValidate;
	}
}
