package in.ta.main.service;


import java.io.Console;
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
public class EmployeeService {

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
		if(dep.equals("-1")) {
			return employeeRepositoty.findAll();
		}
             return employeeRepositoty.findAllByDepartment(dep);
	}
	
	public List<Employee> getAllUsers7(String fts)
	{
//		System.out.println(fts);
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
//		Employee employeeData=	employeeRepositoty.findById(id).orElse(null);
//		if(employeeData!=null)
//		{
//			return employeeRepositoty.save(employee);
//		}
//		else {
//			throw new RuntimeErrorException(null, "user not found with :"+id);
//		}
		
		
		Employee existingEmployee = employeeRepositoty.findById(id)
                .orElseThrow(() -> new RuntimeException("Employee not found with id: " + id));

        // Update fields
        existingEmployee.setName(employee.getName());
        existingEmployee.setEmail(employee.getEmail());
        existingEmployee.setDepartment(employee.getDepartment());
        existingEmployee.setDesignation(employee.getDesignation());
        existingEmployee.setJoiningDate(employee.getJoiningDate());
        existingEmployee.setSalary(employee.getSalary());

        // Save and return the updated entity
        return employeeRepositoty.save(employee);
	}
	
	public void deleteEmployee(int id) 
	{
		employeeRepositoty.deleteById(id);
	}

}
