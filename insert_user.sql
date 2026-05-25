select * from users;

INSERT INTO dbo.CompanyUsers (
	EmployeeCode,
	FirstName,
	LastName,
	Email,
	PhoneNumber,
	Department,
	JobTitle,
	PasswordHash,
	RoleName,
	IsActive
)
VALUES
('EMP003', 'Nisha', 'Verma', 'nisha.verma@company.com', '+1-555-0103', 'Finance', 'Finance Analyst', 'hash_value_3', 'Employee', 1),
('EMP004', 'Rahul', 'Sharma', 'rahul.sharma@company.com', '+1-555-0104', 'Engineering', 'Senior Developer', 'hash_value_4', 'Manager', 1),
('EMP005', 'Priya', 'Iyer', 'priya.iyer@company.com', '+1-555-0105', 'HR', 'HR Manager', 'hash_value_5', 'HR', 1),
('EMP006', 'Karan', 'Mehta', 'karan.mehta@company.com', '+1-555-0106', 'IT', 'System Admin', 'hash_value_6', 'Admin', 1);