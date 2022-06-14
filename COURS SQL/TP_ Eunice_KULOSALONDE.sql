1. Quels sont les services de l’hôpital ?

Colonnes à afficher :
+------------+-------------------------+
| id_service | nom | 
+------------+-------------------------+ 


Requête :
SELECT id_service, nom FROM service;

2. Affichez le prénom des patients.

Colonnes à afficher :
+------------+
| prenom |
+------------+

Requête : SELECT prenom FROM patient;


3. Affichez le numéro de téléphone du patient ayant le prénom « antoine ».

Colonnes à afficher :
+------------+
| telephone |
+------------+ 

Requête : SELECT telephone FROM patient WHERE prenom = 'antoine';


4. Affichez le premier enregistrement de la table « personnel ».

Colonnes à afficher :
+--------------+--------+---------+------+------------+----------+----------------+---------+------------+
| id_personnel | prenom | nom | sexe | profession | qualite | date_naissance | salaire | id_service |
+--------------+--------+---------+------+------------+----------+----------------+---------+------------+ 

Requête : SELECT * FROM personnel WHERE id_personnel = 1;

5. Affichez le nombre de patients (Alias : Nombre_de_patients).

Colonnes à afficher :
+--------------------+
| nombre_de_patients |
+--------------------+ 

Requête : SELECT COUNT(id_patient) AS 'nombre_de_patients' FROM patient;

6. Affichez les membres du personnel ayant un salaire supérieur à « 1600 » €.

Colonnes à afficher :
+--------------+----------+----------+------+-------------+----------+----------------+---------+------------+
| id_personnel | prenom | nom | sexe | profession | qualite | date_naissance | salaire | id_service |
+--------------+----------+----------+------+-------------+----------+----------------+---------+------------+

Requête : SELECT * FROM personnel WHERE salaire > 1600;

7. Combien de chambres peuvent recevoir plusieurs patients simultanément ? (alias : nb) : 

Colonnes à afficher : 
+----+
| nb |
+----+  

Requête : SELECT COUNT(id_chambre) AS 'nb' FROM chambre WHERE capacite > 1;

8. Affichez les prénoms des patients de sexe « féminin ».

Colonnes à afficher :
+------------+
| prenom |
+------------+

Requête : SELECT prenom FROM patient WHERE sexe = 'f';

9. Quel est le membre du personnel le plus jeune ?

Colonnes à afficher :
+--------------+--------+--------+------+---------------+----------+----------------+---------+------------+
| id_personnel | prenom | nom | sexe | profession | qualite | date_naissance | salaire | id_service |
+--------------+--------+--------+------+---------------+----------+----------------+---------+------------+ 

Requête : SELECT * FROM personnel WHERE date_naissance = (SELECT MAX(date_naissance) FROM personnel);

10. Quels sont les salaires moyens dans les différentes professions représentées au sein de l’hôpital ? (en limitant à 2 chiffres après la virgule, en donnant l’alias « salaire moyen » et en les classant dans l’ordre croissant).

Colonnes à afficher :
+---------------+---------------+
| profession | salaire moyen |
+---------------+---------------+ 

Requête :  SELECT profession, ROUND(AVG(salaire),2) AS 'salaire moyen' FROM personnel ORDER BY salaire ASC;

11. Quel est le salaire annuel de « Ophelie » ayant l’id « 13 » ? (alias : salaire_annuel)

Colonnes à afficher :
+----------------+
| salaire_annuel |
+----------------+ 

Requête : SELECT (salaire*12) AS 'salaire_annuel' FROM personnel WHERE id_personnel = 13;

12. Quelles étaient les chambres occupées entre le 01 février 2011 et le 15 février 2011 ?

Colonnes à afficher :
+------------+------------+-------------+-------------+
| id_patient | id_chambre | date_entree | date_sortie |
+------------+------------+-------------+-------------+

Requête : SELECT id_patient, id_chambre, date_entree, date_sortie FROM association_patient_chambre WHERE date_entree,date_sortie BETWEEN '2011-02-01' AND '2011-02-15'; 

13. Quel sont les prénoms des membres du personnel travaillant au service « urgence » ? 

Colonnes à afficher :
+--------+------------+
| prenom | id_service |
+--------+------------+ 

Requête : SELECT prenom, id_service FROM personnel WHERE id_service IN(SELECT id_service FROM service WHERE nom = 'urgence');

14. Dans quelle(s) chambre(s) a séjourné la patiente ayant le prénom « elodie» ?

Colonnes à afficher :
+------------+
| id_chambre |
+------------+

Requête : SELECT id_chambre FROM chambre WHERE id_chambre IN(SELECT id_patient FROM patient WHERE prenom = 'elodie');

15. Dans quel(s) service(s) a séjourné la patiente ayant le prénom « elodie » ?

Colonnes à afficher :
+---------+
| nom |
+---------+

Requête : SELECT nom FROM service WHERE id_service IN(SELECT id_chambre FROM association_patient_chambre WHERE id_patient IN(SELECT id_patient FROM patient WHERE prenom = 'elodie'));


16. Affichez les informations sur les chambres du service « neurologie » 

Colonnes à afficher :
+------------+------------+----------+
| nom | id_chambre | capacite |
+------------+------------+----------+ 

Requête : SELECT * FROM chambre WHERE id_service IN(SELECT id_service FROM service WHERE nom ='neurologie');


17. Quels étaient les prénoms des patients se trouvant à l’hôpital entre le 01 février 2011 et le 15 février 2011, et dans quelle(s) chambre(s) se trouvaient-ils ?

Colonnes à afficher :
+------------+------------+------------+-------------+-------------+
| prenom | id_patient | id_chambre | date_entree | date_sortie |
+------------+------------+------------+-------------+-------------+

Requête : SELECT id_patient, id_chambre, date_entree, date_sortie FROM association_patient_chambre WHERE date_entree BETWEEN '2011-02-01' AND '2011-02-15' AND date_sortie BETWEEN '2011-02-01' AND '2011-02-15';


18. Un lit a été ajouté dans toutes les chambres du service « neurologie ». Modifiez leur capacité.

Requête : UPDATE chambre SET capacite = capacite+1 WHERE id_service IN(SELECT id_service FROM service WHERE nom = "neurologie");


19. Combien y’a-t-il d’infirmiers par service ?

Colonnes à afficher :
+-------------+-----------------+
| nom | count(p.prenom) |
+-------------+-----------------+

Requête : SELECT s.nom, COUNT(p.prenom) FROM service s, personnel p GROUP BY p.id_service;



20. Quel est le médecin potentiel qui s’est occupé de la patiente ayant le prénom « charlotte » lors de son passage à l’hôpital ?


Colonnes à afficher :
+--------+----------+------------+------------+------------+
| prenom | nom | profession | prenom | id_patient | 
+--------+----------+------------+------------+------------+

Requête : SELECT * FROM personnel WHERE profession = 'medecin' AND id_service IN(SELECT id_service FROM association_patient_chambre WHERE id_patient IN(SELECT id_patient FROM patient WHERE prenom = 'Charlotte'));



