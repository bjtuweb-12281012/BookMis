package com.bookstore.presentation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookstore.domain.Publisher;
import com.bookstore.domain.User;
import com.bookstore.service.PublisherService;
import com.bookstore.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class PublisherBean extends ActionSupport {

	private PublisherService publisherservice;
	private Publisher publisher;
		
	public PublisherBean() {
	    this(new PublisherService());
	  }

	  public PublisherBean(PublisherService publisherservice) {
	    publisher = new Publisher();
	    this.publisherservice = publisherservice;
	  }
	public String addPublisher() throws Exception { 
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");		
		//System.out.println(ServletActionContext.getRequest().getParameter("userid"));
		publisher.setName(ServletActionContext.getRequest().getParameter("publishername"));
		publisher.setLinkname(ServletActionContext.getRequest().getParameter("linkname"));
		publisher.setAddress(ServletActionContext.getRequest().getParameter("address"));
		publisher.setEmail(ServletActionContext.getRequest().getParameter("email"));
		publisher.setPhone(ServletActionContext.getRequest().getParameter("phone"));
		publisher.setWebsite(ServletActionContext.getRequest().getParameter("website"));	   
		publisherservice.insertPublisher(publisher);
		
		List<Publisher> publisherlist=publisherservice.getPublisherList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("publisherlist",publisherlist); //保存到request方便前台调用	
		
		
		return SUCCESS;
	}
	public String getPublisherList(){		
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");				
		List<Publisher> publisherlist=publisherservice.getPublisherList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("publisherlist",publisherlist); //保存到request方便前台调用		
		return SUCCESS;
	}
	public String deletePublisher(){
		String publisherid=ServletActionContext.getRequest().getParameter("id");
		publisherservice.deletePublisher(publisherid);
		
		List<Publisher> publisherlist=publisherservice.getPublisherList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("publisherlist",publisherlist); //保存到request方便前台调用	
		return SUCCESS;
	}
	
	public String modifyPublisher(){
		String publisherid=ServletActionContext.getRequest().getParameter("id");
		
		publisher=publisherservice.getPublisher(publisherid);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("publisher",publisher); 
		return SUCCESS;
	}
	public String updatePublisher(){
		String publisherid=ServletActionContext.getRequest().getParameter("id");
		int id=Integer.parseInt(publisherid);
		publisher.setPublisherid(id);
		publisher.setName(ServletActionContext.getRequest().getParameter("name"));
		publisher.setLinkname(ServletActionContext.getRequest().getParameter("linkname"));
		publisher.setAddress(ServletActionContext.getRequest().getParameter("address"));
		publisher.setEmail(ServletActionContext.getRequest().getParameter("email"));
		publisher.setPhone(ServletActionContext.getRequest().getParameter("phone"));
		publisher.setWebsite(ServletActionContext.getRequest().getParameter("website"));
		publisherservice.updatePublisher(publisher);
		
		List<Publisher> publisherlist=publisherservice.getPublisherList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("publisherlist",publisherlist); //保存到request方便前台调用	
		return SUCCESS;
	}
}
