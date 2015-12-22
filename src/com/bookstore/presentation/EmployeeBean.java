package com.bookstore.presentation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookstore.domain.Employee;
import com.bookstore.domain.User;
import com.bookstore.service.EmployeeService;
import com.bookstore.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeBean extends ActionSupport {

	private EmployeeService employeeService;
	private Employee employee;
		
	public EmployeeBean() {
	    this(new EmployeeService());
	  }

	  public EmployeeBean(EmployeeService employeeService) {
		  employee = new Employee();
	    this.employeeService = employeeService;
	  }
	public String addEmployee() throws Exception { 
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");		
		//System.out.println(ServletActionContext.getRequest().getParameter("userid"));
		employee.setEmployeeid(ServletActionContext.getRequest().getParameter("employeeid"));
		employee.setName(ServletActionContext.getRequest().getParameter("name"));
		employee.setPassword(ServletActionContext.getRequest().getParameter("password"));
		employee.setGender(ServletActionContext.getRequest().getParameter("gender"));
		employee.setAddress(ServletActionContext.getRequest().getParameter("address"));
		employee.setEmail(ServletActionContext.getRequest().getParameter("email"));	
		employee.setPhone(ServletActionContext.getRequest().getParameter("phone"));   
		employee.setTask(ServletActionContext.getRequest().getParameter("task"));
		employeeService.insertEmployee(employee);
		
		List<Employee> employeelist=employeeService.getEmployeeList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("employeelist",employeelist); //保存到request方便前台调用
	    
		return SUCCESS;
	}
	public String loginEmployee(){
		String name=ServletActionContext.getRequest().getParameter("name");
		String password=ServletActionContext.getRequest().getParameter("password");
		employee=employeeService.getEmployee(name, password);
		
		if(employee==null)
		{
			return ERROR;
		}
		else{
			return SUCCESS;
		}
	}
	public String getEmployeeList(){		
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");				
		List<Employee> employeelist=employeeService.getEmployeeList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("employeelist",employeelist); //保存到request方便前台调用		
		return SUCCESS;
	}
	public String deleteEmployee(){
		String employeeid=ServletActionContext.getRequest().getParameter("id");
		employeeService.deleteEmployee(employeeid);
		
		List<Employee> employeelist=employeeService.getEmployeeList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
	    request.setAttribute("employeelist",employeelist); //保存到request方便前台调用		
		return SUCCESS;
	}
}
