-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 24 Juillet 2014 à 02:51
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `footballmanagement`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_personne` int(11) NOT NULL,
  `profil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

CREATE TABLE IF NOT EXISTS `club` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `color1` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `color2` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `educateur`
--

CREATE TABLE IF NOT EXISTS `educateur` (
  `id_personne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `nom` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `division` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `objectif` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(11) NOT NULL,
  `nom` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `debut` datetime NOT NULL,
  `fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `indisponibilite`
--

CREATE TABLE IF NOT EXISTS `indisponibilite` (
  `id_personne` int(11) NOT NULL,
  `motif` text COLLATE utf8_unicode_ci NOT NULL,
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
  `id_personne` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `pied_fort` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `position_pref` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE IF NOT EXISTS `match` (
  `id` int(11) NOT NULL,
  `equipe1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `equipe2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `date_match` date NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `score` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `stade` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `prolongation` tinyint(1) NOT NULL,
  `type_match` int(11) NOT NULL,
  `systeme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participentrainement`
--

CREATE TABLE IF NOT EXISTS `participentrainement` (
  `id_joueur` int(11) NOT NULL,
  `id_entrainement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participmatch`
--

CREATE TABLE IF NOT EXISTS `participmatch` (
  `id_personne` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date_naiss` date NOT NULL,
  `adresse` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(11) NOT NULL,
  `mdp` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE IF NOT EXISTS `saison` (
  `id` int(11) NOT NULL,
  `debut` int(11) NOT NULL,
  `fin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
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
