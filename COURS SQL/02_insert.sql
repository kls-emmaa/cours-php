-- J'insere un nouvel employe dans la table de la base de données
INSERT INTO employes VALUES (NULL, 'Alexandre', 'Durant', 'm', 'informatique', '2022-04-14', 2000);

--On peut le faire également en indiquant les colonnes a remplir
INSERT INTO employes (prenom, nom, sexe, service, date_embauche, salaire) VALUES ('Youssouf', 'Bimzgane', 'm', 'commercial', '2022-04-14', 3500 );