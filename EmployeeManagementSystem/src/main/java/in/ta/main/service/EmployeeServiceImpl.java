package in.ta.main.service;


import java.util.List;
import java.util.Optional;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import in.ta.main.entities.Employee;
import in.ta.main.repository.EmployeeRepositoty;

@Service
public class EmployeeServiceImpl {

	@Autowired
	private EmployeeRepositoty employeeRepositoty;
	
	public Employee createEmployee(Employee employee) {
		try {
			return employeeRepositoty.save(employee);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public List<Employee> getAllUsers(
			
			)
	{
             return employeeRepositoty.findAll();
	}
	
	public List<Employee> getAllUsers3(String dep)
	{
             return employeeRepositoty.findAllByDepartment(dep);
	}
	
	public List<Employee> getAllUsers7(String fts)
	{
             return employeeRepositoty.findAllByName(fts);
	}
	public List<Employee> getAllUsers2(Integer pageNumber, Integer pageSize)
	{
		Pageable pageable= PageRequest.of(pageNumber, pageSize);
		
		Page<Employee> findAllPage = employeeRepositoty.findAll(pageable);
		return findAllPage.getContent();
	}
	
	public Optional<Employee> getUserDetails(int id) {
		
		return employeeRepositoty.findById(id);
	}
	
	public Employee updateEmployeeDeatils(int id, Employee employee)
	{
		Employee employeeData=	employeeRepositoty.findById(id).orElse(null);
		if(employeeData!=null)
		{
			return employeeRepositoty.save(employee);
		}
		else {
			throw new RuntimeErrorException(null, "user not found with :"+id);
		}
	}
	
	public void deleteEmployee(int id) 
	{
		employeeRepositoty.deleteById(id);
	}

}
