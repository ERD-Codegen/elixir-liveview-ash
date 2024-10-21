@echo off
SETLOCAL

REM Migration to create the api_errors table
echo Creating api_errors table...

sqlcmd -S . -d YourDatabase -Q "CREATE TABLE api_errors (
  id INT PRIMARY KEY IDENTITY,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  error_code NVARCHAR(255) NOT NULL,
  error_message NVARCHAR(255) NOT NULL,
  timestamp DATETIME NOT NULL
)"

echo api_errors table created successfully.

REM Add down migration if necessary
REM sqlcmd -S . -d YourDatabase -Q "DROP TABLE api_errors"

ENDLOCAL