package com.bookstore.service;

import java.util.List;

import com.bookstore.domain.Order;
import com.bookstore.persistence.DaoConfig;
import com.bookstore.persistence.iface.BookDao;
import com.bookstore.persistence.iface.OrderDao;
import com.ibatis.common.util.PaginatedList;
import com.ibatis.dao.client.DaoManager;

public class OrderService {
	private OrderDao orderDao;
	
	public OrderService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
		this.orderDao=(OrderDao)daoMgr.getDao(OrderDao.class);
	}
	/*public PaginatedList getOrdersByUserid(String userid){
		return orderDao.getOrdersByUserid(userid);
	}*/
	public Order getOrder(String orderId){
		return orderDao.getOrder(orderId);
	}
	public void insertOrder(Order order){
		orderDao.insertOrder(order);
	}
	public void updateOrder(Order order){
		orderDao.updateOrder(order);
	}
	public List getOrderList(){
		return orderDao.getOrderList();
	}
	public List<Order> getOrderListByUserid(String userid) {
		// TODO Auto-generated method stub
		return orderDao.getOrderListByUserid(userid);
	}
}
