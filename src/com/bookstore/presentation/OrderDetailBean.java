package com.bookstore.presentation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookstore.domain.Book;
import com.bookstore.domain.Order;
import com.bookstore.domain.OrderDetail;
import com.bookstore.domain.Publisher;
import com.bookstore.domain.User;
import com.bookstore.service.BookService;
import com.bookstore.service.OrderDetailService;
import com.bookstore.service.OrderService;
import com.bookstore.service.PublisherService;
import com.bookstore.service.UserService;
import com.jspsmart.upload.SmartUpload;
import com.opensymphony.xwork2.ActionSupport;

public class OrderDetailBean extends ActionSupport {

	private OrderDetailService orderdetailservice;
	private OrderDetail orderdetail;
		
	public OrderDetailBean() {
	    this(new OrderDetailService());
	  }

	  public OrderDetailBean(OrderDetailService orderdetailservice) {
		  orderdetail = new OrderDetail();
	    this.orderdetailservice = orderdetailservice;
	  }
	  
	  public String getOrderDetail(){
		  
		  String orderdetailid=ServletActionContext.getRequest().getParameter("detailid");
		  String totalamount=ServletActionContext.getRequest().getParameter("totalamount");
		  OrderDetail orderdetail=orderdetailservice.getOrderDetail(orderdetailid);
		  
		  HttpServletRequest request = ServletActionContext.getRequest(); 
		  request.setAttribute("orderdetail",orderdetail);
		  request.setAttribute("totalamount",totalamount);
		  return SUCCESS;
		  
	  }
	  public String getOrderDetailList(){		
			//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");				
			List<OrderDetail> orderdetaillist=orderdetailservice.getOrderDetailList();
			HttpServletRequest request = ServletActionContext.getRequest(); 
		    request.setAttribute("orderdetaillist",orderdetaillist); //保存到request方便前台调用		
			return SUCCESS;
		}
	public String addOrderDetail(OrderDetail orderdetail) throws Exception { 
		
		orderdetailservice.insertOrderDetail(orderdetail);
		
	/*	OrderDetail orderdetail1=orderdetailservice.getOrderDetail("orderid");
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("orderdetail",orderdetail1); //保存到request方便前台调用	
		*/
		
		return SUCCESS;
	}
	
	public String modifyOrderdetail(){
		String orderdetailid=ServletActionContext.getRequest().getParameter("id");
		
		orderdetail=orderdetailservice.getOrderDetail(orderdetailid);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("orderdetail",orderdetail); 
	    
		return SUCCESS;
	}
	public String updateOrderdetail(){
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");	
		orderdetail.setOrderid(ServletActionContext.getRequest().getParameter("orderid"));
		orderdetail.setBookid(ServletActionContext.getRequest().getParameter("bookid"));
		orderdetail.setBookname(ServletActionContext.getRequest().getParameter("bookname"));
		orderdetail.setPublisher(ServletActionContext.getRequest().getParameter("publisher"));
		orderdetail.setUnitprice(Float.parseFloat(ServletActionContext.getRequest().getParameter("unitprice")));
		orderdetail.setOrdernum(Integer.parseInt(ServletActionContext.getRequest().getParameter("ordernum")));	
		orderdetailservice.updateOrderDetail(orderdetail);
		
		OrderDetail orderdetail=orderdetailservice.getOrderDetail("orderid");
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("orderdetail",orderdetail); //保存到request方便前台调用	

	    
	    return SUCCESS;
	}
}
