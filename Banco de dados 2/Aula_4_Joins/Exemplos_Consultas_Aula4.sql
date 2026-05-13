--INNER JOIN

 SELECT e.id, e.nome, p.id, p.nome
 FROM estudantes AS e
 INNER JOIN professores AS p
 ON e.nome = p.nome; 
 
 --LEFT JOIN 
 
 SELECT e.nome, p.nome
 FROM estudantes AS e
 LEFT JOIN professores AS p
 ON e.nome = p.nome; 
 
 --LEFT EXCLUDING JOIN 
 
 SELECT e.nome, p.nome
 FROM estudantes AS e
 LEFT JOIN professores AS p
 ON e.nome = p.nome
 WHERE p.nome IS NULL; 
 
 --RIGHT JOIN 
 
 SELECT e.nome, p.nome
 FROM estudantes AS e
 RIGHT JOIN professores AS p
 ON e.nome = p.nome; 
 
 --RIGHT EXCLUDING JOIN 
 
 SELECT e.nome, p.nome
 FROM estudantes AS e
 RIGHT JOIN professores AS p
 ON e.nome = p.nome
 WHERE e.nome IS NULL; 
 
 --FULL JOIN OU FULL OUTER JOIN 
 
 SELECT e.nome, p.nome
 FROM estudantes AS e
 FULL OUTER JOIN professores AS p
 ON e.nome = p.nome; 
 
 --FULL EXCLUDING JOIN
 
 SELECT e.nome, p.nome
 FROM estudantes AS e
 FULL OUTER JOIN professores AS p
 ON e.nome = p.nome
 WHERE e.nome IS NULL OR p.nome IS NULL; 
 
 --CROSS JOIN com filtro para consultar apenas os registros com id igual a 1 em ambas as tabelas
 
 SELECT e.idade, e.nome, p.idade, p.nome
 FROM estudantes AS e
 CROSS JOIN professores AS p
 WHERE e.id = 1 OR p.id = 1; 
 
 --CROSS JOIN com cruzamento total 
 
 SELECT e.idade, e.nome, p.idade, p.nome
 FROM estudantes AS e
 CROSS JOIN professores AS p
 