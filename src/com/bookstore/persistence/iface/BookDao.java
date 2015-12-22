package com.bookstore.persistence.iface;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.domain.BookBean;
import com.bookstore.domain.ReadersBean;
import com.bookstore.persistence.sqlmap.DbConnection;

public class BookDao {
	public BookBean getBook(String Bookid) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = DbConnection.getConnection();
		BookBean book = new BookBean();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from books where bookid= ?";

		try {
			con.setAutoCommit(false);// 鏇存敼JDBC浜嬪姟鐨勯粯璁ゆ彁浜ゆ柟寮�
			ps = con.prepareStatement(sql);
			
			ps.setString(1, Bookid);//ps锟斤拷锟斤拷锟斤拷锟絬ser锟斤拷锟斤拷锟斤拷锟斤拷要锟斤拷同锟斤拷
			
			rs = ps.executeQuery();
			if (rs.next()) {
				book.setBookid(rs.getString("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setCategoryid(rs.getString("categoryid"));
				book.setPublishing(rs.getString("publishing"));
				book.setPrice(Double.parseDouble(rs.getString("bookname")));
				book.setQuantityin(Double.parseDouble(rs.getString("bookname")));
				book.setQuantityout(Double.parseDouble(rs.getString("bookname")));
				book.setQuantityloss(Double.parseDouble(rs.getString("bookname")));
				book.setPicture(rs.getString("bookname"));
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

		return book;
	}
	public List<BookBean> getBooklist() throws SQLException {
		// TODO Auto-generated method stub
		List<BookBean> booklist = new ArrayList<BookBean>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = DbConnection.getConnection();
		String sql = "select * from books";

		try {
			con.setAutoCommit(false);// 鏇存敼JDBC浜嬪姟鐨勯粯璁ゆ彁浜ゆ柟寮�
			ps = con.prepareStatement(sql);
			
			
			rs = ps.executeQuery();
			while (rs.next()) {
				BookBean book1 = new BookBean();
				book1.setBookid(rs.getString("bookid"));
				book1.setBookname(rs.getString("bookname"));
				book1.setAuthor(rs.getString("author"));
				book1.setCategoryid(rs.getString("categoryid"));
				book1.setPublishing(rs.getString("publishing"));
				book1.setPrice(Double.parseDouble(rs.getString("bookname")));
				book1.setQuantityin(Double.parseDouble(rs.getString("bookname")));
				book1.setQuantityout(Double.parseDouble(rs.getString("bookname")));
				book1.setQuantityloss(Double.parseDouble(rs.getString("bookname")));
				book1.setPicture(rs.getString("bookname"));
				booklist.add(book1);
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

		return booklist;
	}

	public List getBookList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
