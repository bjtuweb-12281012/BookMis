package com.bookstore.persistence.sqlmap;

import java.util.List;

import com.bookstore.domain.Book;
import com.bookstore.domain.Employee;
import com.bookstore.persistence.iface.EmployeeDao;
import com.ibatis.dao.client.DaoManager;

public class EmployeeSqlMapDao extends BaseSqlMapDao implements EmployeeDao {

	public EmployeeSqlMapDao(DaoManager daoManager) {
		super(daoManager);
		// TODO Auto-generated constructor stub
	}

 
	public List getEmployeeList( ) {
		// TODO Auto-generated method stub
		return queryForList("getEmployeeList", null);
	}


	public Employee getEmployee(String EmployeeId) {
		// TODO Auto-generated method stub
		return (Employee) queryForObject("getEmployee",EmployeeId);
	}
	
	public Employee getEmployee(String name, String password){
		Employee employee=new Employee();
		employee.setName(name);
		employee.setPassword(password);
		return (Employee) queryForObject("getEmployeeBynameandPassword",employee);
	}


	public void insertEmployee(Employee employee) {
		// TODO Auto-generated method stub
		update("insertEmployee", employee);
	}
	
	 public void updateEmployee(Employee employee) {
			// TODO Auto-generated method stub
			 update("updateEmployee", employee);
	}
	 public void deleteEmployee(String employeeid){
			update("deleteEmployee",employeeid);
		}
}
