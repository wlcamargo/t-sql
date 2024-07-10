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

--Nega permanentemente uma permiss�o, e essa nega��o tem preced�ncia sobre outras permiss�es.
use [ADM]
GO
DENY SELECT ON [dbo].[TB_REGISTRO] TO python
GO

--Remove uma permiss�o previamente concedida, sendo revers�vel
use [ADM]
GO
REVOKE SELECT ON [dbo].[TB_REGISTRO] TO python

--Concede acesso 
use [ADM]
GO
GRANT SELECT ON [dbo].[TB_REGISTRO] TO python


--Verificar Privil�gios
EXEC [ADM].dbo.sp_helprotect 
    @username = 'python'    




