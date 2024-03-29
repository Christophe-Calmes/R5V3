-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 28 mars 2024 à 23:47
-- Version du serveur : 8.0.36-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `xgyd0647_techniquer5`
--

-- --------------------------------------------------------

--
-- Structure de la table `dataSite`
--

CREATE TABLE `dataSite` (
  `idDataSite` int NOT NULL,
  `titre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sousTitre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `titreHTML` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dataSite`
--

INSERT INTO `dataSite` (`idDataSite`, `titre`, `sousTitre`, `description`, `titreHTML`) VALUES
(1, 'R5-V3', 'Le jeu avec des figurines recyclé', 'Warhammer, warhammer 40k, kill team, infinity, recylcage, gratuit, jeu de figurines, jeu français, science fiction, héroïc fantastique', 'R5-V3');

-- --------------------------------------------------------

--
-- Structure de la table `journaux`
--

CREATE TABLE `journaux` (
  `idConnexion` int NOT NULL,
  `ipUser` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idUser` int NOT NULL DEFAULT '0',
  `login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `mdpHacker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `dateHeure` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `okConnexion` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Structure de la table `menuNav`
--

CREATE TABLE `menuNav` (
  `idMenuDeroulant` int NOT NULL,
  `titreMenu` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `menuNav`
--

INSERT INTO `menuNav` (`idMenuDeroulant`, `titreMenu`) VALUES
(1, 'Administration du site'),
(6, 'Administration User');

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

CREATE TABLE `modules` (
  `id` int NOT NULL,
  `module` varchar(30) NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id`, `module`, `valide`) VALUES
(1, 'Graines', 1);

-- --------------------------------------------------------

--
-- Structure de la table `navigation`
--

CREATE TABLE `navigation` (
  `idNav` int NOT NULL,
  `nomNav` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cheminNav` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menuVisible` tinyint(1) NOT NULL,
  `zoneMenu` int NOT NULL,
  `ordre` tinyint NOT NULL,
  `niveau` tinyint(1) NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '1',
  `deroulant` tinyint NOT NULL DEFAULT '0',
  `targetRoute` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `idModule` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `navigation`
--

INSERT INTO `navigation` (`idNav`, `nomNav`, `cheminNav`, `menuVisible`, `zoneMenu`, `ordre`, `niveau`, `valide`, `deroulant`, `targetRoute`, `idModule`) VALUES
(72, 'connexion', 'modules/connexion/connexion.php', 1, 0, 10, 0, 1, 0, '2347346484478', 1),
(73, 'inscription', 'modules/users/inscription.php', 0, 0, 0, 0, 1, 0, '90781485603865', 1),
(74, 'Deco', 'modules/securiter/deconnexion.php', 1, 0, 20, 1, 1, 0, '964997884560417', 1),
(75, 'Deco', 'modules/securiter/deconnexion.php', 1, 0, 20, 2, 1, 0, '700436539587', 1),
(76, 'Administration du site', 'modules/navigation/erreurNav.php', 1, 0, 1, 2, 1, 1, '35416841975244', 1),
(77, 'Ajout lien de nav', 'modules/navigation/menuAdmin/creationNouveuMenu.php', 1, 1, 1, 2, 1, 0, '495749294443569', 1),
(78, 'Titres et SEO', 'modules/dataSite/titreInfo.php', 1, 1, 2, 2, 1, 0, '6734544650', 1),
(81, 'Brassage des liens', 'modules/navigation/menuAdmin/dynamique.php', 1, 1, 2, 2, 1, 0, '051661632455', 1),
(82, 'Ajout menu déroulant TESt', 'modules/navigation/menuAdmin/ajoutMenuDeroulant.php', 1, 1, 2, 2, 1, 1, '62574690360414456277', 1),
(85, 'Administration User', 'modules/navigation/erreurNav.php', 1, 0, 0, 2, 1, 6, '9533178394', 1),
(86, 'Users Actif', 'modules/users/administration/droitUser.php', 1, 6, 1, 2, 1, 6, '808722934236204', 1),
(87, 'Route Form', 'modules/navigation/menuAdmin/ajoutRouteForm.php', 1, 1, 2, 2, 1, 0, '6588611476646', 1),
(88, 'Users Anciens ', 'modules/users/administration/droitUserNonValide.php', 1, 6, 2, 2, 1, 0, '54554668544135', 1),
(89, 'Profil', 'modules/users/administration/profilUser.php', 1, 0, 19, 1, 1, 0, '36481945255', 1),
(90, 'Profil', 'modules/users/administration/profilUser.php', 1, 0, 1, 2, 1, 0, '8284434186843', 1),
(91, 'Journeaux de log', 'modules/journaux/journaux.php', 1, 0, 1, 2, 1, 0, '7690796430596764', 1),
(92, 'Admin nav', 'modules/navigation/menuAdmin/adminMenu.php', 1, 1, 2, 2, 1, 0, '6645916941667443', 1),
(93, 'modification lien nav', 'modules/navigation/menuAdmin/modificationNav.php', 0, 0, 0, 2, 1, 0, '26718324907689', 1),
(95, 'Admin modules', 'modules/navigation/menuAdmin/administrationModules.php', 1, 1, 7, 2, 1, 0, '635739393656732', 1),
(99, 'Add roles', 'modules/users/administration/addRole.php', 1, 6, 3, 2, 1, 0, '5554427991175', 1),
(100, 'Deco', 'modules/securiter/deconnexion.php', 1, 0, 20, 3, 1, 0, '4407275704464', 1),
(101, 'Profil', 'modules/users/administration/profilUser.php', 1, 0, 19, 3, 1, 0, '5152505702494', 1),
(136, 'cgu', 'modules/cgu/cgu.php', 0, 0, 0, 0, 1, 0, '4275455886949448', 1),
(137, 'cguUser', 'modules/cgu/cgu.php', 0, 0, 0, 1, 1, 0, '6400558576302517', 1),
(138, 'cguUser', 'modules/cgu/cgu.php', 0, 0, 0, 3, 1, 0, '6400558576302517', 1),
(140, 'Lost Password', 'modules/users/administration/lostPassword.php', 0, 0, 0, 0, 1, 0, '5851659780936686', 1);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `idRole` int NOT NULL,
  `typeRole` varchar(15) NOT NULL,
  `accreditation` tinyint DEFAULT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`idRole`, `typeRole`, `accreditation`, `valide`) VALUES
(1, 'Visiteur', 0, 1),
(4, 'Membre', 1, 1),
(6, 'Administrateur', 2, 1),
(9, 'gestionnaire', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `routageForm`
--

CREATE TABLE `routageForm` (
  `idForm` int NOT NULL,
  `chemin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `securiter` tinyint(1) NOT NULL DEFAULT '0',
  `valide` tinyint(1) NOT NULL DEFAULT '1',
  `route` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idModule` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `routageForm`
--

INSERT INTO `routageForm` (`idForm`, `chemin`, `securiter`, `valide`, `route`, `idModule`) VALUES
(1, 'modules/users/CUD/Create/inscriptionUser.php', 0, 1, '566650658658432356', 1),
(2, 'modules/securiter/connexionUser.php', 0, 1, '56194536164615645146', 1),
(3, 'modules/users/CUD/Update/activationUser.php', 0, 1, '14166200411661', 1),
(4, 'modules/navigation/CUD/Create/addLien.php', 2, 1, '8796392765152463164', 1),
(5, 'modules/dataSite/CUD/Update/updateDataSite.php', 2, 1, '063613895944858521', 1),
(6, 'modules/navigation/CUD/Create/addMenusDeroulant.php', 2, 1, '38312493425161386', 1),
(7, 'modules/navigation/CUD/Create/addRouteForm.php', 2, 1, '629611946201431', 1),
(14, 'modules/users/CUD/Update/modAdminUser.php', 2, 1, '435467912014300', 1),
(16, 'modules/users/CUD/Update/emailUser.php', 1, 1, '8976256194854671', 1),
(17, 'modules/users/CUD/Update/loginUser.php', 1, 1, '27562344522012309343', 1),
(18, 'modules/users/CUD/Update/mdpUser.php', 1, 1, '695865766244377465', 1),
(19, 'modules/journaux/deleteLog.php', 2, 1, '267651732275054', 1),
(20, 'modules/navigation/CUD/update/updateLienNav.php', 2, 1, '759622615759240', 1),
(21, 'modules/navigation/CUD/Delete/deleteLienNav.php', 2, 1, '441157825402921244', 1),
(22, 'modules/users/CUD/Update/desincriptionUser.php', 1, 1, '1441639894575196', 1),
(23, 'modules/navigation/CUD/update/updateModule.php', 2, 1, '544691021972867611', 1),
(25, 'modules/navigation/CUD/Create/addModule.php', 2, 1, '66657605450967322', 1),
(29, 'modules/users/CUD/Create/addRoles.php', 2, 1, '16047557811726668', 1),
(56, 'modules/users/CUD/Update/sendToken.php', 0, 1, '44104608473146867451', 1),
(57, 'modules/users/CUD/Update/updatePassword.php', 0, 1, '85903514975552676684', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idUser` int NOT NULL,
  `token` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mdp` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '0',
  `role` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Index pour les tables déchargées
--

--
-- Index pour la table `dataSite`
--
ALTER TABLE `dataSite`
  ADD PRIMARY KEY (`idDataSite`);

--
-- Index pour la table `journaux`
--
ALTER TABLE `journaux`
  ADD PRIMARY KEY (`idConnexion`);

--
-- Index pour la table `menuNav`
--
ALTER TABLE `menuNav`
  ADD PRIMARY KEY (`idMenuDeroulant`);

--
-- Index pour la table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`idNav`),
  ADD KEY `lierModule` (`idModule`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRole`);

--
-- Index pour la table `routageForm`
--
ALTER TABLE `routageForm`
  ADD PRIMARY KEY (`idForm`),
  ADD KEY `lienModule` (`idModule`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `dataSite`
--
ALTER TABLE `dataSite`
  MODIFY `idDataSite` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `journaux`
--
ALTER TABLE `journaux`
  MODIFY `idConnexion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `menuNav`
--
ALTER TABLE `menuNav`
  MODIFY `idMenuDeroulant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `idNav` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `idRole` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `routageForm`
--
ALTER TABLE `routageForm`
  MODIFY `idForm` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `navigation`
--
ALTER TABLE `navigation`
  ADD CONSTRAINT `lierModule` FOREIGN KEY (`idModule`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `routageForm`
--
ALTER TABLE `routageForm`
  ADD CONSTRAINT `lienModule` FOREIGN KEY (`idModule`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
