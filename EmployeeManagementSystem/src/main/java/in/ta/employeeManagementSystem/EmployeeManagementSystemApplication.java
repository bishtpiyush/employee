package in.ta.employeeManagementSystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication

@ComponentScan(basePackages = "in.ta.main")
@EntityScan(basePackages = "in.ta.main")
@EnableJpaRepositories(basePackages = "in.ta.main")
public class EmployeeManagementSystemApplication {

	public static void main(String[] args) {
		System.out.println("here piyush");
		SpringApplication.run(EmployeeManagementSystemApplication.class, args);
	}

}
