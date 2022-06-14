-- BDD : bibliotheque 
-- table : abonne (id_abonne, prenom) 
-- table : livre (id_livre, auteur, titre) 
-- table : emprunt (id_emprunt, id_livre, id_abonne, date_sortie, date_rendu) 

-- créer une base de données "bibliotheque" 
CREATE DATABASE bibliotheque;

-- j'utilise cette base 
USE bibliotheque;

-- je crée la table abonne 
CREATE TABLE abonne(
    id_abonne INT NOT NULL AUTO_INCREMENT,
    prenom VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_abonne)
)ENGINE=InnoDB;

-- je crée la table livre 
CREATE TABLE livre(
    id_livre INT NOT NULL AUTO_INCREMENT,
    auteur VARCHAR(50) NOT NULL,
    titre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_livre)
)ENGINE=InnoDB;

-- je cree la table emprunt 
CREATE TABLE emprunt (
    id_emprunt INT NOT NULL AUTO_INCREMENT,
    id_livre INT DEFAULT NULL,
    id_abonne INT DEFAULT NULL,
    date_sortie DATE NOT NULL,
    date_rendu DATE DEFAULT NULL,
    PRIMARY KEY (id_emprunt),
    -- je définis les clefs étrangère (id_livre fera référence a l'id_livre de la table livre); 
    FOREIGN KEY (id_livre) REFERENCES livre(id_livre),
    FOREIGN KEY (id_abonne) REFERENCES abonne(id_abonne)
)ENGINE=InnoDB;

-- J'insere des abonnés : 
INSERT INTO abonne (prenom) VALUES 
('Guillaume'),
('Benoit'),
('Chloe'),
('Laura');

-- J'insere des livres : 
INSERT INTO livre(id_livre, auteur, titre) VALUES 
(100, 'GUY DE MAUPASSANT', 'Une vie'),
(101, 'GUY DE MAUPASSANT', 'Bel-Ami'),
(102, 'HONORE DE BALZAC', 'Le père Goriot'),
(103, 'ALPHONSE DAUDET', 'Le petit chose'),
(104, 'ALEXANDRE DUMAS', 'La Reine Margot'),
(105, 'ALEXANDRE DUMAS', 'Les Trois Mousquetaires');

-- J'insere des emprunt : 
INSERT INTO emprunt (id_emprunt, id_livre, id_abonne, date_sortie, date_rendu) VALUES 
(1, 100, 1, '2014-12-17', '2014-12-18'),
(2, 101, 2, '2014-12-18', '2014-12-20'),
(3, 100, 3, '2014-12-19', '2014-12-22'),
(4, 103, 4, '2014-12-19', '2014-12-22'),
(5, 104, 1, '2014-12-19', '2014-12-28'),
(6, 105, 2, '2015-03-20', '2015-03-26'),
(7, 105, 3, '2015-06-13', NULL),
(8, 100, 2, '2015-06-15', NULL);


