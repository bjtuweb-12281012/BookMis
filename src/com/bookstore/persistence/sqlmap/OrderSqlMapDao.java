package com.bookstore.persistence.sqlmap;

import java.util.List;

import com.bookstore.domain.Order;
import com.bookstore.domain.OrderDetail;
import com.bookstore.persistence.iface.OrderDao;
import com.ibatis.common.util.PaginatedList;
import com.ibatis.dao.client.DaoManager;

public class OrderSqlMapDao extends BaseSqlMapDao implements OrderDao{

	public OrderSqlMapDao(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}

/*	public PaginatedList getOrdersByUserid(String userid) {
		// TODO Auto-generated method stub
		return queryForPaginatedList("getOrderByUserid", userid, 10);
	}*/

	public Order getOrder(String orderId) {
		// TODO Auto-generated method stub
		return (Order) queryForObject("getOrder",orderId);
	}

	public void insertOrder(Order order) {
		// TODO Auto-generated method stub
		update("insertOrder",order );
		
	}
	
	public void updateOrder(Order order) {
		// TODO Auto-generated method stub
		update("updateOrder",order );
		
	}
    
	 public List getOrderList() {
		  return queryForList("getOrderList", null);
		}

	@Override
	public List<Order> getOrderListByUserid(String userid) {
		// TODO Auto-generated method stub
		return queryForList("getOrderListByUserid", userid);
	}

}
