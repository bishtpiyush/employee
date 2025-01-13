Employee Management System

This README file provides instructions on how to set up and run the Employee Management System project.

Prerequisites

Spring Tool Suite (STS): Ensure that you have Spring Tool Suite (STS) installed on your system. You can download it from Spring.io.

Java Development Kit (JDK): Install JDK (version 8 or later).

Maven: Ensure Maven is installed and properly configured.

Steps to Set Up and Run the Project

Download the ZIP File:

Download the ZIP file containing the project.

Extract the ZIP File:

Locate the downloaded ZIP file.

Extract its contents to a preferred directory on your system.

Use the EmployeeManagementSystem Folder:

Navigate to the extracted directory and locate the folder named EmployeeManagementSystem.

Update the Application Properties:

Open the EmployeeManagementSystem folder.

Navigate to the src/main/resources directory.

Open the application.properties file.

Configure the database settings as follows:

spring.datasource.url=jdbc:mysql://localhost:3306/database_name
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.username=username
spring.datasource.password=userpass

Replace database_name, username, and userpass with your actual MySQL database name, username, and password.

Import the Project into STS:

Launch STS.

Click on File > open project from file system.

Browse to the EmployeeManagementSystem folder.

Click Finish to import the project.

Run the Project:

After importing, wait for STS to resolve dependencies (this might take a few moments).

Locate the main application file (usually named EmployeeManagementSystemApplication.java or similar) inside the src/main/java directory.

Right-click on the file and select Run As > Spring Boot App.

The application will start, and you can access it via the provided URL (usually http://localhost:8080).

Enjoy using the Employee Management System!