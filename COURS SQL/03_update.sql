--Modifier le salaire de julien
UPDATE employes SET salaire = 1391 WHERE id_employes = 699;

--Modifier deux colonne en meme temps 
UPDATE employes SET salaire = 1400, service = 'informatique' WHERE prenom = 'julien';

-- j'augmente de 100 le salaire des employes du service commercial
UPDATE employes SET salaire = (salaire + 100) WHERE service = 'commercial';