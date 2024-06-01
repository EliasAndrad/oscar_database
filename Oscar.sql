USE OSCAR_DATABASE;
 
select * from indicados_ao_oscar;
-- Quantas vezes Natalie Portman foi indicada ao Oscar?  R= INDICADO 3 VEZES
	SELECT count(*) FROM indicados_ao_oscar where NOME_DO_INDICADO = 'Natalie Portman';
 
-- Quantos Oscars Natalie Portman ganhou? R= 1 VEZES
	SELECT vencedor FROM filmes where nome_do_indicado = 'Natalie Portman';
 
-- Amy Adams já ganhou algum Oscar? R= 0 vezes
	SELECT vencedor FROM indicados_ao_oscar where VENCEDOR = '%Amy Adams%';
 
-- A série de filmes Toy Story ganhou um Oscar em quais anos? R= 2011,2010 e 2020
	select * from indicados_ao_oscar where vencedor = "true" and nome_do_filme like "%Toy Story%";
-- A partir de que ano que a categoria "Actress" deixa de existir? R= 1976
	select * from indicados_ao_oscar where categoria = "actress";
-- O primeiro Oscar para melhor Atriz foi para quem? Em que ano? Janet Gayor em 1928
    select * from indicados_ao_oscar where categoria = "actress" and vencedor = "true" ;
 
 
-- Na coluna/campo "Vencedor", altere todos os valores com "Sim" para 1 e todos os valores "Não" para 0.
SET SQL_SAFE_UPDATES=0;
update indicados_ao_oscar set vencedor = case vencedor when "true" then  "1" else "0" end where vencedor in("true", "false");
select * from indicados_ao_oscar;
 
-- Em qual edição do Oscar "Crash" concorreu ao Oscar? R= 1944, 1956, 2006
 
select * from indicados_ao_oscar where nome_do_filme like "%crash%";
 
-- Bom... dê um Oscar para um filme que merece muito, mas não ganhou.

 
-- O filme Central do Brasil aparece no Oscar? não
 SELECT * FROM indicados_ao_oscar WHERE nome_do_filme LIKE "%Central do Brasil%" ;

-- Inclua no banco 3 filmes que nunca foram nem nomeados ao Oscar, mas que merecem ser
INSERT INTO FILMES (id_registro, ano_filmagem,nome_do_indicado,nome_filme)
VALUES
(10396, 1997,"","A VIDA É BELA"),
(10397, 2002,"", "CIDADE DE DEUS"),
(10398, 2001,"", "O Fabuloso Destino de Amélie Poulain");
 
-- - Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?

SELECT NOME_FILME
FROM FILMES
WHERE categoria = 'OUTSTANDING PICTURE' AND ano_cerimonia = 2002 AND vencedor = "SIM";

SELECT NOME_FILME
FROM FILMES
WHERE categoria = 'ACTRESS' AND ano_cerimonia = 2002 AND vencedor = 'SIM';

SELECT NOME_FILME
FROM FILMES
WHERE categoria = 'DIRECTING' AND ano_cerimonia = 2002 AND vencedor = 'SIM';
