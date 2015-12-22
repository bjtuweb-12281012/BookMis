package com.bookstore.presentation;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bookstore.domain.ReadersBean;
import com.bookstore.domain.User;
import com.bookstore.service.ReadersService;
import com.bookstore.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserBean extends ActionSupport {

	private UserService userservice;
	private User user;
	private ReadersService readersservice;
	private ReadersBean reader;
		
	public UserBean() {
	    this(new UserService());
	  }

	  public UserBean(UserService userService) {
	    user = new User();
	    this.userservice = userService;
	  }
	public String addUser() throws Exception { 
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");		
		//System.out.println(ServletActionContext.getRequest().getParameter("userid"));
		user.setUserid(ServletActionContext.getRequest().getParameter("userid"));
		user.setUsername(ServletActionContext.getRequest().getParameter("username"));
		user.setPassword(ServletActionContext.getRequest().getParameter("password"));
		user.setGender(ServletActionContext.getRequest().getParameter("gender"));
		user.setAddress(ServletActionContext.getRequest().getParameter("address"));
		user.setPhone(ServletActionContext.getRequest().getParameter("phone"));
		user.setPostcode(ServletActionContext.getRequest().getParameter("postcode"));
		user.setEmail(ServletActionContext.getRequest().getParameter("email"));	   
		userservice.insertUser(user);
		return SUCCESS;
	}
	public String getUserList(){		
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");				
		List<User> userlist=userservice.getUserList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("userlist",userlist); //保存到request方便前台调用		
		return SUCCESS;
	}
	public String deleteUser(){
		String userid=ServletActionContext.getRequest().getParameter("id");
		userservice.deleteUser(userid);
		
		List<User> userlist=userservice.getUserList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("userlist",userlist); //保存到request方便前台调用	
		return SUCCESS;
	}
	public String loginUser() throws SQLException{
		String name=ServletActionContext.getRequest().getParameter("name");
		String password=ServletActionContext.getRequest().getParameter("password");
		user=userservice.getUser(name, password);
		
		if(user==null)
		{
			return ERROR;
		}
		else{
			 {
				 HttpServletRequest request = ServletActionContext.getRequest(); 
				 HttpSession session = request.getSession(); 
				 session.setAttribute("userid",name);
				 session.setAttribute("password",password);
				 } 
		}
			return SUCCESS;
	}
	public ReadersBean getReader() {
		return reader;
	}

	public void setReader(ReadersBean reader) {
		this.reader = reader;
	}

	public String PassWordEdit(){
		String userid=ServletActionContext.getRequest().getParameter("userid");
		String password=ServletActionContext.getRequest().getParameter("password");
		userservice.passwordedit(userid,password);
		return SUCCESS;
	}
	public String UserInfoEdit(){
		user.setUserid(ServletActionContext.getRequest().getParameter("userid"));
		user.setPassword(ServletActionContext.getRequest().getParameter("password"));
		user.setUsername(ServletActionContext.getRequest().getParameter("username"));
		user.setGender(ServletActionContext.getRequest().getParameter("gender"));
		user.setAddress(ServletActionContext.getRequest().getParameter("address"));
		user.setPhone(ServletActionContext.getRequest().getParameter("phone"));
		user.setPostcode(ServletActionContext.getRequest().getParameter("postcode"));
		user.setEmail(ServletActionContext.getRequest().getParameter("email"));	   
		userservice.updateUser(user);
		
		
		return SUCCESS;
	}
}
