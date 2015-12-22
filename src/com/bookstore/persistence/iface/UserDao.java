package com.bookstore.persistence.iface;

import java.util.List;

import com.bookstore.domain.User;


public interface UserDao {
	  User getUser(String username);
	  
	  List getUserList();

	  User getUser(String username, String password);

	  void insertUser(User user);
	  
	  void updateUser(User user);
	  
	  void deleteUser(String userid);

	void passwordedit(String userid, String password);


}
