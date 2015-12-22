package com.bookstore.persistence.iface;

import java.util.List;

import com.bookstore.domain.Notes;
import com.ibatis.common.util.PaginatedList;

public interface NotesDao {
	// PaginatedList getNotesByUsername(String userid);
	  List getNotesList();  
	
	  Notes getNotes(int id);

	  void insertNotes(Notes notes);
	  
	  void updateNotes(Notes notes);
	  
	  void deleteNotes(String id);

	List<Notes> getNotesListByUserid(String userid);
}
