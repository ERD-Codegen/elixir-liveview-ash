@echo off
SETLOCAL

REM Migration script to create the "books" table
echo Creating books table...

sqlcmd -Q "CREATE TABLE books (
  id INT PRIMARY KEY IDENTITY,
  created_at DATETIME NOT NULL DEFAULT GETDATE(),
  updated_at DATETIME NOT NULL DEFAULT GETDATE(),
  title NVARCHAR(255) NOT NULL,
  author NVARCHAR(255) NOT NULL,
  publisher NVARCHAR(255) NOT NULL,
  year_of_publication INT NOT NULL,
  number_of_pages INT NOT NULL
)"

echo Books table created successfully.

REM Migration script to drop the "books" table
echo Dropping books table...

sqlcmd -Q "DROP TABLE IF EXISTS books"

echo Books table dropped successfully.

ENDLOCAL