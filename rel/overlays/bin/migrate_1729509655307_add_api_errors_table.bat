@echo off
SETLOCAL

REM Migration for creating the api_errors table
echo Running migration 1729509655307_add_api_errors_table

:up
echo Creating api_errors table...
sqlcmd -Q "CREATE TABLE api_errors (
  id INT PRIMARY KEY IDENTITY,
  created_at DATETIME,
  updated_at DATETIME,
  error_code INT NOT NULL,
  error_message NVARCHAR(255) NOT NULL,
  timestamp DATETIME NOT NULL
)"
IF %ERRORLEVEL% NEQ 0 GOTO error
echo Migration up completed successfully.
GOTO end

:down
echo Dropping api_errors table...
sqlcmd -Q "DROP TABLE api_errors"
IF %ERRORLEVEL% NEQ 0 GOTO error
echo Migration down completed successfully.
GOTO end

:error
echo Migration failed with error %ERRORLEVEL%.
:end
ENDLOCAL