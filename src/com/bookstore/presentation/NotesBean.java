package com.bookstore.presentation;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookstore.domain.Notes;
import com.bookstore.domain.User;
import com.bookstore.service.NotesService;
import com.bookstore.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class NotesBean extends ActionSupport {

	private NotesService NotesService;
	private Notes Notes;
		
	public NotesBean() {
	    this(new NotesService());
	  }

	  public NotesBean(NotesService NotesService) {
		  Notes = new Notes();
	    this.NotesService = NotesService;
	  }
	public String addNotes() throws Exception { 
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");		
		//System.out.println(ServletActionContext.getRequest().getParameter("userid"));
		Notes.setUserid(ServletActionContext.getRequest().getParameter("userid"));
		Notes.setSubject(ServletActionContext.getRequest().getParameter("subject"));
		Notes.setContext(ServletActionContext.getRequest().getParameter("context"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Notes.setDate1(df.format(new Date()));
 
		NotesService.insertNotes(Notes);
		
		List<Notes> Noteslist=NotesService.getNotesListByUserid(Notes.getUserid());
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("noteslist",Noteslist); //保存到request方便前台调用		
	    
		return SUCCESS;
	}
	public String getNotesList(){		
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");				
		List<Notes> Noteslist=NotesService.getNotesList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("noteslist",Noteslist); //保存到request方便前台调用		
		return SUCCESS;
	}
	public String deleteNotes(){
		String Notesid=ServletActionContext.getRequest().getParameter("id");
		NotesService.deleteNotes(Notesid);
		
		List<Notes> Noteslist=NotesService.getNotesList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("noteslist",Noteslist); //保存到request方便前台调用		
		return SUCCESS;
	}
	public String modifyNotes(){
		String Notesid=ServletActionContext.getRequest().getParameter("id");
		
		Notes=NotesService.getNotes(Integer.parseInt(Notesid));
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("notes",Notes); 
		return SUCCESS;
	}
	public String updateNotes(){
		String notesid=ServletActionContext.getRequest().getParameter("id");
		Notes.setId(Integer.parseInt(notesid));
		Notes.setUserid(ServletActionContext.getRequest().getParameter("userid"));
		Notes.setSubject(ServletActionContext.getRequest().getParameter("subject"));
		Notes.setDate1(ServletActionContext.getRequest().getParameter("date1"));
		Notes.setContext(ServletActionContext.getRequest().getParameter("context"));
		Notes.setEmployeeid(ServletActionContext.getRequest().getParameter("employeeid"));
		Notes.setDate2(ServletActionContext.getRequest().getParameter("date2"));	
		Notes.setAdvice(ServletActionContext.getRequest().getParameter("advice"));   
		NotesService.updateNotes(Notes);
		
		List<Notes> noteslist=NotesService.getNotesList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("noteslist",noteslist); //保存到request方便前台调用	
		return SUCCESS;
	}
	public String myNotesList(){		
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");	
		if(ServletActionContext.getRequest().getParameter("userid")!=null){
		String userid=ServletActionContext.getRequest().getParameter("userid");
		
		List<Notes> Noteslist=NotesService.getNotesListByUserid(userid);
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("noteslist",Noteslist); //保存到request方便前台调用		
		return SUCCESS;
		}
		else
			return ERROR;
	}
}
