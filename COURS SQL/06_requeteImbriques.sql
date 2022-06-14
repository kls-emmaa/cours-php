--Voir les id des livres qui n'ont pas été rendu
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;
--null se verifie dans une condition avec IS 

--voir les titre des livres 105, 100
SELECT titre FROM livre WHERE id_livre IN(105, 100);

--Afficher le titre des livre qui n'ont pas ete rendu
SELECT titre FROM livre WHERE id_livre IN( SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);