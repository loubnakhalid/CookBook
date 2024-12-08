-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 08 déc. 2024 à 22:18
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionrecettes`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `CATEGORIES` (
  `ID` INT(11) NOT NULL,
  `NOM` VARCHAR(50) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_GENERAL_CI;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `CATEGORIES` (
  `ID`,
  `NOM`
) VALUES (
  3,
  'Dessert'
),
(
  1,
  'Entrée'
),
(
  26,
  'Petit dejeuner'
),
(
  2,
  'Plat principal'
);

-- --------------------------------------------------------

--
-- Structure de la table `etapes`
--

CREATE TABLE `ETAPES` (
  `ID` INT(11) NOT NULL,
  `RECETTE_ID` INT(11) NOT NULL,
  `ETAPE_NUM` INT(11) NOT NULL,
  `DESCRIPTION` TEXT NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_GENERAL_CI;

--
-- Déchargement des données de la table `etapes`
--

INSERT INTO `ETAPES` (
  `ID`,
  `RECETTE_ID`,
  `ETAPE_NUM`,
  `DESCRIPTION`
) VALUES (
  97,
  17,
  1,
  'Émincez les blancs de poulet, placez-les dans un plat et versez le jus du demi-citron dessus. Laissez mariner au minimum 4 heures au frigo.'
),
(
  98,
  17,
  2,
  'Dressez les assiettes individuellement ou mettez tous les ingrédients dans un saladier. Mélangez la salade, les biscottes restantes brisées en morceaux, les croûtons, l\'ÉCHALOTE ÉMINCÉE,
  LES COPEAUX DE PARMESAN ET LES MORCEAUX DE POULET.'),
(102, 19, 1, 'PRÉCHAUFFEZ LE FOUR À 180°C(TH.6). DANS UNE CASSEROLE À FEU DOUX.'),
(103, 19, 2, 'DANS UNE AUTRE CASSEROLE,
  VERTSEZ LE LAIT. AJOUTEZ LA GOUSSE DE VANILLE FENDUE EN 2 DANS LE SENS DE LA LONGUEUR.'),
(104, 19, 3, 'LAISSEZ TIÉDIR LE LAIT À FEU TRÈS DOUX.'),
(105, 20, 1, 'VERSEZ UN PEU D\'huile d\'OLIVE DANS UNE MARMITE ET FAITES REVENIR LES OIGNONS AINSI QUE LA CORIANDRE,
  LE PERSIL ET LE CÉLERI.'),
(106, 20, 2, 'COUPEZ L\'agneau en morceaux et faites-le revenir quelques petites minutes.'
),
(
  107,
  18,
  1,
  'Préchauffez le four a 220°c (thermostat 7). Dans un petit bol, bien mélanger l\'HUILE,
  LE THYM,
  LE ROMARIN ET L\'ail haché. Repliez les ailes sous le poulet et dégagez avec soin la peau des poitrines.'
),
(
  108,
  18,
  2,
  'Frottez la chair en dessous de la peau avec le mélange d\'HUILE.');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `recette_id` int(11) NOT NULL,
  `ingredient` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`id`, `recette_id`, `ingredient`) VALUES
(71, 17, '2 ESCALOPE(S) DE POULET'),
(72, 17, '1 SALADE VERTE'),
(73, 17, 'PARMESAN EN COPEAUX'),
(74, 17, '100g BISCOTTE(S)'),
(75, 17, '7 CROÛTON(S)'),
(80, 19, '6 ŒUF(S)'),
(81, 19, '1L LAIT'),
(82, 19, '250g SUCRE'),
(83, 19, '5cl EAU'),
(84, 20, '600g AGNEAU'),
(85, 20, '200g POIS CHICHES'),
(86, 20, '2L EAU'),
(87, 18, '1 POULET À RÔTIR'),
(88, 18, '2 CITRON'),
(89, 18, 'SEL'),
(90, 18, '25cl HUILE D\'olive'
);

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

CREATE TABLE `RECETTES` (
  `ID` INT(11) NOT NULL,
  `NOM` VARCHAR(255) NOT NULL,
  `CATEGORIE_ID` INT(11) NOT NULL,
  `IMAGE_URL` VARCHAR(255) DEFAULT NULL,
  `DATE_CREATION` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_GENERAL_CI;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `RECETTES` (
  `ID`,
  `NOM`,
  `CATEGORIE_ID`,
  `IMAGE_URL`,
  `DATE_CREATION`
) VALUES (
  17,
  'Salade Cesar',
  1,
  '',
  '2024-12-08 17:49:40'
),
(
  18,
  'Poulet roti',
  2,
  '',
  '2024-12-08 17:58:11'
),
(
  19,
  'Flan caramel',
  3,
  '',
  '2024-12-08 18:08:29'
),
(
  20,
  '7arira Marocainne',
  1,
  '',
  '2024-12-08 18:15:54'
);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `CATEGORIES`
  ADD PRIMARY KEY (
    `ID`
  ), ADD UNIQUE KEY `NOM` (
    `NOM`
  );

--
-- Index pour la table `etapes`
--
ALTER TABLE `ETAPES`
  ADD PRIMARY KEY (
    `ID`
  ), ADD KEY `RECETTE_ID` (
    `RECETTE_ID`
  );

--
-- Index pour la table `ingredients`
--
ALTER TABLE `INGREDIENTS`
  ADD PRIMARY KEY (
    `ID`
  ), ADD KEY `RECETTE_ID` (
    `RECETTE_ID`
  );

--
-- Index pour la table `recettes`
--
ALTER TABLE `RECETTES`
  ADD PRIMARY KEY (
    `ID`
  ), ADD KEY `CATEGORIE_ID` (
    `CATEGORIE_ID`
  );

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `CATEGORIES` MODIFY `ID` INT(
  11
) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `etapes`
--
ALTER TABLE `ETAPES` MODIFY `ID` INT(
  11
) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `ingredients`
--
ALTER TABLE `INGREDIENTS` MODIFY `ID` INT(
  11
) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT pour la table `recettes`
--
ALTER TABLE `RECETTES` MODIFY `ID` INT(
  11
) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etapes`
--
ALTER TABLE `ETAPES`
  ADD CONSTRAINT `ETAPES_IBFK_1` FOREIGN KEY (
    `RECETTE_ID`
  )
    REFERENCES `RECETTES` (
      `ID`
    ) ON DELETE CASCADE;

--
-- Contraintes pour la table `ingredients`
--
ALTER TABLE `INGREDIENTS`
  ADD CONSTRAINT `INGREDIENTS_IBFK_1` FOREIGN KEY (
    `RECETTE_ID`
  )
    REFERENCES `RECETTES` (
      `ID`
    ) ON DELETE CASCADE;

--
-- Contraintes pour la table `recettes`
--
ALTER TABLE `RECETTES`
  ADD CONSTRAINT `RECETTES_IBFK_1` FOREIGN KEY (
    `CATEGORIE_ID`
  )
    REFERENCES `CATEGORIES` (
      `ID`
    ) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;