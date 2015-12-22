package com.bookstore.persistence.sqlmap;

import java.util.List;

import com.bookstore.domain.Publisher;
import com.bookstore.domain.User;
import com.bookstore.persistence.iface.UserDao;
import com.ibatis.dao.client.DaoManager;

public class UserSqlMapDao extends BaseSqlMapDao implements UserDao{

	public UserSqlMapDao(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}

	public User getUser(String username) {
		// TODO Auto-generated method stub
		return (User) queryForObject("getUser",username);
	}
	
	public List getUserList() {
		// TODO Auto-generated method stub
		return queryForList("getUserList",null);
	}


	public void insertUser(User user) {
		// TODO Auto-generated method stub
		update("insertUser",user );
		
	}
	
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		update("updateUser",user );
		
	}
	
	public void deleteUser(String userid){
		update("deleteUser",userid );
	}



	public User getUser(String username, String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		return (User) queryForObject("searchUserByUsernameAndPassword", user);
	}

	@Override
	public void passwordedit(String userid, String password) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserid(userid);
		user.setPassword(password);
		update("passwordedit",user);
	}

}
