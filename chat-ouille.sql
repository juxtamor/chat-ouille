-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 20 Février 2017 à 11:42
-- Version du serveur: 5.5.53-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `chat-ouille`
--

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(4095) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_author` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_author` (`id_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=111 ;

--
-- Contenu de la table `messages`
--

INSERT INTO `messages` (`id`, `date`, `content`, `id_author`) VALUES
(73, '2017-02-20 09:04:38', 'Bordel, y a Xena en bas...', 9),
(76, '2017-02-20 09:07:05', '...', 9),
(78, '2017-02-20 09:10:15', 'Â« In a time of ancient Gods, Warlords and Kings, a land in turmoil cried out for a hero. She was Xena, a mighty princess forged in the heat of battle. The power. The passion. The danger. Her courage will change the world. Â»', 9),
(79, '2017-02-20 09:11:29', 'Â« Ã€ l''Ã©poque des Dieux de la mythologie, des Seigneurs de la guerre et des Rois de lÃ©gende, un pays en plein dÃ©sordre demandait un hÃ©ros. Alors survint Xena, une prestigieuse princesse issue du cÅ“ur des batailles. Combat. Passion. Danger. Par son courage, Xena changera la face du monde. Â»', 9),
(81, '2017-02-20 09:44:15', 'Gabrielle est une chanson Ã©crite par Long Chris et composÃ©e par Tony Cole pour Johnny Hallyday en 1976.', 9),
(82, '2017-02-20 09:51:32', 'Je suis lÃ  ! :D', 12),
(83, '2017-02-20 10:10:09', 'Des messages !', 12),
(85, '2017-02-20 10:10:51', 'toto', 2),
(86, '2017-02-20 10:12:34', 'prout', 2),
(91, '2017-02-20 10:15:00', 'BELETTE !', 3),
(92, '2017-02-20 10:15:00', 'les chickos ', 2),
(93, '2017-02-20 10:15:33', 'salut', 10),
(94, '2017-02-20 10:18:21', 'tu pu', 2),
(95, '2017-02-20 10:18:29', 'Non?', 3),
(96, '2017-02-20 10:19:11', 'We are... the... GANG OF CATZ ! GrrRRraaaou mmAAaOouuwwW !', 3),
(97, '2017-02-20 10:19:34', 'c''est beaucoup mieux', 10),
(98, '2017-02-20 10:19:42', 'perfectooooo', 2),
(99, '2017-02-20 10:19:44', 'Je like.', 3),
(100, '2017-02-20 10:19:50', 'merci Emeline :D !', 10),
(101, '2017-02-20 10:19:57', 'chickos de la bananos', 2),
(104, '2017-02-20 10:21:27', 'https://i.makeagif.com/media/11-17-2014/8gmdTQ.gif', 12),
(106, '2017-02-20 10:22:16', 'oui, on arrive', 10),
(107, '2017-02-20 10:23:00', 'Il fait faim, il est 11:22, pas de pause, on va tous mÃ»rir...', 12),
(108, '2017-02-20 10:31:20', 'Instant tannÃ©...', 12),
(109, '2017-02-20 10:35:42', 'jsbxjhdckjlqcfjq', 2),
(110, '2017-02-20 10:37:39', 'To eat?', 12);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(63) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(63) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(63) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `birthdate` date NOT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT '0',
  `avatar` varchar(511) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_act` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`, `birthdate`, `admin`, `avatar`, `last_act`) VALUES
(1, 'julio', '$2y$12$0s4Lci6nta25FQq7QP/9mu.VPHvnvIkeZV2ogY.sXKu23IgT8t4De', 'test@test.com', '2017-02-17', 0, 'https://cdn.suwalls.com/wallpapers/animals/serious-cat-26132-400x250.jpg', '0000-00-00 00:00:00'),
(2, 'emeline', '$2y$12$aIQQlnxYBKeSZM6kw4bzKeEn6ZWWE42s5MwAUGn3Dcw6yjmSF6fEu', 'test@test.fr', '2017-02-26', 0, 'https://s-media-cache-ak0.pinimg.com/564x/a9/12/58/a91258f7095560423fe5fcbc0bf096ef.jpg', '0000-00-00 00:00:00'),
(3, 'juxt', '$2y$12$nnHEqcjrL1P4PuNy69Nf9uA.D36e0t37vzdDmM5BBfY1Qp7z9TmoG', 'bob@milou.fr', '2017-12-31', 0, 'http://i3.kym-cdn.com/entries/icons/original/000/000/472/seriouscatcover.jpg', '0000-00-00 00:00:00'),
(4, 'totototo', '$2y$12$L4JBlCCk47UeyZbotmmYh.LjqXkMB7nKxISPuYLiz3MhZ8XA3fy7i', 'toto@toto.toto', '2017-02-17', 0, 'http://4.bp.blogspot.com/-Ivo0VEqfz7I/TxypkmaotTI/AAAAAAAAADM/IQxRC3MY5n4/s320/toto2.png', '0000-00-00 00:00:00'),
(6, 'zovzov', '$2y$12$cLBsXfZWjg7V9EPiCxHb2.3jHtSvtQh4OpKeyP0VwNJGigpEID.Ry', 'zovzov@zovzov.fr', '2017-02-26', 0, 'http://i13.photobucket.com/albums/a281/Rollin_Homey88/mystical.jpg', '0000-00-00 00:00:00'),
(9, 'Johny', '$2y$12$jaK/3/fFkxmSANPjigeJZO2uZo57Gw/qMip97KA.Zjf2.U61vYOZK', 'bob@jesuisbob.com', '1910-01-31', 0, 'https://media.giphy.com/media/l41YuwS5IipGquPmM/giphy.gif', '0000-00-00 00:00:00'),
(10, 'juliojulio', '$2y$12$X9vqc6Js8gsIqz98n97Tk.rG09Flu1.s6Ml15K6nje2YBkEjA.BnS', 'julio@julio.com', '2017-02-20', 0, 'http://imworld.aufeminin.com/story/20151204/noeud-papillon-pour-chat-824223_w1020h450c1cx369cy303.jpg', '0000-00-00 00:00:00'),
(12, 'Gabrielle', '$2y$12$LeWWXWOW9Lp/0C2UGrtz7ukgrBnC7VN1zGl2z9Z6v7ACTQ4e/TeX6', 'gaby@lol.com', '1801-01-02', 0, 'https://media.giphy.com/media/LfkySBMSWXAg8/giphy.gif', '0000-00-00 00:00:00');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
