-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 27 Juillet 2014 à 14:41
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `footballmanagement`
--
CREATE DATABASE IF NOT EXISTS `footballmanagement` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `footballmanagement`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_personne` int(11) NOT NULL,
  `profil` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`),
  UNIQUE KEY `id_personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id_personne`, `profil`) VALUES
(1, 1000),
(2, 1000);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL,
  `intitule` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `age_debut` int(2) NOT NULL,
  `age_fin` int(2) NOT NULL,
  `tps_jeu` int(2) NOT NULL,
  `tps_prolongation` int(2) NOT NULL,
  `nbjoueurs` int(2) NOT NULL,
  `nbremplacant` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

CREATE TABLE IF NOT EXISTS `club` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nomreduit` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `color1` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `color2` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `educateur`
--

CREATE TABLE IF NOT EXISTS `educateur` (
  `id_educateur` int(11) NOT NULL AUTO_INCREMENT,
  `id_personne` int(11) NOT NULL,
  `id_saison` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `fonction` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_educateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `entrainement`
--

CREATE TABLE IF NOT EXISTS `entrainement` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `h_debut` datetime NOT NULL,
  `h_fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `id` int(11) NOT NULL,
  `id_saison` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `phase` int(1) DEFAULT NULL,
  `division` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `objectif` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `debut` datetime NOT NULL,
  `fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `indisponibilite`
--

CREATE TABLE IF NOT EXISTS `indisponibilite` (
  `id_personne` int(11) NOT NULL,
  `motif` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `debut` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `id_blessure` int(11) NOT NULL,
  `justificatif` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
  `id_joueur` int(11) NOT NULL AUTO_INCREMENT,
  `id_personne` int(11) NOT NULL,
  `id_saison` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `pied_fort` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `position_pref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE IF NOT EXISTS `match` (
  `id` int(11) NOT NULL,
  `date_match` datetime NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `type_match` int(11) NOT NULL,
  `stade` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `equipe1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `equipe2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `butseq1` int(2) NOT NULL,
  `butseq2` int(2) NOT NULL,
  `buts_ap_eq1` int(2) NOT NULL,
  `buts_ap_eq2` int(2) NOT NULL,
  `tab_eq1` int(2) NOT NULL,
  `tab_eq2` int(2) NOT NULL,
  `systeme_eq1` int(11) NOT NULL,
  `systeme_eq2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participations`
--

CREATE TABLE IF NOT EXISTS `participations` (
  `id_participation` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_participation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `participentrainement`
--

CREATE TABLE IF NOT EXISTS `participentrainement` (
  `id_personne` int(11) NOT NULL,
  `id_entrainement` int(11) NOT NULL,
  `id_participation` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participmatch`
--

CREATE TABLE IF NOT EXISTS `participmatch` (
  `id_personne` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `id_participation` int(2) NOT NULL,
  `tps_entree` int(11) NOT NULL,
  `tps_sortie` int(11) NOT NULL,
  `id_poste` int(11) NOT NULL,
  `id_systeme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date_naiss` date NOT NULL,
  `adresse1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `adresse2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'France',
  `mail` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(11) NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id`, `nom`, `prenom`, `username`, `password`, `date_naiss`, `adresse1`, `adresse2`, `cp`, `ville`, `pays`, `mail`, `tel`, `photo`) VALUES
(1, 'GRILLON', 'Sébastien', 'seb', 'admin', '1977-10-22', '', '', 0, '', 'France', 'sebag@libertysurf.fr', 0, ''),
(2, 'ROBERT', 'Timothée', 'timo', 'admin', '0000-00-00', '', '', 0, '', 'France', '', 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE IF NOT EXISTS `saison` (
  `id_saison` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  PRIMARY KEY (`id_saison`),
  KEY `id_saison` (`id_saison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typematch`
--

CREATE TABLE IF NOT EXISTS `typematch` (
  `id` int(11) NOT NULL,
  `intitule` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
