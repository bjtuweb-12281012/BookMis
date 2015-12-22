package com.bookstore.persistence.iface;

import java.util.List;

import com.bookstore.domain.Order;
import com.ibatis.common.util.PaginatedList;

public interface OrderDao {
	//  PaginatedList getOrdersByUserid(String userid);

	  Order getOrder(String orderId);

	  void insertOrder(Order order);
	  
	  void updateOrder(Order order);
	  
	  List getOrderList();

	List<Order> getOrderListByUserid(String userid);

}
