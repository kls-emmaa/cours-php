--ca permet d'afficher des résultats qui proviennent de differentes tables 

-- Quand Guillaume a-t-il emprunté ou rendu un livre 
-- prenom date_sortie date_rendu

SELECT a.prenom, e.date_sortie, e.date_rendu
FROM  abonne a, emprunt e 
WHERE a.id_abonne = e.id_abonne
AND a.prenom = 'Guillaume';

--prenom date_sortie date_rendu titre du livre 
SELECT a.prenom, e.date_sortie, e.date_rendu, l.titre
FROM abonne a, emprunt e, livre l
WHERE a.id_abonne = e.id_abonne
AND e.id_livre = l.id_livre
AND a.prenom = 'Guillaume';

--tout le monde sauf Guillaume
SELECT a.prenom, e.date_sortie, e.date_rendu, l.titre
FROM abonne a, emprunt e, livre l
WHERE e.id_livre = l.id_livre 
AND a.id_abonne = e.id_abonne
AND a.prenom != 'Guillaume'; 

--sauf guillaume et chloe
SELECT a.prenom, e.date_sortie, e.date_rendu, l.titre
FROM abonne a, emprunt e, livre l
WHERE e.id_livre = l.id_livre 
AND a.id_abonne = e.id_abonne
AND a.prenom NOT IN('Guillaume', 'Chloe') ;

--Qui a emprunté le livre des trois Mousquetaires
-- prenom titre 
SELECT a.prenom, l.titre
FROM abonne a, livre l, emprunt e
WHERE e.id_livre = l.id_livre
AND a.id_abonne = e.id_abonne
AND l.titre = 'Les trois mousquetaires';

--Quand ont été emprunté et rendu les livres d'alphonse daudet ?
--date_sortie date_rendu
SELECT e.date_sortie, e.date_rendu, l.auteur
FROM emprunt e, livre l
WHERE e.id_livre = l.id_livre
AND l.auteur = 'Alphonse Daudet';