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

import com.bookstore.domain.ReadersBean;
import com.bookstore.persistence.iface.ReadersDao;
import com.bookstore.persistence.sqlmap.DbConnection;
import com.bookstore.service.ReadersService;
import com.opensymphony.xwork2.ActionSupport;

public class ReadersAction extends ActionSupport {
	private ReadersBean reader=new ReadersBean();
	private ReadersDao readersDao = new ReadersDao();
	
	public String loginreader() throws Exception{
		String readerid=ServletActionContext.getRequest().getParameter("name");
		String password=ServletActionContext.getRequest().getParameter("password");
		
		reader = readersDao.getReaders(readerid);
		
		if(!reader.getPassword().equals(password))
		{
			return ERROR;
		}
		else{
			 {
				 HttpServletRequest request = ServletActionContext.getRequest(); 
				 HttpSession session = request.getSession(); 
				 session.setAttribute("userid",readerid);
				 session.setAttribute("password",password);
				 } 
		}
			return SUCCESS;
	}
	
}
