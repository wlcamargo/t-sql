--Criar Login
USE [master]
CREATE LOGIN [python]
	WITH PASSWORD=N'mudar@123', 
	DEFAULT_DATABASE=[ADM], 
	CHECK_EXPIRATION=OFF, 
	CHECK_POLICY=OFF
GO
USE [ADM]
GO
CREATE USER [python] FOR LOGIN [python]
GO

--=========================================================================
--Verificar Login Criado
select 
	name,
	modify_date,
	LOGINPROPERTY(name, 'DaysUntilExpiration') as DaysUntilExpiration, 
	LOGINPROPERTY(name, 'PasswordLastSetTime') as PasswordLastSetTime,
	LOGINPROPERTY(name, 'IsExpired') as IsExpired,
	LOGINPROPERTY(name, 'IsMustChange') as IsMustChange,
	*
from
	sys.sql_logins

--==========================================================================


--==========================================================================
--COMANDOS DE SEGURANCA
--==========================================================================
                                                                                           
--Permitir acesso a nivel de objeto
USE ADM
GO
GRANT SELECT ON TB_REGISTRO TO python

--Nega permanentemente uma permissão, e essa negação tem precedência sobre outras permissões.
use [ADM]
GO
DENY SELECT ON [dbo].[TB_REGISTRO] TO python
GO

--Remove uma permissão previamente concedida, sendo reversível
use [ADM]
GO
REVOKE SELECT ON [dbo].[TB_REGISTRO] TO python

--Concede acesso 
use [ADM]
GO
GRANT SELECT ON [dbo].[TB_REGISTRO] TO python


--Verificar Privilégios
EXEC [ADM].dbo.sp_helprotect 
    @username = 'python'    




