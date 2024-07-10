--REMOVER DUPLICADOS

if object_id('tempdb..#tb_full') is not null drop table #tb_full;
if object_id('tempdb..#tb_sem_duplicado') is not null drop table #tb_sem_duplicado;

--Inserir tabela original na tabela tempor�ria
SELECT 
	*
INTO
	#tb_full
FROM
	TABELA_QUE_QUERO_REMOVER_DUPLICADOS;

--Contagem dos dados e ordena��o para manter o �ltimo ou primeiro registro
SELECT
     *,  
	   row_number() over (partition by [Janela] order by [Ordem_Que_Quero] desc) AS RESULT
INTO 
	#tb_sem_duplicado
FROM
	#tb_full;

--Apagar duplicados na tabela tempor�ria
DELETE FROM #tb_sem_duplicado WHERE Janela  IN (SELECT Janela FROM #tb_full WHERE RESULT>1);

--Consulta na tabela
select * from #tb_sem_duplicado