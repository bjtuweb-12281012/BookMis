package com.bookstore.presentation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookstore.domain.Book;
import com.bookstore.domain.Publisher;
import com.bookstore.domain.User;
import com.bookstore.service.BookService;
import com.bookstore.service.PublisherService;
import com.bookstore.service.UserService;
import com.jspsmart.upload.SmartUpload;
import com.opensymphony.xwork2.ActionSupport;

public class BookBean extends ActionSupport {

	private BookService bookservice;
	private Book book;
		
	public BookBean() {
	    this(new BookService());
	  }

	  public BookBean(BookService bookservice) {
		  book = new Book();
	    this.bookservice = bookservice;
	  }
	public String addBook() throws Exception { 
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");		
		//System.out.println(ServletActionContext.getRequest().getParameter("userid"));
		book.setBookid(ServletActionContext.getRequest().getParameter("bookid"));
		book.setBookname(ServletActionContext.getRequest().getParameter("bookname"));
		book.setAuthor(ServletActionContext.getRequest().getParameter("author"));
		book.setPublisherid(Integer.parseInt(ServletActionContext.getRequest().getParameter("publisherid")));
		book.setPubdate(ServletActionContext.getRequest().getParameter("pubdate"));
		book.setPrice(Float.parseFloat(ServletActionContext.getRequest().getParameter("price")));	   
		book.setContent(ServletActionContext.getRequest().getParameter("content"));	
		book.setType(Integer.parseInt(ServletActionContext.getRequest().getParameter("type")));	
		book.setQuantity(Integer.parseInt(ServletActionContext.getRequest().getParameter("quantity")));	
		book.setPlace(ServletActionContext.getRequest().getParameter("place"));
		bookservice.insertBook(book);
		
		List<Book> booklist=bookservice.getBookList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("booklist",booklist); //保存到request方便前台调用	
		
		
		return SUCCESS;
	}
	public String getBookList(){		
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");				
		List<Book> booklist=bookservice.getBookList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("booklist",booklist); //保存到request方便前台调用		
		return SUCCESS;
	}
	public String deleteBook(){
		String bookid=ServletActionContext.getRequest().getParameter("id");
		bookservice.deleteBook(bookid);
		
		List<Book> booklist=bookservice.getBookList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("booklist",booklist); //保存到request方便前台调用	
		return SUCCESS;
	}
	
	public String modifyBook(){
		String bookid=ServletActionContext.getRequest().getParameter("id");
		
		book=bookservice.getBook(bookid);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("book",book); 
	    
		return SUCCESS;
	}
	public String updateBook(){
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");	
		//String bookid=ServletActionContext.getRequest().getParameter("id");
		book.setBookid(ServletActionContext.getRequest().getParameter("bookid"));
		book.setBookname(ServletActionContext.getRequest().getParameter("bookname"));
		book.setAuthor(ServletActionContext.getRequest().getParameter("author"));
		book.setPublisherid(Integer.parseInt(ServletActionContext.getRequest().getParameter("publisherid")));
		book.setPubdate(ServletActionContext.getRequest().getParameter("pubdate"));
		book.setPrice(Float.parseFloat(ServletActionContext.getRequest().getParameter("price")));	   
		book.setContent(ServletActionContext.getRequest().getParameter("content"));	
		book.setType(Integer.parseInt(ServletActionContext.getRequest().getParameter("type")));	
		book.setQuantity(Integer.parseInt(ServletActionContext.getRequest().getParameter("quantity")));	
		book.setPlace(ServletActionContext.getRequest().getParameter("place"));
		book.setPicture(ServletActionContext.getRequest().getParameter("picture"));	
		bookservice.updateBook(book);
		
		List<Book> booklist=bookservice.getBookList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("booklist",booklist); //保存到request方便前台调用	
		return SUCCESS;
	}
	public String getBookListByType(){
		int type=Integer.parseInt(ServletActionContext.getRequest().getParameter("type"));
		List<Book> booklistbytype=bookservice.getBookListByType(type);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("booklistbytype",booklistbytype); //保存到request方便前台调用	
		return SUCCESS;
	}
	public String getBookById(){
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		String id =ServletActionContext.getRequest().getParameter("bookid");
		book=bookservice.getBookById(id);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("book",book); //保存到request方便前台调用	
		return SUCCESS;
	}
	public String searchBook(){
		Book book = new Book();
		String s_bookid=ServletActionContext.getRequest().getParameter("bookid");
	    String s_bookname=ServletActionContext.getRequest().getParameter("bookname");
	    String s_author=ServletActionContext.getRequest().getParameter("author");
	    String s_price=ServletActionContext.getRequest().getParameter("price");
	    String s_price2=ServletActionContext.getRequest().getParameter("price2");
	    String s_publisher=ServletActionContext.getRequest().getParameter("publisher");
	    String s_type=ServletActionContext.getRequest().getParameter("type"); 
	    
	    if(!s_bookid.equals(""))
	      book.setBookid(s_bookid);
	    if(!s_bookname.equals(""))
	      book.setBookname(s_bookname);
	    if(!s_author.equals(""))
	      book.setAuthor(s_author);
	 /*   if(!s_price.equals(""))
	      book.setBookid(s_bookid);
	    if(!s_price2.equals(""))
	      book.setBookid(s_bookid);*/
	    if(!s_publisher.equals(""))
	      book.setPublishername(s_publisher);
	    if(!s_type.equals(""))
	      book.setType(Integer.parseInt(s_type));
	    List<Book> booklist=bookservice.searchBookList(book);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("booklist",booklist); //保存到request方便前台调用	
	    
		return SUCCESS;
	}
}
