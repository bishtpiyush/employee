package in.ta.main.service;

import org.springframework.stereotype.Service;

import in.ta.main.entities.Employee;

@Service
public interface EmployeeService 
{

	public Employee createEmployee(Employee employee);
}
