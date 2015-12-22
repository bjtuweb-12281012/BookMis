package com.bookstore.persistence.iface;

import java.util.List;

import com.bookstore.domain.Employee;

public interface EmployeeDao {
	List getEmployeeList();

	Employee getEmployee(String EmployeeId);
	
	void insertEmployee(Employee employee);
    
	void updateEmployee(Employee employee);
	
	void deleteEmployee(String employeeid);
	
	Employee getEmployee(String name, String password);
}
