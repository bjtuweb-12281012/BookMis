package com.bookstore.persistence.sqlmap;

import java.util.List;

import com.bookstore.domain.Notes;
import com.bookstore.domain.OrderDetail;
import com.bookstore.persistence.iface.OrderDetailDao;
import com.ibatis.common.util.PaginatedList;
import com.ibatis.dao.client.DaoManager;

public class OrderDetailSqlMapDao extends BaseSqlMapDao implements OrderDetailDao{

	public OrderDetailSqlMapDao(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}


	/*public PaginatedList getOrderDetail(String orderid) {
		// TODO Auto-generated method stub
		return queryForPaginatedList("getOrderDetail", orderid, 10);
	}*/


	public OrderDetail getOrderDetailByOrderid(String orderid) {
		return (OrderDetail) queryForObject("searchOrderDetailByOrderId",orderid);
	}


	public void insertOrderDetail(OrderDetail orderdetail) {
		// TODO Auto-generated method stub
		update("insertOrderDetail",orderdetail );
		
	}
	
	public void updateOrderDetail(OrderDetail orderdetail) {
		// TODO Auto-generated method stub
		update("updateOrderDetail",orderdetail );
		
	}
	 public List getOrderDetailList() {
		  return queryForList("getOrderDetailList", null);
		}


	@Override
	public List getOrderDetailListByOrderid(String orderdetailid) {
		// TODO Auto-generated method stub
		return queryForList("getOrderDetailListByOrderid", orderdetailid);
	}

}
