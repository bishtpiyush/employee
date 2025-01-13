package in.ta.main.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import in.ta.main.entities.Employee;
import in.ta.main.service.EmployeeService;

@RestController
@RequestMapping("/api/employees")
public class EmployeeController 
{
	@Autowired
	EmployeeService employeeService;
	
	@PostMapping("/user")
	public Employee addEmployeeDeatils(@RequestBody Employee employee)
	{
		return employeeService.createEmployee(employee);
	}
	
	@GetMapping("/user")
	public List<Employee> getAllEmployeeDeatils()
	{
		return employeeService.getAllUsers();
	}
	
	@GetMapping("/getDeprt")
	  public List<Employee> getAllEmployeeDeatils2(@RequestParam Map<String, Object>map) {
		String departmentString=map.get("deparment").toString();
		
		  return employeeService.getAllUsers3(departmentString); 
	  
	  }
	
	@GetMapping("/getFts")
	  public List<Employee> getAllEmployeeDeatils7(@RequestParam Map<String, Object>map) {
		String fts=map.get("fts").toString();
		
		  return employeeService.getAllUsers7(fts); 
	  
	  }
	 
	
	@GetMapping("/user/{id}")
	public ResponseEntity<Employee> getEmployeeDeatils(@PathVariable  int id) 
	{ 
		Employee employee= employeeService.getUserDetails(id).orElse(null);
		if (employee!=null) {
			return ResponseEntity.ok().body(employee);
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	
	
	@PutMapping("user/{id}")
	public ResponseEntity<Employee> updateEmployeeDeatils(@PathVariable int id, @RequestBody Employee employee) {
		
		
		Employee updateEmployee = employeeService.updateEmployeeDeatils(id, employee);
		if(updateEmployee!=null)
		{
			return ResponseEntity.ok(updateEmployee);
		}
		else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@DeleteMapping("user/{id}")
	public ResponseEntity<Void> deleteEmployee(@PathVariable int id) 
	{
		System.out.println("delete");
		employeeService.deleteEmployee(id);
		return ResponseEntity.noContent().build();
	}
	 
	
}
