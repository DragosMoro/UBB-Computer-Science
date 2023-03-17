/*
3 group by *
5 where *
2 distinct *
2 having *
2 m-n &*
7 cu mai mult de 3 tabele
*/
/* afiseaza toti jucatorii de pe pozitia SG*/
USE Basketball;
SELECT DISTINCT player_first_name, player_last_name
FROM Player
Where player_position LIKE 'SG'

/*afiseaza numarul de orase unice din care sunt echipele */
SELECT COUNT(DISTINCT city_id)
From Team;

/*afiseaza numarul de jucatori a fiecarei echipe grupati dupa numele echipei */
SELECT COUNT(player_id), team_name
FROM Player P
INNER JOIN Team T on P.team_id = T.team_id
GROUP BY team_name
;
/* afiseaza jucatorii, echipa si varsta jucatorilor mai batrani de 25 de ani*/
SELECT P.player_first_name, P.player_last_name, T.team_name,P.player_age
FROM Player P, Team T
WHERE P.team_id = T.team_id
GROUP BY  P.player_age,P.player_first_name, P.player_last_name,T.team_name
HAVING player_age>25;

/* Afiseaza jucatorii de pe pozitiile de creatie(PG, SG) */
SELECT  P.player_last_name,P.player_first_name,P.player_position, T.team_name
FROM Player P, Team T
WHERE P.team_id = T.team_id
GROUP BY  P.player_position, P.player_last_name,P.player_first_name,T.team_name
HAVING player_position = 'PG' OR player_position = 'SG';

/*toti jucatorii de la echipe din USA*/
SELECT T.team_name, P.player_first_name, P.player_last_name, country_name
FROM Team T, Player P, Country C
WHERE T.team_id = P.team_id and C.country_id = T.country_id and country_name = 'USA'
;
/*m-n, 3 tabele*/
/* afiseaza echipele din a doua parte a clasamentului*/
SELECT L.league_name, T.team_name, S.ranking
FROM Team T, Standings S, League L
WHERE S.team_id = T.team_id and S.league_id = L.league_id and L.league_name = 'NBA' and S.ranking >10;
;
/*m-n, 3 tabele*/
/*afiseaza echipele din top 3 ul clasamentului */
SELECT L.league_name, T.team_name, S.ranking
FROM Team T, Standings S, League L
WHERE S.team_id = T.team_id and S.league_id = L.league_id and L.league_name = 'NBA' and S.ranking <3;
;
/*Afiseaza arbitrii participanti la meciurile echipelor de acasa */
Select T.team_name, G.game_date, R.referee_firstname, R.referee_lastname
FROM Team T, Game G, Referee R
WHERE G.team_id_home = T.team_id and  R.game_id= G.game_id;

/*afiseaza toate stadioanele */
Select C.country_name, Q.city_name, S.stadium_name
FROM Country C, City Q, Stadium S 
WHERE C.country_id = Q.country_id and S.country_id = C.country_id and Q.city_id = S.city_id;

/* Afiseaza echipele, pozitile si numele antrenorului*/
SELECT T.team_name,T.short_name,S.ranking,C.coach_name
FROM Team T, Standings S, Coach C
WHERE T.team_id = C.coach_id and S.team_id = T.team_id

/* afiseaza jucatorii echipei de pe prima pozitie*/
Select S.ranking, T.team_name, P.player_first_name, P.player_last_name, P.player_position
FROM Team T, Player P, Standings S
Where T.team_id = P.team_id and S.team_id = T.team_id and S.ranking=1;