-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 29 mars 2024 à 16:00
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
-- Base de données : `xgyd0647_r5v3`
--

-- --------------------------------------------------------

--
-- Structure de la table `factions`
--

CREATE TABLE `factions` (
  `id` int NOT NULL,
  `name_Factions` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `id_Author` int DEFAULT NULL,
  `id_Universe` int DEFAULT NULL,
  `date_Creat` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_Update` datetime DEFAULT NULL,
  `share_faction` tinyint(1) NOT NULL DEFAULT '0',
  `valid` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_Miniature`
--

CREATE TABLE `group_Miniature` (
  `id` int NOT NULL,
  `name_Group` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `command_Point` float DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_Vehicle`
--

CREATE TABLE `group_Vehicle` (
  `id` int NOT NULL,
  `name_Group_Vehicle` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `command_Point` float DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_Weapon`
--

CREATE TABLE `group_Weapon` (
  `id` int NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `link_Miniature_faction`
--

CREATE TABLE `link_Miniature_faction` (
  `id_Faction` int DEFAULT NULL,
  `id_Miniature` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `link_Patrole_Group_Miniature`
--

CREATE TABLE `link_Patrole_Group_Miniature` (
  `id_Miniature` int DEFAULT NULL,
  `id_Patrol_Group` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `link_Patrole_Group_Vehicle`
--

CREATE TABLE `link_Patrole_Group_Vehicle` (
  `id_Vehicle` int DEFAULT NULL,
  `id_Patrol_Group` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `link_special_Rules_miniature`
--

CREATE TABLE `link_special_Rules_miniature` (
  `id_Special_Rules` int DEFAULT NULL,
  `id_Miniature_Profil` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `link_special_Rules_vehicle`
--

CREATE TABLE `link_special_Rules_vehicle` (
  `id_Special_Rules` int DEFAULT NULL,
  `id_Vehicle` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `link_special_Rules_weapon`
--

CREATE TABLE `link_special_Rules_weapon` (
  `id_Weapon` int DEFAULT NULL,
  `id_Special_Rules` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `link_Weapon_Faction`
--

CREATE TABLE `link_Weapon_Faction` (
  `id_Faction` int DEFAULT NULL,
  `id_Weapon` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `miniature_gear`
--

CREATE TABLE `miniature_gear` (
  `id_Weapon` int DEFAULT NULL,
  `id_Miniature` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `miniature_Profil`
--

CREATE TABLE `miniature_Profil` (
  `id` int NOT NULL,
  `id_Author` int DEFAULT NULL,
  `id_Group_Miniature` int DEFAULT NULL,
  `name_Miniature` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DQM` tinyint DEFAULT NULL,
  `bonus_DQM` tinyint DEFAULT NULL,
  `DC` tinyint DEFAULT NULL,
  `Bonus_DC` tinyint DEFAULT NULL,
  `tactical_Move` tinyint DEFAULT NULL,
  `run` tinyint DEFAULT NULL,
  `save` tinyint DEFAULT NULL,
  `healt` tinyint DEFAULT NULL,
  `locker` tinyint(1) DEFAULT NULL,
  `base_Price` float DEFAULT NULL,
  `date_Creat` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_Update` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patrol_Group`
--

CREATE TABLE `patrol_Group` (
  `id` int NOT NULL,
  `name_Patrol_Group` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_Faction` int DEFAULT NULL,
  `price_Patrol_Group` float DEFAULT NULL,
  `id_Author` int DEFAULT NULL,
  `date_Creat` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_Update` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `special_Rules`
--

CREATE TABLE `special_Rules` (
  `id` int NOT NULL,
  `group_Special_Rules` int DEFAULT NULL,
  `name_Special_Rules` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description_Special_Rules` text COLLATE utf8mb4_general_ci,
  `bonus_DC` tinyint DEFAULT NULL,
  `Bonus_DQM` tinyint DEFAULT NULL,
  `Bonus_Power` tinyint DEFAULT NULL,
  `price` float DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `universes`
--

CREATE TABLE `universes` (
  `id` int NOT NULL,
  `name_Univers` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NT` tinyint DEFAULT NULL,
  `id_Author` int DEFAULT NULL,
  `date_Creat` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_Update` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicel`
--

CREATE TABLE `vehicel` (
  `id` int NOT NULL,
  `id_Author` int DEFAULT NULL,
  `id_Group_Vehicle` int DEFAULT NULL,
  `name_Vehicle` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DQM` tinyint DEFAULT NULL,
  `bonus_DQM` tinyint DEFAULT NULL,
  `DC` tinyint DEFAULT NULL,
  `Bonus_DC` tinyint DEFAULT NULL,
  `tactical_Move` tinyint DEFAULT NULL,
  `run` tinyint DEFAULT NULL,
  `save` tinyint DEFAULT NULL,
  `endurance` tinyint DEFAULT NULL,
  `base_Price` int DEFAULT NULL,
  `locker` tinyint(1) DEFAULT NULL,
  `date_Creat` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_Update` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_gear`
--

CREATE TABLE `vehicle_gear` (
  `id_Weapon` int DEFAULT NULL,
  `id_Vehicle` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `weapons`
--

CREATE TABLE `weapons` (
  `id` int NOT NULL,
  `id_Author` int DEFAULT NULL,
  `id_Group_Weapon` int DEFAULT NULL,
  `name_Weapon` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NT` tinyint DEFAULT NULL,
  `common` tinyint(1) DEFAULT NULL,
  `power` tinyint(1) DEFAULT NULL,
  `over_Power` tinyint(1) DEFAULT NULL,
  `Bonus_Power` tinyint(1) DEFAULT NULL,
  `damage_Bonus` tinyint(1) DEFAULT NULL,
  `heavy_Weapon` tinyint(1) DEFAULT NULL,
  `assault_Weapon` tinyint(1) DEFAULT NULL,
  `rate_Of_Fire` tinyint DEFAULT NULL,
  `blast_Zone_Type` tinyint(1) DEFAULT NULL,
  `damage_Blast_Zone` tinyint(1) DEFAULT NULL,
  `locker` tinyint(1) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `date_Creat` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_Update` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_faction_univers` (`id_Universe`),
  ADD KEY `link_user_faction` (`id_Author`);

--
-- Index pour la table `group_Miniature`
--
ALTER TABLE `group_Miniature`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `group_Vehicle`
--
ALTER TABLE `group_Vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `group_Weapon`
--
ALTER TABLE `group_Weapon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `link_Miniature_faction`
--
ALTER TABLE `link_Miniature_faction`
  ADD KEY `link_miniature` (`id_Miniature`),
  ADD KEY `link_faction` (`id_Faction`);

--
-- Index pour la table `link_Patrole_Group_Miniature`
--
ALTER TABLE `link_Patrole_Group_Miniature`
  ADD KEY `link_Miniature_Patrol` (`id_Miniature`),
  ADD KEY `link_Patrol_Group_for_Miniature` (`id_Patrol_Group`);

--
-- Index pour la table `link_Patrole_Group_Vehicle`
--
ALTER TABLE `link_Patrole_Group_Vehicle`
  ADD KEY `link_vehicel_Patrol` (`id_Vehicle`),
  ADD KEY `link_patrol_group_vehicel` (`id_Patrol_Group`);

--
-- Index pour la table `link_special_Rules_miniature`
--
ALTER TABLE `link_special_Rules_miniature`
  ADD KEY `link_SR_Miniature` (`id_Miniature_Profil`),
  ADD KEY `link_SR_fo_Miniature` (`id_Special_Rules`);

--
-- Index pour la table `link_special_Rules_vehicle`
--
ALTER TABLE `link_special_Rules_vehicle`
  ADD KEY `link_SR_Vehicel` (`id_Vehicle`),
  ADD KEY `link_SR_for_Vehicle` (`id_Special_Rules`);

--
-- Index pour la table `link_special_Rules_weapon`
--
ALTER TABLE `link_special_Rules_weapon`
  ADD KEY `link_SR_Weapon` (`id_Weapon`),
  ADD KEY `link_SR_For_Weapon` (`id_Special_Rules`);

--
-- Index pour la table `link_Weapon_Faction`
--
ALTER TABLE `link_Weapon_Faction`
  ADD KEY `link_faction_weapon` (`id_Weapon`),
  ADD KEY `link_faction_for_weapon` (`id_Faction`);

--
-- Index pour la table `miniature_gear`
--
ALTER TABLE `miniature_gear`
  ADD KEY `link_miniature_equipement` (`id_Miniature`),
  ADD KEY `link_miniature_dotation` (`id_Weapon`);

--
-- Index pour la table `miniature_Profil`
--
ALTER TABLE `miniature_Profil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_author_profil` (`id_Author`),
  ADD KEY `link_group_miniature` (`id_Group_Miniature`);

--
-- Index pour la table `patrol_Group`
--
ALTER TABLE `patrol_Group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_faction_PatrolGroup` (`id_Faction`),
  ADD KEY `link_Author_PatrolGroup` (`id_Author`);

--
-- Index pour la table `special_Rules`
--
ALTER TABLE `special_Rules`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `universes`
--
ALTER TABLE `universes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_author_universe` (`id_Author`);

--
-- Index pour la table `vehicel`
--
ALTER TABLE `vehicel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_vehicel_group` (`id_Group_Vehicle`),
  ADD KEY `link_author_of_vehicel` (`id_Author`);

--
-- Index pour la table `vehicle_gear`
--
ALTER TABLE `vehicle_gear`
  ADD KEY `link_vehicel_for_dotation` (`id_Vehicle`),
  ADD KEY `link_weapon_dotation_vehicel` (`id_Weapon`);

--
-- Index pour la table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_of_weapon` (`id_Group_Weapon`),
  ADD KEY `weapon_author` (`id_Author`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `factions`
--
ALTER TABLE `factions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `group_Miniature`
--
ALTER TABLE `group_Miniature`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `group_Vehicle`
--
ALTER TABLE `group_Vehicle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `group_Weapon`
--
ALTER TABLE `group_Weapon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `miniature_Profil`
--
ALTER TABLE `miniature_Profil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patrol_Group`
--
ALTER TABLE `patrol_Group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `special_Rules`
--
ALTER TABLE `special_Rules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `universes`
--
ALTER TABLE `universes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicel`
--
ALTER TABLE `vehicel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `factions`
--
ALTER TABLE `factions`
  ADD CONSTRAINT `link_faction_univers` FOREIGN KEY (`id_Universe`) REFERENCES `universes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_user_faction` FOREIGN KEY (`id_Author`) REFERENCES `xgyd0647_techniquer5`.`users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_Miniature_faction`
--
ALTER TABLE `link_Miniature_faction`
  ADD CONSTRAINT `link_faction` FOREIGN KEY (`id_Faction`) REFERENCES `factions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_miniature` FOREIGN KEY (`id_Miniature`) REFERENCES `miniature_Profil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_Patrole_Group_Miniature`
--
ALTER TABLE `link_Patrole_Group_Miniature`
  ADD CONSTRAINT `link_Miniature_Patrol` FOREIGN KEY (`id_Miniature`) REFERENCES `miniature_Profil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_Patrol_Group_for_Miniature` FOREIGN KEY (`id_Patrol_Group`) REFERENCES `patrol_Group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_Patrole_Group_Vehicle`
--
ALTER TABLE `link_Patrole_Group_Vehicle`
  ADD CONSTRAINT `link_patrol_group_vehicel` FOREIGN KEY (`id_Patrol_Group`) REFERENCES `patrol_Group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_vehicel_Patrol` FOREIGN KEY (`id_Vehicle`) REFERENCES `vehicel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_special_Rules_miniature`
--
ALTER TABLE `link_special_Rules_miniature`
  ADD CONSTRAINT `link_SR_fo_Miniature` FOREIGN KEY (`id_Special_Rules`) REFERENCES `special_Rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_SR_Miniature` FOREIGN KEY (`id_Miniature_Profil`) REFERENCES `miniature_Profil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_special_Rules_vehicle`
--
ALTER TABLE `link_special_Rules_vehicle`
  ADD CONSTRAINT `link_SR_for_Vehicle` FOREIGN KEY (`id_Special_Rules`) REFERENCES `special_Rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_SR_Vehicel` FOREIGN KEY (`id_Vehicle`) REFERENCES `vehicel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_special_Rules_weapon`
--
ALTER TABLE `link_special_Rules_weapon`
  ADD CONSTRAINT `link_SR_For_Weapon` FOREIGN KEY (`id_Special_Rules`) REFERENCES `special_Rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_SR_Weapon` FOREIGN KEY (`id_Weapon`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `link_Weapon_Faction`
--
ALTER TABLE `link_Weapon_Faction`
  ADD CONSTRAINT `link_faction_for_weapon` FOREIGN KEY (`id_Faction`) REFERENCES `factions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_faction_weapon` FOREIGN KEY (`id_Weapon`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `miniature_gear`
--
ALTER TABLE `miniature_gear`
  ADD CONSTRAINT `link_miniature_dotation` FOREIGN KEY (`id_Weapon`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_miniature_equipement` FOREIGN KEY (`id_Miniature`) REFERENCES `miniature_Profil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `miniature_Profil`
--
ALTER TABLE `miniature_Profil`
  ADD CONSTRAINT `link_author_profil` FOREIGN KEY (`id_Author`) REFERENCES `xgyd0647_techniquer5`.`users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_group_miniature` FOREIGN KEY (`id_Group_Miniature`) REFERENCES `group_Miniature` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `patrol_Group`
--
ALTER TABLE `patrol_Group`
  ADD CONSTRAINT `link_Author_PatrolGroup` FOREIGN KEY (`id_Author`) REFERENCES `xgyd0647_techniquer5`.`users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_faction_PatrolGroup` FOREIGN KEY (`id_Faction`) REFERENCES `factions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `universes`
--
ALTER TABLE `universes`
  ADD CONSTRAINT `link_author_universe` FOREIGN KEY (`id_Author`) REFERENCES `xgyd0647_techniquer5`.`users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicel`
--
ALTER TABLE `vehicel`
  ADD CONSTRAINT `link_author_of_vehicel` FOREIGN KEY (`id_Author`) REFERENCES `xgyd0647_techniquer5`.`users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_vehicel_group` FOREIGN KEY (`id_Group_Vehicle`) REFERENCES `group_Vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicle_gear`
--
ALTER TABLE `vehicle_gear`
  ADD CONSTRAINT `link_vehicel_for_dotation` FOREIGN KEY (`id_Vehicle`) REFERENCES `vehicel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `link_weapon_dotation_vehicel` FOREIGN KEY (`id_Weapon`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `weapons`
--
ALTER TABLE `weapons`
  ADD CONSTRAINT `type_of_weapon` FOREIGN KEY (`id_Group_Weapon`) REFERENCES `group_Weapon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `weapon_author` FOREIGN KEY (`id_Author`) REFERENCES `xgyd0647_techniquer5`.`users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
