package com.bookstore.persistence.sqlmap;

import java.util.List;

import com.bookstore.domain.Notes;
import com.bookstore.domain.Publisher;
import com.bookstore.persistence.iface.PublisherDao;
import com.ibatis.dao.client.DaoManager;

public class PublisherSqlMapDao extends BaseSqlMapDao implements PublisherDao{

	public PublisherSqlMapDao(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}

	public List getPublisherList() {
		// TODO Auto-generated method stub
		return queryForList("getPublisherList", null);
	}

	public Publisher getPublisher(String publisherid) {
		// TODO Auto-generated method stub
		return (Publisher) queryForObject("getPublisherbyid",publisherid);
	}

	public void insertPublisher(Publisher publisher) {
		// TODO Auto-generated method stub
		update("insertPulisher",publisher );
	}
	
	public void updatePublisher(Publisher publisher) {
		// TODO Auto-generated method stub
		update("updatePulisher",publisher );
	}

	@Override
	public void deletePublisher(String publisherid) {
		// TODO Auto-generated method stub
		update("deletePublisher",publisherid);
	}


}
