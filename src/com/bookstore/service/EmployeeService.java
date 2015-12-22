package com.bookstore.service;

import java.util.List;

import com.bookstore.domain.Employee;
import com.bookstore.persistence.DaoConfig;
import com.bookstore.persistence.iface.EmployeeDao;
import com.ibatis.dao.client.DaoManager;


public class EmployeeService {
	private EmployeeDao employeeDao;

	public EmployeeService() {
		DaoManager daoMgr = DaoConfig.getDaoManager();
		this.employeeDao = (EmployeeDao) daoMgr.getDao(EmployeeDao.class);
	}
	public List getEmployeeList(){
		return employeeDao.getEmployeeList();
	}
	public Employee getEmployee(String EmployeeId){
		return employeeDao.getEmployee(EmployeeId);
	}
	public void insertEmployee(Employee employee){
		employeeDao.insertEmployee(employee);
	}
	public void updateEmployee(Employee employee){
		employeeDao.updateEmployee(employee);
	}
	public void deleteEmployee(String employeeid){
		employeeDao.deleteEmployee(employeeid);
	}
	public Employee getEmployee(String name, String password){
		return employeeDao.getEmployee(name, password);
	}
}
