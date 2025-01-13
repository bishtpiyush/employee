<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Employee</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<button onclick="allEmployee()">Back</button>
    <h1>Edit Employee</h1>
    <form id="employeeForm">
        <input type="hidden" id="id">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

		<label for="departmentFilter">Filter by Department: </label>
					    <select id="department">
					        <option value="">Departments</option>
					        <!-- Add departments dynamically or manually -->
					        <option value="IT" required>IT</option>
					        <option value="HR">HR</option>
					        <option value="Finance">Finance</option>
					        <option value="Marketing">Marketing</option>
					    </select><br><br>

        <label for="designation">Designation:</label>
        <input type="text" id="designation" name="designation" required><br><br>

        <label for="joiningDate">Joining Date:</label>
        <input type="date" id="joiningDate" name="joiningDate" required><br><br>

        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="salary" required><br><br>

        <button type="button" onclick="updateEmployee()">Update</button>
		
    </form>

    <script>
        $(document).ready(function () {
            // Get employee ID from URL
            const urlParams = new URLSearchParams(window.location.search);
            const employeeId = urlParams.get("id");
		
			console.log(employeeId);
            // Fetch employee details
            $.ajax({
                url: "http://localhost:8080/api/employees/user/"+1,
                method: "GET",
                success: function (employee) {
                    $("#id").val(employee.employeeId);
                    $("#name").val(employee.name);
                    $("#email").val(employee.email);
                    $("#department").val(employee.department);
                    $("#designation").val(employee.designation);
                    $("#joiningDate").val(employee.joiningDate);
                    $("#salary").val(employee.salary);
                },
                error: function (err) {
                    alert("Error fetching employee details: " + err.responseText);
                }
            });
        });

        // Update employee details
        function updateEmployee() {
            const employeeData = {
                id: $("#id").val(),
                name: $("#name").val(),
                email: $("#email").val(),
                department: $("#department").val(),
                designation: $("#designation").val(),
                joiningDate: $("#joiningDate").val(),
                salary: $("#salary").val()
            };
            $.ajax({
                url: "http://localhost:8080/api/employees/user/"+employeeData.id,
                method: "PUT",
                contentType: "application/json",
                data: JSON.stringify(employeeData),
                success: function () {
                    alert("Employee updated successfully.");
                    window.location.href = "/employee-list";
                },
                error: function (err) {
                    alert("Error updating employee: " + err.responseText);
                }
            });
        }
		
		function allEmployee() {
				       window.location.href = "/employee-list";
		}

    </script>
</body>
</html>
