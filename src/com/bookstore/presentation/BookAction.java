package com.bookstore.presentation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bookstore.domain.Book;
import com.bookstore.domain.ReadersBean;
import com.bookstore.domain.BookBean;
import com.bookstore.persistence.iface.BookDao;
import com.bookstore.persistence.iface.ReadersDao;
import com.bookstore.persistence.sqlmap.DbConnection;
import com.bookstore.service.ReadersService;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	private BookBean book=new BookBean();
	private BookDao bookDao = new BookDao();
	public String getBook() throws SQLException{
		String id =ServletActionContext.getRequest().getParameter("bookid");
		book= bookDao.getBook(id);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("book",book);
	    return SUCCESS;
	}
	public String getBookList() throws SQLException{		
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");				
		List<Book> booklist=bookDao.getBookList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("booklist",booklist); //保存到request方便前台调用		
		return SUCCESS;
	}
	
}
