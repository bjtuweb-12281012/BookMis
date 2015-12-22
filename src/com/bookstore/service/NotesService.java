package com.bookstore.service;

import java.util.List;

import com.bookstore.domain.Notes;
import com.bookstore.persistence.DaoConfig;
import com.bookstore.persistence.iface.EmployeeDao;
import com.bookstore.persistence.iface.NotesDao;
import com.ibatis.common.util.PaginatedList;
import com.ibatis.dao.client.DaoManager;

public class NotesService {
	private NotesDao notesDao;
	
	/*public PaginatedList getNotesByUsername(String userid){
		return notesDao.getNotesByUsername(userid);
	}*/
	public NotesService() {
		DaoManager daoMgr = DaoConfig.getDaoManager();
		this.notesDao = (NotesDao) daoMgr.getDao(NotesDao.class);
	}
	public Notes getNotes(int notesId){
		return notesDao.getNotes(notesId);
	}
	public void insertNotes(Notes notes){
		notesDao.insertNotes(notes);
	}
	public void updateNotes(Notes notes){
		notesDao.updateNotes(notes);
	}
	public List getNotesList(){
		return notesDao.getNotesList();
	}
	public void deleteNotes(String employeeid){
		notesDao.deleteNotes(employeeid);
	}
	public List<com.bookstore.domain.Notes> getNotesListByUserid(String userid) {
		// TODO Auto-generated method stub
		return notesDao.getNotesListByUserid(userid);
	}
}
