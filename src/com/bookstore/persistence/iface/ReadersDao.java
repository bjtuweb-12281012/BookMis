package com.bookstore.persistence.iface;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.bookstore.domain.ReadersBean;
import com.bookstore.persistence.sqlmap.DbConnection;

public class ReadersDao {
	public ReadersBean getReaders(String Readersid) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = DbConnection.getConnection();
		ReadersBean reader = new ReadersBean();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from readers where readerid= ?";

		try {
			con.setAutoCommit(false);// 鏇存敼JDBC浜嬪姟鐨勯粯璁ゆ彁浜ゆ柟寮�
			ps = con.prepareStatement(sql);
			
			ps.setString(1, Readersid);//ps锟斤拷锟斤拷锟斤拷锟絬ser锟斤拷锟斤拷锟斤拷锟斤拷要锟斤拷同锟斤拷
			
			rs = ps.executeQuery();
			if (rs.next()) {
				reader.setReaderid(rs.getString("readerid"));
				reader.setPassword(rs.getString("password"));
			}
			con.commit();//鎻愪氦JDBC浜嬪姟
			con.setAutoCommit(true);// 鎭㈠JDBC浜嬪姟鐨勯粯璁ゆ彁浜ゆ柟寮�
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			con.rollback();//鍥炴粴JDBC浜嬪姟
			e.printStackTrace();
		} finally {
			DbConnection.closeConnection(rs, ps, con);
		}

		return reader;
	}

	public List getReadersList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertReaders(ReadersBean ReadersBean) {
		// TODO Auto-generated method stub
		
	}

	public void updateReaders(ReadersBean ReadersBean) {
		// TODO Auto-generated method stub
		
	}
	public void deleteReaders(String Readersid) {
		// TODO Auto-generated method stub
		
	}

	public void passwordedit(String Readersid, String password) {
		// TODO Auto-generated method stub
		
	}
}
