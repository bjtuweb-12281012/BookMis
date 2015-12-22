package com.bookstore.service;

import java.util.List;

import com.bookstore.domain.User;
import com.bookstore.persistence.DaoConfig;
import com.bookstore.persistence.iface.UserDao;
import com.ibatis.dao.client.DaoManager;


public class UserService {
	private UserDao userDao;
	
	public UserService() {
		    DaoManager daoMgr = DaoConfig.getDaoManager();
		    this.userDao = (UserDao) daoMgr.getDao(UserDao.class);
		  }
	
	public User getUser(String username){
		return userDao.getUser(username);
	}
	public User getUser(String username, String password){
		return userDao.getUser(username, password);
	}
	public List getUserList(){
		return userDao.getUserList();
	}
	public void insertUser(User user){
		userDao.insertUser(user);
	}
	public void updateUser(User user){
		userDao.updateUser(user);
	}
	public void deleteUser(String userid){
		userDao.deleteUser(userid);
	}

	public void passwordedit(String userid, String password) {
		// TODO Auto-generated method stub
		userDao.passwordedit(userid,password);
		
	}
}
