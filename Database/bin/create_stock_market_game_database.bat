@ECHO off

:: batch file for
:: Stock Market Game
:: Galway-Mayo Institute of Technology
:: 
:: Uses SQLCMD utility to run a SQL script that creates
:: the StockMarketGame database.

ECHO Attempting to create the StockMarketGame database . . . 
sqlcmd -S localhost\SQLExpress -E /i create_database.sql
ECHO.
ECHO If no error message is shown, then the database was created successfully.
ECHO.
PAUSE