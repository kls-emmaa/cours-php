--Je supprime l'employe 699
DELETE FROM employes WHERE id_employes = 699;

--Je supprime plusieurs employes en meme temps 
DELETE FROM employes WHERE id_employes IN(854, 992);

--Je supprime tout les employes du service informatique saud damien 
DELETE FROM employes WHERE service = 'informatique' AND id_employes != 802;