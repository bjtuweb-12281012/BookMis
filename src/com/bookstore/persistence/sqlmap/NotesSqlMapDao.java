package com.bookstore.persistence.sqlmap;

import java.util.List;

import com.bookstore.domain.Employee;
import com.bookstore.domain.Notes;
import com.bookstore.persistence.iface.NotesDao;
import com.ibatis.common.util.PaginatedList;
import com.ibatis.dao.client.DaoManager;

public class NotesSqlMapDao extends BaseSqlMapDao implements NotesDao {

	public NotesSqlMapDao(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}


/*	public PaginatedList getNotesByUsername(String userid) {
		// TODO Auto-generated method stub
		 return queryForPaginatedList("getNotesByUsername", userid, 10);
	}*/


	public Notes getNotes(int id) {
		// TODO Auto-generated method stub
		return (Notes) queryForObject("getNotes",id);
	}


	public void insertNotes(Notes notes) {
		// TODO Auto-generated method stub
		update("insertNotes",notes );
	}
	
	public void updateNotes(Notes notes) {
		// TODO Auto-generated method stub
		update("updateNotes",notes );
	}


	@Override
	public List getNotesList() {
		// TODO Auto-generated method stub
		return queryForList("getNotesList", null);
	}


	@Override
	public void deleteNotes(String id) {
		// TODO Auto-generated method stub
		update("deleteNotes",id);
	}


	@Override
	public List<Notes> getNotesListByUserid(String userid) {
		// TODO Auto-generated method stub
		return queryForList("getNotesByUserid", userid);
	}

}
