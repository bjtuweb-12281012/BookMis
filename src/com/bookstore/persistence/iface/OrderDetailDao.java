package com.bookstore.persistence.iface;

import java.util.List;

import com.bookstore.domain.Order;
import com.bookstore.domain.OrderDetail;
import com.ibatis.common.util.PaginatedList;

public interface OrderDetailDao {
	 //PaginatedList getOrderDetailByOrderid(String orderId);

	  OrderDetail getOrderDetailByOrderid(String orderid);

	  void insertOrderDetail(OrderDetail orderdetail);
	  
	  void updateOrderDetail(OrderDetail orderdetail);
	  
	  List getOrderDetailList();

	List getOrderDetailListByOrderid(String orderdetailid);

}
