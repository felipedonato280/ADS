--CONSULTAS AULA 2

--1) Selecione todos os engenheiros.

select * from ENGENHEIRO;

--2) Retorne os nomes dos engenheiros que participam do projeto de código 1.

select nome_eng 
from engenheiro, participacao
where engenheiro.cod_eng = participacao.cod_eng and cod_proj = 1;

select nome_eng
from engenheiro inner join participacao using (cod_eng)
where cod_proj = 1;

--3) Retorne os nomes dos engenheiros que participam no projeto denominado "Projeto 1".

select nome_eng
from engenheiro, projeto, participacao
where engenheiro.cod_eng = participacao.cod_eng and 
projeto.cod_proj = participacao.cod_proj and nome_proj = 'Projeto 1';

--4) Retorne os nomes dos projetos que o engenheiro de código 3 participa.

select nome_proj
from projeto, participacao
where projeto.cod_proj = participacao.cod_proj and cod_eng = 3;


--5) Retorne os nomes dos projetos que o engenheiro Lucas participa.

select nome_proj
from projeto, engenheiro, participacao
where engenheiro.cod_eng = participacao.cod_eng and
projeto.cod_proj = participacao.cod_proj and nome_eng = 'Lucas';

--6) Retorne à quantidade de projetos que o engenheiro de código 1 participa.

select count(*)
from participacao
where cod_eng = 1;

--7) Retorne à quantidade de projetos que a engenheira Ana Paula participa.

select count (*)
from engenheiro, participacao
where engenheiro.cod_eng = participacao.cod_eng and nome_eng = 'Ana Paula';

--8) Retorne o nome do engenheiro e a quantidade de projetos que cada engenheiro participa, ordenando
--em ordem decrescente pela quantidade de projetos.

SELECT nome_eng, COUNT(*)
FROM engenheiro, participacao
WHERE engenheiro.cod_eng = participacao.cod_eng
GROUP BY nome_eng
ORDER BY COUNT(*) DESC, nome_eng ASC;

--9) Retorne o código do engenheiro e a quantidade de projetos que cada engenheiro participa, 
--ordenando em ordem crescente pelo código do engenheiro e em ordem decrescente pela quantidade 
--de projetos que cada engenheiro participa.

SELECT cod_eng, COUNT(*)
FROM participacao
GROUP BY cod_eng
ORDER BY COUNT(*) asc;

--10) Retorne o código e os nomes dos engenheiros que não participam de nenhum projeto.

SELECT cod_eng, nome_eng
FROM engenheiro
WHERE NOT EXISTS (
    SELECT cod_eng
    FROM participacao
    WHERE participacao.cod_eng = engenheiro.cod_eng
);

select cod_eng, nome_eng
from engenheiro
where cod_eng not in (select cod_eng from participacao);

--11) Retorne à quantidade de engenheiros que não participam de nenhum projeto.

SELECT COUNT(*)
FROM engenheiro
WHERE cod_eng NOT IN (SELECT cod_eng FROM participacao)


--12) Retorne o código e os nomes dos projetos que não tem a participação de nenhum engenheiro.

SELECT cod_proj, nome_proj
FROM projeto
WHERE NOT EXISTS(
	SELECT cod_proj
	FROM participacao
	WHERE participacao.cod_proj = projeto.cod_proj
);

SELECT cod_proj, nome_proj
FROM projeto
WHERE cod_proj NOT IN (SELECT cod_proj FROM participacao)