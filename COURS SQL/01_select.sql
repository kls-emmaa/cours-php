--Voir tous les élements de la table
SELECT * FROM employes;

--Afficher les prenoms et noms des employes
SELECT prenom, nom FROM employes;

--Afficher les services
SELECT service FROM employes;

--Eviter les doublons
SELECT DISTINCT(service) FROM employes;

--Faire une selection avec condition
SELECT prenom, nom, service FROM employes WHERE service = 'informatique';

--Qui  a été recruté entre 2008 et aujourd'hui ?? 
SELECT prenom, nom, date_embauche FROM employes WHERE date_embauche BETWEEN '2008-01-01' AND '2022-04-14';

--Affichez la date actuelle
SELECT CURDATE();

--Qui a été recruté entre 2008 et la date courante
SELECT  prenom, nom, date_embauche FROM employes WHERE date_embauche BETWEEN '2008-01-01' AND CURDATE();

--Selectionner les employes dont le prenom commence par S 
SELECT prenom FROM employes WHERE prenom LIKE "s%";

--Afficher les employes dont le prenom contient un S 
SELECT prenom FROM employes WHERE prenom LIKE "%s%";

--Afficher les prénoms qui se terminent par un S 
SELECT prenom FROM employes WHERE prenom LIKE "%s";

--Afficher les prenoms qui contiennet 5 lettres 
SELECT prenom FROM employes WHERE LENGTH(prenom) = 5;

--Afficher tout les employes ne travaillant pas au service informatique
SELECT prenom, nom, service FROM employes WHERE service != 'informatique';

--Afiicher tous les employes qui ont un salaire superieur a 3000€
SELECT prenom, nom FROM employes WHERE salaire > 3000;

--Afficher les employes par ordre de salaire 
SELECT * FROM employes ORDER BY salaire ASC;

--Par ordre décroissant
SELECT * FROM employes ORDER BY salaire DESC;

--Afficher les salaire superieur a 3000 dans un ordre croissant
SELECT * FROM employes WHERE salaire > 3000 ORDER BY salaire ASC;

--Afficher les employes par ordre alphabétique
SELECT prenom FROM employes ORDER BY prenom ASC;

--Les 5 premiers employes par ordre de salaire 
SELECT * FROM employes ORDER BY salaire ASC LIMIT 0,5;

--les 5 suivant 
SELECT * FROM employes ORDER BY salaire ASC LIMIT 5,5;

--Voir le salaire annuel des employes
SELECT prenom, (salaire*12) FROM employes;

--Renommer une colonne
SELECT prenom, (salaire*12) AS 'salaire annuel' FROM employes;

--Afficher la somme de tous les salaires annuels grace a une fonction
SELECT SUM(salaire*12) FROM employes;

--Afficher le salaire moyen
SELECT AVG(salaire) FROM employes;

--En arrondissant
SELECT ROUND(AVG(salaire)) FROM employes;

--ENarrondissant a 2 chiffres apres la virgule
SELECT ROUND(AVG(salaire),2) FROM employes;

--En arrondissant a 2 chiffres avant la virgule
SELECT ROUND(AVG(salaire), -2) FROM employes;

--Combien y a-t-il d'employes?
SELECT  COUNT(prenom) FROM  employes;

--Quel est le plus petit salaire
SELECT MIN(salaire) FROM employes;

--Qel est le plus gros salaire?
SELECT MAX(salaire) FROM employes;

--Qui gagne le salaire de 1390
SELECT prenom FROM employes WHERE salaire = 1390;

--Qui gagne le salaire minimum?
SELECT prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);
--requete imbriquée

--Afficher les employes du service informatique et comptabilité
SELECT prenom, service FROM employes WHERE service IN('informatique', 'comptabilité');

--IN permet d'inclure plusieurs valeurs
--= permet d'inclure une seule valeur

--Afficher les employer qui ne travaille pas en informatique ni en comptabilité
SELECT prenom, service FROM employes WHERE service NOT IN('informatique', 'comptabilité');
--NOT IN permet  d'exclure plusieurs valeurs
--!= permet d'exclure qu'une seule valeur 

--Afficher le nombre d'employes par service
SELECT service, COUNT(prenom) FROM employes GROUP BY service;

--Afficher le nombre d'employes par service ou il y a plus qu'une seule personne
SELECT service, COUNT(prenom) FROM employes GROUP BY service HAVING COUNT(prenom) > 1;
--HAVING  permet d'appliquer une condition dans le cas d'un group by




