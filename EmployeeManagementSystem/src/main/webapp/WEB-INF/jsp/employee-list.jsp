<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee List</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<link rel="stylesheet" href="css/style.css" />
	<script>
		function applyFilter(){
			var department=document.getElementById("departmentFilter").value;
			var data={};
			data['deparment']=department;
			$.ajax({
			                    url: "http://localhost:8080/api/employees/getDeprt",
			                    method: "GET",
								data:data,
			                    success: function (data) {
									console.log(data);
									let tableBody = $("#employeeTable tbody");
									                       tableBody.empty(); // Clear previous data
									                       data.forEach(function (employee) {
															console.log(employee.employeeId);
															console.log(${employee.name});
															
															
									                           tableBody.append("<tr><td>"+
																employee.employeeId+"</td><td>"+
																employee.name+"</td><td>"+
																employee.email+"</td><td>"+
																employee.department+"</td><td>"+
																employee.designation+"</td><td>"+
																employee.joiningDate+"</td><td>"+
																employee.salary+"</td><td>"+
									                               "<button onclick='editEmployee("+employee.employeeId+")'>Edit</button></td><td>"+
									                               "<button onclick='deleteEmployee("+employee.employeeId+")'>Delete</button>"+
									                               "</td></tr>"
									                          );
									                       });
			                      
			                          
			                      
			                    },
			                    error: function (err) {
			                        alert("Error fetching employees: " + err.responseText);
			                    }
			                })
		}
		function searchbar(){
			debugger;
			var fts=document.getElementById("fts").value;
			var data={};
						data['fts']=fts;
						$.ajax({
						                    url: "http://localhost:8080/api/employees/getFts",
						                    method: "GET",
											data:data,
						                    success: function (data) {
												let tableBody = $("#employeeTable tbody");
												                       tableBody.empty(); // Clear previous data
												                       data.forEach(function (employee) {
																		
																		
												                           tableBody.append("<tr><td>"+
																			employee.employeeId+"</td><td>"+
																			employee.name+"</td><td>"+
																			employee.email+"</td><td>"+
																			employee.department+"</td><td>"+
																			employee.designation+"</td><td>"+
																			employee.joiningDate+"</td><td>"+
																			employee.salary+"</td><td>"+
												                               "<button onclick='editEmployee("+employee.employeeId+")'>Edit</button></td><td>"+
												                               "<button onclick='deleteEmployee("+employee.employeeId+")'>Delete</button>"+
												                               "</td></tr>"
												                          );
												                       });
						                      
						                          
						                      
						                    },
						                    error: function (err) {
						                        alert("Error fetching employees: " + err.responseText);
						                    }
						                })
		}
		</script>
</head>
<body>
	
	<button type="button" onclick="addnew()">NewEmployee</button>
	
	<div>
	    <label for="departmentFilter">Filter by Department: </label>
	    <select id="departmentFilter">
	        <option value="-1">All Departments</option>
	        <!-- Add departments dynamically or manually -->
	        <option value="IT">IT</option>
	        <option value="HR">HR</option>
	        <option value="Finance">Finance</option>
	        <option value="Marketing">Marketing</option>
	    </select>
	    <button id="applyFilter" onclick ="applyFilter()">Apply Filter</button>
	</div>
	<div>
	        <label for="searchBar">Search: </label>
	        <input type="text" id="fts" placeholder="Search by name, email, or designation">
	        <button id="searchButton" onclick="searchbar()">Search</button>
	    </div>
    <h1>Employee Management</h1>
    <table border="1" id="employeeTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Joining Date</th>
                <th>Salary</th>
                <th>Edit</th>
				<th>Delete</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
	
	

    <script>
		
		
		
        $(document).ready(function () {
            // Fetch and display employee data
            fetchEmployees();

            // Function to fetch employees
            function fetchEmployees() {
                $.ajax({
                    url: "http://localhost:8080/api/employees/user",
                    method: "GET",
                    success: function (data) {
						console.log("hello00");
                        let tableBody = $("#employeeTable tbody");
                        tableBody.empty(); // Clear previous data
                        data.forEach(function (employee) {
							console.log(employee.employeeId);
							console.log(${employee.name});
							
							
                            tableBody.append("<tr><td>"+
								employee.employeeId+"</td><td>"+
								employee.name+"</td><td>"+
								employee.email+"</td><td>"+
								employee.department+"</td><td>"+
								employee.designation+"</td><td>"+
								employee.joiningDate+"</td><td>"+
								employee.salary+"</td><td>"+
                                "<button onclick='editEmployee("+employee.employeeId+")'>Edit</button></td><td>"+
                                "<button onclick='deleteEmployee("+employee.employeeId+")'>Delete</button>"+
                                "</td></tr>"
                           );
                        });
                    },
                    error: function (err) {
                        alert("Error fetching employees: " + err.responseText);
                    }
                });
				
            }
			
			// Make functions global for pagination and other actions
			

            // Function to delete an employee
            window.deleteEmployee = function (id) {
                if (confirm("Are you sure you want to delete this employee?")) {
                    $.ajax({
                        url: "http://localhost:8080/api/employees/user/"+id,
                        method: "DELETE",
                        success: function () {
                            alert("Employee deleted successfully.");
                            fetchEmployees(); // Refresh the list
                        },
                        error: function (err) {
                            alert("Error deleting employee: " + err.responseText);
                        }
                    });
                }
            };

            // Function to edit an employee (redirects to edit form)
            window.editEmployee = function (id) {
                window.location.href = "edit-employee/id="+id;
            };
        });
		
		function addnew() {
				           window.location.href = "/index";
				}
    </script>
	
	
</body>
</html>
