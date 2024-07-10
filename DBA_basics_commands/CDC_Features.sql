/* CDC Features */

-- SQL Server precisa estar com o SQL Server Agent ligado
-- Não será possível realizar truncate na tabela com CDC

select name, is_cdc_enabled from sys.databases

select name, is_tracked_by_cdc from sys.tables

use RH_ESCOLA
go

create table tb_paises (id smallint identity(1,1) primary key,
pais varchar(30),
regiao varchar(30))
go

EXEC sys.sp_cdc_enable_db

EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name = N'dcliente',
@role_name = NULL
GO

select * from [dbo].[tb_paises]

select * from [cdc].[dbo_TB_PAISES_CT]

INSERT INTO tb_paises VALUES ('PORTUGAL', 'SUL')

'''
operations code
1 - delete
2 - insert
3 - valor antes do update
4 - valor após update
'''


-- desabilitar o cdc do banco
EXEC sys.sp_cdc_disable_db
go