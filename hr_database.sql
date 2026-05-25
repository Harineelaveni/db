

-- Company user table script (SQL Server)
-- Date: 2026-05-24

IF OBJECT_ID('dbo.CompanyUsers', 'U') IS NOT NULL
	DROP TABLE dbo.CompanyUsers;
GO

CREATE TABLE dbo.CompanyUsers (
	UserId INT IDENTITY(1,1) NOT NULL,
	EmployeeCode VARCHAR(20) NOT NULL,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(20) NULL,
	Department VARCHAR(100) NULL,
	JobTitle VARCHAR(100) NULL,
	PasswordHash VARCHAR(255) NOT NULL,
	RoleName VARCHAR(50) NOT NULL DEFAULT 'Employee',
	IsActive BIT NOT NULL DEFAULT 1,
	LastLoginAt DATETIME2 NULL,
	CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
	UpdatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

	CONSTRAINT PK_CompanyUsers PRIMARY KEY (UserId),
	CONSTRAINT UQ_CompanyUsers_EmployeeCode UNIQUE (EmployeeCode),
	CONSTRAINT UQ_CompanyUsers_Email UNIQUE (Email),
	CONSTRAINT CK_CompanyUsers_RoleName CHECK (RoleName IN ('Admin', 'HR', 'Manager', 'Employee')),
	CONSTRAINT CK_CompanyUsers_EmailFormat CHECK (Email LIKE '%_@_%._%')
);
GO

CREATE INDEX IX_CompanyUsers_LastName ON dbo.CompanyUsers (LastName);
CREATE INDEX IX_CompanyUsers_Department ON dbo.CompanyUsers (Department);
CREATE INDEX IX_CompanyUsers_IsActive ON dbo.CompanyUsers (IsActive);
GO

-- Optional sample inserts
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
('EMP001', 'Harini', 'Rao', 'harini.rao@company.com', '+1-555-0101', 'HR', 'HR Executive', 'hash_value_1', 'HR', 1),
('EMP002', 'Arun', 'Kumar', 'arun.kumar@company.com', '+1-555-0102', 'Engineering', 'Software Engineer', 'hash_value_2', 'Employee', 1);
GO