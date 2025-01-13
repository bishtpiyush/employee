package in.ta.main.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmployeeDataController {

	
	@GetMapping("/employee-list")
	public String openEmployeeList()
	{
		return "employee-list";
	}
	
	@GetMapping("/edit-employee/{id}")
	public String editEmployee() {
	
		return "edit-employee";
	}
	
	@GetMapping("/index")
	public String openIndex()
	{
		return "index";
	}
}
