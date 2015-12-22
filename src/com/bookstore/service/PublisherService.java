package com.bookstore.service;

import java.util.List;

import com.bookstore.domain.Publisher;
import com.bookstore.persistence.DaoConfig;
import com.bookstore.persistence.iface.PublisherDao;
import com.bookstore.persistence.iface.UserDao;
import com.ibatis.dao.client.DaoManager;

public class PublisherService {
	private PublisherDao publisherDao;
	public PublisherService() {
	    DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.publisherDao = (PublisherDao) daoMgr.getDao(PublisherDao.class);
	  }
	public List getPublisherList(){
		return publisherDao.getPublisherList();
	}
	public Publisher getPublisher(String publisherId){
		return publisherDao.getPublisher(publisherId);
	}
	public void insertPublisher(Publisher publisher){
		publisherDao.insertPublisher(publisher);
	}
	public void updatePublisher(Publisher publisher){
		publisherDao.updatePublisher(publisher);
	}
	public void deletePublisher(String publisherid){
		publisherDao.deletePublisher(publisherid);
	}
}
