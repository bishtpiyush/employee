package in.ta.main.repository;

import java.util.LinkedList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.ta.main.entities.Employee;

@Repository
public interface EmployeeRepositoty extends JpaRepository<Employee, Integer> 
{
	LinkedList<Employee>findAllByDepartment(String department);
	LinkedList<Employee>findAllByName(String fts);
	 
}
