--REALIZAR TRUNCATE EM TODAS AS TABELAS DE UMA DATABSE COM EXCE��O

USE ADM
GO

Declare @Tabelas Table (Idx Int Identity(1,1), TblName Varchar(100))             

Insert into @Tabelas (TblName)    

-- Clausula da Exce��o na tabela que n�o deseja fazer truncate --> TABLE_NAME
Select 
	Table_Name 
From 
	Information_Schema.Tables  
Where 
	Table_Type = 'Base Table' 
	and Table_NAME <> 'TB_REGISTRO'  --INCLUIR TABELAS QUE N�O DESEJA REALIZAR TRUNCATE
	--AND   Table_NAME <>'Tabela2'         
     
Declare @Start Int             
Declare @End Int             
Declare @Command Varchar(1000)             
             
Select @Start = 1, @end = Max(Idx) From @Tabelas             

While @Start <= @End             
Begin             
  Select @Command = 'Truncate Table ' + TblName + '' From @Tabelas Where Idx = @Start              
  Exec(@Command)             
 

 Set @Start = @Start + 1             
End
