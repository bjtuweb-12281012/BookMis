package com.bookstore.service;

import java.sql.SQLException;

import com.bookstore.domain.ReadersBean;
import com.bookstore.persistence.iface.ReadersDao;

public class ReadersService {
	ReadersDao readersDao;
	public ReadersDao getReadersDao() {
		return readersDao;
	}
	public void setReadersDao(ReadersDao readersDao){
		this.readersDao=readersDao;
	}
	public ReadersBean getReaders(String Readersid) throws SQLException{
		return readersDao.getReaders(Readersid);
	}

}
