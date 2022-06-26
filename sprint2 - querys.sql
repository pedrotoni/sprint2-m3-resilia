#QUERY 1 Saber quem são os alunos que entregaram o projeto do módulo 1, e estão com o conceito em "Pronto" ou "Mais que pronto" 

SELECT 
    entregas.id_aluno, entregas.conceito
FROM
    entregas
WHERE
    modulo_projeto = '1'
        AND conceito = 'pronto'
        OR conceito = 'mais que pronto';
        
-- Quantos projetos no total (entre todas as turmas) foram entregues com conceito
-- "Ainda não está pronto" e "Chegando lá".


SELECT
	entregas.id_aluno,
    entregas.conceito,
    count(entregas.conceito) as qtd_conceito
FROM
    entregas
        INNER JOIN
    turma
WHERE
    turma.ID = entregas.id_turma
        AND entregas.conceito = 'ainda não está pronto'
GROUP BY entregas.conceito;

SELECT
	entregas.id_aluno,
    entregas.conceito,
    count(entregas.conceito) as qtd_conceito
FROM
    entregas
        INNER JOIN
    turma
WHERE
    turma.ID = entregas.id_turma
        AND entregas.conceito = 'chegando lá'
GROUP BY entregas.conceito;

-- Consultar quantos alunos temos em cada turma. --
SELECT 
    ID_TURMA, count(ID_TURMA) as qtd_alunos
FROM
    aluno
group by ID_TURMA;

-- Qual a turma com a maior quantidade de projetos no "Mais que pronto"?

SELECT 
    id_turma, COUNT(id_turma) AS quantidade_maisq_pronto
FROM
    entregas
WHERE
    conceito = 'mais que pronto'
GROUP BY id_turma
ORDER BY quantidade_maisq_pronto;