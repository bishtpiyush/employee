<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Employee</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<link rel="stylesheet" href="css/style.css" />
</head
<body>
    <h1>Add Employee</h1>
    <form id="employeeForm">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required><br><br>

        <label for="designation">Designation:</label>
        <input type="text" id="designation" name="designation" required><br><br>

        <label for="joiningDate">Joining Date:</label>
        <input type="date" id="joiningDate" name="joiningDate" required><br><br>

        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="salary" required><br><br>

        <button type="button" onclick="submitEmployee()">Submit</button>
		
		<button onclick="allEmployee()">All Employee</button>
    </form>
    <script>
        function submitEmployee() {
            // Get form data
            const employeeData = {
                name: $("#name").val(),
                email: $("#email").val(),
                department: $("#department").val(),
                designation: $("#designation").val(),
                joiningDate: $("#joiningDate").val(),
                salary: $("#salary").val()
            };

            // Send data to Spring Boot API
            $.ajax({
                url: "http://localhost:8080/api/employees/user",
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify(employeeData),
                success: function (response) {
                    alert("Employee added successfully!");
                    // Optionally, redirect or reset the form
                    $("#employeeForm")[0].reset();
                },
                error: function (xhr, status, error) {
                    alert("Error: " + xhr.responseText);
                }
            });
        }
		function allEmployee() {
		           window.location.href = "employee-list";
		}
    </script>
</body>
</html>
