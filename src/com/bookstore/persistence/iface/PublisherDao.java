package com.bookstore.persistence.iface;

import java.util.List;

import com.bookstore.domain.Publisher;

public interface PublisherDao {
	List getPublisherList();

	Publisher getPublisher(String publisherId);
	
	void insertPublisher(Publisher publisher);
	
	void updatePublisher(Publisher publisher);
	
	void deletePublisher(String publisherid);
}
