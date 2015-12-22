package com.bookstore.presentation;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bookstore.domain.Book;
import com.bookstore.domain.Order;
import com.bookstore.domain.OrderDetail;
import com.bookstore.domain.Publisher;
import com.bookstore.domain.User;
import com.bookstore.service.BookService;
import com.bookstore.service.OrderService;
import com.bookstore.service.PublisherService;
import com.bookstore.service.UserService;
import com.jspsmart.upload.SmartUpload;
import com.opensymphony.xwork2.ActionSupport;

public class OrderBean extends ActionSupport {

	private OrderService orderservice;
	private Order order;
		
	public OrderBean() {
	    this(new OrderService());
	  }

	  public OrderBean(OrderService orderservice) {
		  order = new Order();
	    this.orderservice = orderservice;
	  }
	public String addOrder() throws Exception { 
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");		
		//System.out.println(ServletActionContext.getRequest().getParameter("userid"));
		String s_userid=ServletActionContext.getRequest().getParameter("userid");
		String s_payment=ServletActionContext.getRequest().getParameter("payment");
		String s_deliver=ServletActionContext.getRequest().getParameter("deliver");
		String s_receiver=ServletActionContext.getRequest().getParameter("receiver");
		String s_address=ServletActionContext.getRequest().getParameter("address");
		String s_phone=ServletActionContext.getRequest().getParameter("phone");
		String s_postcode=ServletActionContext.getRequest().getParameter("postcode");
		int state=0;
		
		
		order.setOrderid(ServletActionContext.getRequest().getParameter("orderid"));
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		order.setOrderdate(df.format(new Date()));
		
		order.setUserid(s_userid);
		order.setTotalnum(Integer.parseInt(ServletActionContext.getRequest().getParameter("totalnum")));
		order.setTotalamount(Float.parseFloat(ServletActionContext.getRequest().getParameter("totalamount")));
		order.setPayment(s_payment);	   
		order.setDeliver(s_deliver);	
		order.setReceiver(s_receiver);	
		order.setAddress(s_address);	
		order.setPhone(s_phone);
		order.setPostcode(s_postcode);
		order.setState(state);	
		orderservice.insertOrder(order);
		
		HttpServletRequest request = ServletActionContext.getRequest(); 
		HttpSession session = request.getSession(); 
		List<OrderDetail> orderdetaillist=(List<OrderDetail>)session.getAttribute("detaillist");
		OrderDetailBean detailbean=new OrderDetailBean();
		for(int i=0; i<orderdetaillist.size(); i++){
			detailbean.addOrderDetail(orderdetaillist.get(i));
		}
		List<Order> orderlist=orderservice.getOrderList();
	    request.setAttribute("myorderlist",orderlist); //保存到request方便前台调用	
		
		
		return SUCCESS;
	}
	public String getOrderList(){		
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");				
		List<Order> orderlist=orderservice.getOrderList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("orderlist",orderlist); //保存到request方便前台调用		
		return SUCCESS;
	}
	public String getMyOrderList(){		
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		String userid=ServletActionContext.getRequest().getParameter("userid");
		
		List<Order> orderlist=orderservice.getOrderListByUserid(userid);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("myorderlist",orderlist); //保存到request方便前台调用		
		return SUCCESS;
	}
	
	public String modifyOrder(){
		if(ServletActionContext.getRequest().getParameter("orderid")!=null){
		String orderid=ServletActionContext.getRequest().getParameter("orderid");
		String state=ServletActionContext.getRequest().getParameter("state");
		
		order=orderservice.getOrder(orderid);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("order",order); 
	    
		return SUCCESS;
		}
		else
			return ERROR;
	}
	public String updateOrder(){
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");	
		//String bookid=ServletActionContext.getRequest().getParameter("id");
		order.setOrderid(ServletActionContext.getRequest().getParameter("orderid"));
		order.setOrderdate(ServletActionContext.getRequest().getParameter("orderdate"));
		order.setUserid(ServletActionContext.getRequest().getParameter("userid"));
		order.setPayment(ServletActionContext.getRequest().getParameter("payment"));	   
		order.setDeliver(ServletActionContext.getRequest().getParameter("deliver"));	
		order.setReceiver(ServletActionContext.getRequest().getParameter("receiver"));	
		order.setAddress(ServletActionContext.getRequest().getParameter("address"));	
		order.setPhone(ServletActionContext.getRequest().getParameter("phone"));
		order.setState(Integer.parseInt(ServletActionContext.getRequest().getParameter("state")));
		order.setPostcode(ServletActionContext.getRequest().getParameter("postcode"));	
		order.setTotalnum(Integer.parseInt(ServletActionContext.getRequest().getParameter("totalnum")));
		order.setTotalamount(Float.parseFloat(ServletActionContext.getRequest().getParameter("totalamount")));
		orderservice.updateOrder(order);
		
		List<Order> orderlist=orderservice.getOrderList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("orderlist",orderlist); //保存到request方便前台调用	
	    return SUCCESS;
	}
}
