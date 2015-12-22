package com.bookstore.service;

import java.util.List;

import com.bookstore.domain.OrderDetail;
import com.bookstore.persistence.DaoConfig;
import com.bookstore.persistence.iface.OrderDao;
import com.bookstore.persistence.iface.OrderDetailDao;
import com.ibatis.common.util.PaginatedList;
import com.ibatis.dao.client.DaoManager;

public class OrderDetailService {
	private OrderDetailDao orderdetailDao;
	
	/*public PaginatedList getOrderDetailByOrderid(String orderId){
		return orderdetailDao.getOrderDetailByOrderid(orderId);
	}*/
	public OrderDetailService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
		this.orderdetailDao=(OrderDetailDao)daoMgr.getDao(OrderDetailDao.class);
	}
	public OrderDetail getOrderDetail(String orderId){
		return orderdetailDao.getOrderDetailByOrderid(orderId);
	}
	public void insertOrderDetail(OrderDetail orderdetail){
		orderdetailDao.insertOrderDetail(orderdetail);
	}
	public void updateOrderDetail(OrderDetail orderdetail){
		orderdetailDao.updateOrderDetail(orderdetail);
	}
	public List getOrderDetailList(){
		return orderdetailDao.getOrderDetailList();
	}
	public List getOrderDetailListByOrderid(String orderdetailid) {
		// TODO Auto-generated method stub
		return orderdetailDao.getOrderDetailListByOrderid(orderdetailid);
	}
}
