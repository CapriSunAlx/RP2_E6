
CREATE DATABASE IF NOT EXISTS gsb_ba;
USE gsb_ba;

-- Table utilisateur
CREATE TABLE utilisateur (
  id VARCHAR(4) NOT NULL,
  nom VARCHAR(30) DEFAULT NULL,
  prenom VARCHAR(30) DEFAULT NULL,
  login VARCHAR(20) DEFAULT NULL,
  mdp VARCHAR(256) DEFAULT NULL,
  adresse VARCHAR(40) DEFAULT NULL,
  cp VARCHAR(5) DEFAULT NULL,
  ville VARCHAR(30) DEFAULT NULL,
  dateEmbauche DATE DEFAULT NULL,
  PRIMARY KEY (id)
);

-- Table visiteur
CREATE TABLE visiteur (
  id VARCHAR(4) PRIMARY KEY,
  FOREIGN KEY (id) REFERENCES utilisateur(id) ON DELETE CASCADE
);

-- Table comptable
CREATE TABLE comptable (
  id VARCHAR(4) PRIMARY KEY,
  nbFicheRefusee INT DEFAULT 0,
  FOREIGN KEY (id) REFERENCES utilisateur(id) ON DELETE CASCADE
);

-- Table etat
CREATE TABLE etat (
  id VARCHAR(2) NOT NULL,
  libelle VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (id)
);

-- Table fraisforfait
CREATE TABLE fraisforfait (
  id VARCHAR(3) NOT NULL,
  libelle VARCHAR(20) DEFAULT NULL,
  montant DECIMAL(5,2) DEFAULT NULL,
  PRIMARY KEY (id)
);

-- Table fichefrais
CREATE TABLE fichefrais (
  idVisiteur VARCHAR(4) NOT NULL,
  mois VARCHAR(6) NOT NULL,
  nbJustificatifs INT DEFAULT NULL,
  montantValide DECIMAL(10,2) DEFAULT NULL,
  dateModif DATE DEFAULT NULL,
  idEtat VARCHAR(2) DEFAULT 'CR',
  PRIMARY KEY (idVisiteur, mois),
  FOREIGN KEY (idEtat) REFERENCES etat(id),
  FOREIGN KEY (idVisiteur) REFERENCES visiteur(id)
);

-- Table lignefraisforfait
CREATE TABLE lignefraisforfait (
  idVisiteur VARCHAR(4) NOT NULL,
  mois VARCHAR(6) NOT NULL,
  idFraisForfait VARCHAR(3) NOT NULL,
  quantite INT DEFAULT NULL,
  PRIMARY KEY (idVisiteur, mois, idFraisForfait),
  FOREIGN KEY (idVisiteur, mois) REFERENCES fichefrais(idVisiteur, mois),
  FOREIGN KEY (idFraisForfait) REFERENCES fraisforfait(id)
);

-- Table lignefraishorsforfait
CREATE TABLE lignefraishorsforfait (
  id INT NOT NULL AUTO_INCREMENT,
  idVisiteur VARCHAR(4) NOT NULL,
  mois VARCHAR(6) NOT NULL,
  libelle VARCHAR(100) DEFAULT NULL,
  date DATE DEFAULT NULL,
  montant DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idVisiteur, mois) REFERENCES fichefrais(idVisiteur, mois)
);

INSERT INTO `utilisateur` VALUES ('a131','Villechalane','Louis','lvillachane','6f7446a958caba12f52d','8 rue des Charmes','46000','Cahors','2005-12-21'),('a17','Andre','David','dandre','oppg5','1 rue Petit','46200','Lalbenque','1998-11-23'),('a55','Bedos','Christian','cbedos','gmhxd','1 rue Peranud','46250','Montcuq','1995-01-12'),('a93','Tusseau','Louis','ltusseau','ktp3s','22 rue des Ternes','46123','Gramat','2000-05-01'),('b13','Bentot','Pascal','pbentot','doyw1','11 allée des Cerises','46512','Bessines','1992-07-09'),('b16','Bioret','Luc','lbioret','hrjfs','1 Avenue gambetta','46000','Cahors','1998-05-11'),('b19','Bunisset','Francis','fbunisset','4vbnd','10 rue des Perles','93100','Montreuil','1987-10-21'),('b25','Bunisset','Denise','dbunisset','s1y1r','23 rue Manin','75019','paris','2010-12-05'),('b28','Cacheux','Bernard','bcacheux','uf7r3','114 rue Blanche','75017','Paris','2009-11-12'),('b34','Cadic','Eric','ecadic','6u8dc','123 avenue de la République','75011','Paris','2008-09-23'),('b4','Charoze','Catherine','ccharoze','u817o','100 rue Petit','75019','Paris','2005-11-12'),('b50','Clepkens','Christophe','cclepkens','bw1us','12 allée des Anges','93230','Romainville','2003-08-11'),('b59','Cottin','Vincenne','vcottin','2hoh9','36 rue Des Roches','93100','Monteuil','2001-11-18'),('c14','Daburon','François','fdaburon','7oqpv','13 rue de Chanzy','94000','Créteil','2002-02-11'),('c3','De','Philippe','pde','gk9kx','13 rue Barthes','94000','Créteil','2010-12-14'),('c54','Debelle','Michel','mdebelle','od5rt','181 avenue Barbusse','93210','Rosny','2006-11-23'),('d13','Debelle','Jeanne','jdebelle','nvwqq','134 allée des Joncs','44000','Nantes','2000-05-11'),('d23','Kosmalski','Sylvie','skosmalski','0329cc7a8f0c75d02243','51 Boulevard Gaston Monnerville','97440','51 Boulevard Gaston Monnervill','2025-04-03'),('d24','Matthieu','Christelle','cmatthieu','0329cc7a8f0c75d02243','51 Boulevard Gaston Monnerville','97440','51 Boulevard Gaston Monnervill','2025-04-03'),('d25','test','hachage','htest','0329cc7a8f0c75d02243','2 Rue des Bucherons','97400','Saint Denis','2025-04-03'),('d51','Debroise','Michel','mdebroise','sghkb','','44000','Nantes','2001-04-17'),('e22','Desmarquest','Nathalie','ndesmarquest','6f7446a958caba12f52d','14 Place d Arc','45000','Orléans','2005-11-12'),('e24','Desnost','Pierre','pdesnost','4k2o5','16 avenue des Cèdres','23200','Guéret','2001-02-05'),('e39','Dudouit','Frédéric','fdudouit','44im8','18 rue de l église','23120','GrandBourg','2000-08-01'),('e49','Duncombe','Claude','cduncombe','qf77j','19 rue de la tour','23100','La souteraine','1987-10-10'),('e5','Enault-Pascreau','Céline','cenault','y2qdu','25 place de la gare','23200','Gueret','1995-09-01'),('e52','Eynde','Valérie','veynde','i7sn3','3 Grand Place','13015','Marseille','1999-11-01'),('f21','Finck','Jacques','jfinck','mpb3t','10 avenue du Prado','13002','Marseille','2001-11-10'),('f39','Frémont','Fernande','ffremont','xs5tq','4 route de la mer','13012','Allauh','1998-10-01'),('f4','Gest','Alain','agest','dywvt','30 avenue de la mer','13025','Berre','1985-11-01');

INSERT INTO visiteur (id) VALUES
('a131'), ('a17'), ('a55'), ('a93'), ('b13'), ('b16'), ('b19'), ('b25'),
('b28'), ('b34'), ('b4'), ('b50'), ('b59'), ('c14'), ('c3'), ('c54'),
('d13'), ('d25'), ('d51'), ('e22'), ('e24'), ('e39'), ('e49'),
('e5'), ('e52'), ('f21'), ('f39'), ('f4');

INSERT INTO comptable (id, nbFicheRefusee) VALUES
('d23', 0),
('d24', 0);

INSERT INTO `etat` VALUES ('CL','Saisie clôturée'),('CR','Fiche créée, saisie en cours'),('RB','Remboursée'),('VA','Validée et mise en paiement');

INSERT INTO `fichefrais` VALUES ('a131','202408',0,0.00,'2024-09-05','CL'),('a131','202409',0,0.00,'2024-09-05','CR'),('a17','202408',0,0.00,'2024-08-22','CR'),('e5','202408',0,0.00,'2024-08-22','CR');

INSERT INTO `fraisforfait` VALUES ('ETP','Forfait Etape',110.00),('KM','Frais Kilométrique',0.62),('NUI','Nuitée Hôtel',80.00),('REP','Repas Restaurant',25.00);

INSERT INTO `lignefraisforfait` VALUES ('a131','202409','ETP',10),('a131','202409','KM',5),('a131','202409','NUI',5),('a131','202409','REP',9),('e5','202408','ETP',0),('e5','202408','KM',0),('e5','202408','NUI',0),('e5','202408','REP',0);

INSERT INTO `lignefraishorsforfait` VALUES (6,'a131','202409','hors frais','2024-09-12',50.00);
