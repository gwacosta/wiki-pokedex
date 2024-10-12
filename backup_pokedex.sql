/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pokedex
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP DATABASE IF EXISTS pokedex;

CREATE DATABASE pokedex;

USE pokedex;

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES
('1e94f05e-93ea-44d1-a452-8b3f8b45bf1e','30113130876a509a4d8df227480f48e96c300f505c3cb5fe355310bd5af4d0e3','2024-10-11 06:08:55.058','20241011060854_adicionado_treinador_e_capturas',NULL,NULL,'2024-10-11 06:08:54.992',1),
('237a3d16-4f9d-447c-be6c-a75154833377','f15d1033e34f1a3b38b42d9d913834ea8ac4385177ab738ef3213468c294e389','2024-09-10 07:09:27.555','20240906062235_segundo_envio',NULL,NULL,'2024-09-10 07:09:27.532',1),
('441a0b38-49f7-48e8-8754-5359507fce74','6a9259f4c1d178e8127d70fda8bd8e77e9e63a123ca2f8b64bba75377c00c3ac','2024-09-10 08:55:48.235','20240910085548_setimo_envio',NULL,NULL,'2024-09-10 08:55:48.184',1),
('6082df02-ed47-443f-a3a9-2c9f8519ff25','2058908e4c5236eb64b274708ff1d705dceaab93433f01060801c15b1b802899','2024-09-10 07:09:27.572','20240906081339_terceiro_envio',NULL,NULL,'2024-09-10 07:09:27.556',1),
('945830fe-6f41-4a1c-afde-cceadd390285','dfe2a6e0980829cb27136e550aaea0a30c15e55c976052de6f04060358d5d365','2024-09-10 07:09:27.529','20240906060504_tabelas_iniciais',NULL,NULL,'2024-09-10 07:09:27.424',1),
('b461d0c8-6223-4e53-8c04-d0249531420b','e9910271be4e88b0b376c35d16851a798c8e5b2d124d2b7a1a28085909728d4b','2024-09-10 07:09:27.635','20240907061043_sexto_envio',NULL,NULL,'2024-09-10 07:09:27.622',1),
('bb14a221-79f3-48a1-9bca-a16f25b7075e','0d1940821c98ed82ad40dc0bdcec90b5b24882df6917ca5845a1c773a348fe52','2024-10-11 06:46:25.557','20241011064625_ajustado_email_treinador',NULL,NULL,'2024-10-11 06:46:25.536',1),
('d40aa82c-44e9-434d-ab65-45b2acc866b6','3d25e7d1152691798baffb32fe60526b1fad08afe288997a2c8d3b6f6d480015','2024-09-10 07:09:27.589','20240907041753_quarto_envio',NULL,NULL,'2024-09-10 07:09:27.573',1),
('e2010d5d-42d0-416b-aba6-7ea13763136e','2e7971bf4aaec8146d4244daec25d507b3c576bc19b236cf6446f2ddb75ca155','2024-09-10 07:09:27.619','20240907061023_sexto_envio',NULL,NULL,'2024-09-10 07:09:27.603',1),
('e2ada6f4-cbf2-4236-b032-9b4c0265c63d','8be2b5e21d1bb7551747443f57626c559acb096a14ff7cf0fa7216750d87bd22','2024-10-12 05:58:32.146','20241012055832_adicionado_cod_rec_senha',NULL,NULL,'2024-10-12 05:58:32.086',1),
('ebd40867-69a4-4db3-af63-e3857b3ba534','59099c1d9fe9c36593b85a9080375e80744af8e4c6e82c5b10e02a17c5d7e03a','2024-09-10 07:09:27.602','20240907055250_quinto_envio',NULL,NULL,'2024-09-10 07:09:27.590',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capturas`
--

DROP TABLE IF EXISTS `capturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capturas` (
  `treinadorId` varchar(36) NOT NULL,
  `pokemonId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`treinadorId`,`pokemonId`),
  KEY `capturas_pokemonId_fkey` (`pokemonId`),
  CONSTRAINT `capturas_pokemonId_fkey` FOREIGN KEY (`pokemonId`) REFERENCES `pokemons` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `capturas_treinadorId_fkey` FOREIGN KEY (`treinadorId`) REFERENCES `treinadores` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capturas`
--

LOCK TABLES `capturas` WRITE;
/*!40000 ALTER TABLE `capturas` DISABLE KEYS */;
INSERT INTO `capturas` VALUES
('79fa10d6-58ad-485e-a6b3-d420e533b982',1,'2024-10-12 04:54:54.649'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',2,'2024-10-12 04:24:23.164'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',3,'2024-10-12 04:24:19.360'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',4,'2024-10-12 04:24:45.749'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',5,'2024-10-12 04:24:47.478'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',6,'2024-10-12 04:24:49.491'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',63,'2024-10-12 04:24:59.399'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',64,'2024-10-12 04:25:00.841'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',65,'2024-10-12 04:25:02.291'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',145,'2024-10-12 04:24:36.628'),
('79fa10d6-58ad-485e-a6b3-d420e533b982',151,'2024-10-12 04:24:40.600'),
('e74bded7-5c2b-443b-881d-c90b5a21293f',7,'2024-10-12 04:46:32.115'),
('e74bded7-5c2b-443b-881d-c90b5a21293f',8,'2024-10-12 04:46:33.799'),
('e74bded7-5c2b-443b-881d-c90b5a21293f',9,'2024-10-12 04:46:36.089'),
('e74bded7-5c2b-443b-881d-c90b5a21293f',92,'2024-10-12 04:49:44.290'),
('e74bded7-5c2b-443b-881d-c90b5a21293f',93,'2024-10-12 04:49:45.810'),
('e74bded7-5c2b-443b-881d-c90b5a21293f',94,'2024-10-12 04:49:46.994'),
('e74bded7-5c2b-443b-881d-c90b5a21293f',144,'2024-10-12 04:50:13.381'),
('e74bded7-5c2b-443b-881d-c90b5a21293f',150,'2024-10-12 04:46:03.011');
/*!40000 ALTER TABLE `capturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES
(1,'Padrão'),
(2,'Iniciais'),
(3,'Míticos'),
(4,'Lendários');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemons`
--

DROP TABLE IF EXISTS `pokemons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `peso` decimal(6,1) NOT NULL,
  `altura` decimal(5,1) NOT NULL,
  `habPassiva` varchar(60) NOT NULL,
  `fraquezas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`fraquezas`)),
  `tipos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tipos`)),
  `grupoId` int(11) NOT NULL,
  `evolucaoId` int(11) DEFAULT NULL,
  `evoluiDeId` int(11) DEFAULT NULL,
  `foto` varchar(191) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pokemons_grupoId_fkey` (`grupoId`),
  KEY `pokemons_evolucaoId_fkey` (`evolucaoId`),
  KEY `pokemons_evoluiDeId_fkey` (`evoluiDeId`),
  CONSTRAINT `pokemons_evolucaoId_fkey` FOREIGN KEY (`evolucaoId`) REFERENCES `pokemons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pokemons_evoluiDeId_fkey` FOREIGN KEY (`evoluiDeId`) REFERENCES `pokemons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pokemons_grupoId_fkey` FOREIGN KEY (`grupoId`) REFERENCES `grupos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemons`
--

LOCK TABLES `pokemons` WRITE;
/*!40000 ALTER TABLE `pokemons` DISABLE KEYS */;
INSERT INTO `pokemons` VALUES
(1,'Bulbasaur',6.9,0.7,'Overgrow','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',2,2,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/001.png','A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.',1),
(2,'Ivysaur',13.0,1.0,'Overgrow','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',1,3,1,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/002.png','When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.',2),
(3,'Venusaur',100.0,2.0,'Overgrow','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',1,NULL,2,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/003.png','The plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.',3),
(4,'Charmander',8.5,0.6,'Blaze','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',2,5,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/004.png','Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.',4),
(5,'Charmeleon',19.0,1.1,'Blaze','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,6,4,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/005.png','When it swings its burning tail, it elevates the temperature to unbearably high levels.',5),
(6,'Charizard',90.5,1.7,'Blaze','[\"Pedra\",\"Eletrico\",\"Agua\",\"Gelo\",\"Terra\"]','[\"Fogo\",\"Voador\"]',1,NULL,5,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/006.png','Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.',6),
(7,'Squirtle',9.0,0.5,'Torrent','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',2,8,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/007.png','After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.',7),
(8,'Wartortle',22.5,1.0,'Torrent','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,9,7,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/008.png','Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance.',8),
(9,'Blastoise',85.5,1.6,'Torrent','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,NULL,8,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/009.png','A brutal POKéMON with pressurized water jets on its shell. They are used for high speed tackles.',9),
(10,'Caterpie',2.9,0.3,'Shield-dust','[\"Voador\",\"Fogo\",\"Pedra\"]','[\"Inseto\"]',1,11,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/010.png','Its short feet are tipped with suction pads that enable it to tirelessly climb slopes and walls.',10),
(11,'Metapod',9.9,0.7,'Shed-skin','[\"Voador\",\"Fogo\",\"Pedra\"]','[\"Inseto\"]',1,12,10,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/011.png','This POKéMON is vulnerable to attack while its shell is soft, exposing its weak and tender body.',11),
(12,'Butterfree',32.0,1.1,'Compound-eyes','[\"Voador\",\"Pedra\",\"Eletrico\",\"Gelo\",\"Fogo\"]','[\"Inseto\",\"Voador\"]',1,NULL,11,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/012.png','In battle, it flaps its wings at high speed to release highly toxic dust into the air.',12),
(13,'Weedle',3.2,0.3,'Shield-dust','[\"Psiquico\",\"Voador\",\"Pedra\",\"Terra\",\"Fogo\"]','[\"Inseto\",\"Venenoso\"]',1,14,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/013.png','Often found in forests, eating leaves. It has a sharp venomous stinger on its head.',13),
(14,'Kakuna',10.0,0.6,'Shed-skin','[\"Psiquico\",\"Voador\",\"Pedra\",\"Terra\",\"Fogo\"]','[\"Inseto\",\"Venenoso\"]',1,15,13,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/014.png','Almost incapable of moving, this POKéMON can only harden its shell to protect itself from predators.',14),
(15,'Beedrill',29.5,1.0,'Swarm','[\"Psiquico\",\"Voador\",\"Pedra\",\"Terra\",\"Fogo\"]','[\"Inseto\",\"Venenoso\"]',1,NULL,14,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/015.png','It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.',15),
(16,'Pidgey',1.8,0.3,'Keen-eye','[\"Pedra\",\"Gelo\",\"Lutador\",\"Eletrico\"]','[\"Normal\",\"Voador\"]',1,17,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/016.png','A common sight in forests and woods. It flaps its wings at ground level to kick up blinding sand.',16),
(17,'Pidgeotto',30.0,1.1,'Keen-eye','[\"Pedra\",\"Gelo\",\"Lutador\",\"Eletrico\"]','[\"Normal\",\"Voador\"]',1,18,16,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/017.png','Very protective of its sprawling territorial area, this POKéMON will fiercely peck at any intruder.',17),
(18,'Pidgeot',39.5,1.5,'Keen-eye','[\"Pedra\",\"Gelo\",\"Lutador\",\"Eletrico\"]','[\"Normal\",\"Voador\"]',1,NULL,17,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/018.png','When hunting, it skims the surface of water at high speed to pick off unwary prey such as MAGIKARP.',18),
(19,'Rattata',3.5,0.3,'Run-away','[\"Lutador\"]','[\"Normal\"]',1,20,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/019.png','Bites anything when it attacks. Small and very quick, it is a common sight in many places.',19),
(20,'Raticate',18.5,0.7,'Run-away','[\"Lutador\"]','[\"Normal\"]',1,NULL,19,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/020.png','It uses its whis­ kers to maintain its balance. It apparently slows down if they are cut off.',20),
(21,'Spearow',2.0,0.3,'Keen-eye','[\"Pedra\",\"Gelo\",\"Lutador\",\"Eletrico\"]','[\"Normal\",\"Voador\"]',1,22,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/021.png','It flaps its small wings busily to fly. Using its beak, it searches in grass for prey.',21),
(22,'Fearow',38.0,1.2,'Keen-eye','[\"Pedra\",\"Gelo\",\"Lutador\",\"Eletrico\"]','[\"Normal\",\"Voador\"]',1,NULL,21,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/022.png','With its huge and magnificent wings, it can keep aloft without ever having to land for rest.',22),
(23,'Ekans',6.9,2.0,'Intimidate','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,24,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/023.png','Moves silently and stealthily. Eats the eggs of birds, such as PIDGEY and SPEAROW, whole.',23),
(24,'Arbok',65.0,3.5,'Intimidate','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,NULL,23,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/024.png','It is rumored that the ferocious warning markings on its belly differ from area to area.',24),
(25,'Pikachu',6.0,0.4,'Static','[\"Terra\"]','[\"Eletrico\"]',1,26,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png','When several of these POKéMON gather, their electricity could build and cause lightning storms.',25),
(26,'Raichu',30.0,0.8,'Static','[\"Terra\"]','[\"Eletrico\"]',1,NULL,25,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/026.png','Its long tail serves as a ground to protect itself from its own high-voltage power.',26),
(27,'Sandshrew',12.0,0.6,'Sand-veil','[\"Agua\",\"Grama\",\"Gelo\"]','[\"Terra\"]',1,28,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/027.png','Burrows deep underground in arid locations far from water. It only emerges to hunt for food.',27),
(28,'Sandslash',29.5,1.0,'Sand-veil','[\"Agua\",\"Grama\",\"Gelo\"]','[\"Terra\"]',1,NULL,27,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/028.png','Curls up into a spiny ball when threatened. It can roll while curled up to attack or escape.',28),
(29,'Nidoran-f',7.0,0.4,'Poison-point','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,30,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/029.png','Although small, its venomous barbs render this POKéMON dangerous. The female has smaller horns.',29),
(30,'Nidorina',20.0,0.8,'Poison-point','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,31,29,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/030.png','The female\'s horn develops slowly. Prefers physical attacks such as clawing and biting.',30),
(31,'Nidoqueen',60.0,1.3,'Poison-point','[\"Psiquico\",\"Grama\",\"Agua\",\"Gelo\",\"Terra\"]','[\"Venenoso\",\"Terra\"]',1,NULL,30,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/031.png','Its hard scales provide strong protection. It uses its hefty bulk to execute powerful moves.',31),
(32,'Nidoran-m',9.0,0.5,'Poison-point','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,33,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/032.png','Stiffens its ears to sense danger. The larger its horns, the more powerful its secreted venom.',32),
(33,'Nidorino',19.5,0.9,'Poison-point','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,34,32,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/033.png','An aggressive POKéMON that is quick to attack. The horn on its head secretes a powerful venom.',33),
(34,'Nidoking',62.0,1.4,'Poison-point','[\"Psiquico\",\"Grama\",\"Agua\",\"Gelo\",\"Terra\"]','[\"Venenoso\",\"Terra\"]',1,NULL,33,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/034.png','It uses its powerful tail in battle to smash, constrict, then break the prey\'s bones.',34),
(35,'Clefairy',7.5,0.6,'Cute-charm','[\"Venenoso\",\"Aco\"]','[\"Fada\"]',1,36,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/035.png','Its magical and cute appeal has many admirers. It is rare and found only in certain areas.',35),
(36,'Clefable',40.0,1.3,'Cute-charm','[\"Venenoso\",\"Aco\"]','[\"Fada\"]',1,NULL,35,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/036.png','A timid fairy POKéMON that is rarely seen. It will run and hide the moment it senses people.',36),
(37,'Vulpix',9.9,0.6,'Flash-fire','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,38,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/037.png','At the time of birth, it has just one tail. The tail splits from its tip as it grows older.',37),
(38,'Ninetales',19.9,1.1,'Flash-fire','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,NULL,37,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/038.png','Very smart and very vengeful. Grabbing one of its many tails could result in a 1000-year curse.',38),
(39,'Jigglypuff',5.5,0.5,'Cute-charm','[\"Lutador\",\"Venenoso\",\"Aco\"]','[\"Normal\",\"Fada\"]',1,40,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/039.png','When its huge eyes light up, it sings a mysteriously soothing melody that lulls its enemies to sleep.',39),
(40,'Wigglytuff',12.0,1.0,'Cute-charm','[\"Lutador\",\"Venenoso\",\"Aco\"]','[\"Normal\",\"Fada\"]',1,NULL,39,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/040.png','The body is soft and rubbery. When angered, it will suck in air and inflate itself to an enormous size.',40),
(41,'Zubat',7.5,0.8,'Inner-focus','[\"Psiquico\",\"Pedra\",\"Eletrico\",\"Gelo\",\"Terra\"]','[\"Venenoso\",\"Voador\"]',1,42,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/041.png','Forms colonies in perpetually dark places. Uses ultrasonic waves to identify and approach targets.',41),
(42,'Golbat',55.0,1.6,'Inner-focus','[\"Psiquico\",\"Pedra\",\"Eletrico\",\"Gelo\",\"Terra\"]','[\"Venenoso\",\"Voador\"]',1,NULL,41,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/042.png','Once it strikes, it will not stop draining energy from the victim even if it gets too heavy to fly.',42),
(43,'Oddish',5.4,0.5,'Chlorophyll','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',1,44,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/043.png','During the day, it keeps its face buried in the ground. At night, it wanders around sowing its seeds.',43),
(44,'Gloom',8.6,0.8,'Chlorophyll','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',1,45,43,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/044.png','The fluid that oozes from its mouth isn\'t drool. It is a nectar that is used to attract prey.',44),
(45,'Vileplume',18.6,1.2,'Chlorophyll','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',1,NULL,44,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/045.png','It has the world’s largest petals. With every step, the petals shake out heavy clouds of toxic pollen.',45),
(46,'Paras',5.4,0.3,'Effect-spore','[\"Inseto\",\"Voador\",\"Pedra\",\"Venenoso\",\"Gelo\",\"Fogo\"]','[\"Inseto\",\"Grama\"]',1,47,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/046.png','Burrows to suck tree roots. The mushrooms on its back grow by draw­ ing nutrients from the bug host.',46),
(47,'Parasect',29.5,1.0,'Effect-spore','[\"Inseto\",\"Voador\",\"Pedra\",\"Venenoso\",\"Gelo\",\"Fogo\"]','[\"Inseto\",\"Grama\"]',1,NULL,46,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/047.png','A host-parasite pair in which the parasite mushroom has taken over the host bug. Prefers damp places.',47),
(48,'Venonat',30.0,1.0,'Compound-eyes','[\"Psiquico\",\"Voador\",\"Pedra\",\"Terra\",\"Fogo\"]','[\"Inseto\",\"Venenoso\"]',1,49,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/048.png','Lives in the shadows of tall trees where it eats insects. It is attracted by light at night.',48),
(49,'Venomoth',12.5,1.5,'Shield-dust','[\"Psiquico\",\"Voador\",\"Pedra\",\"Terra\",\"Fogo\"]','[\"Inseto\",\"Venenoso\"]',1,NULL,48,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/049.png','The dustlike scales covering its wings are color-coded to indicate the kinds of poison it has.',49),
(50,'Diglett',0.8,0.2,'Sand-veil','[\"Agua\",\"Grama\",\"Gelo\"]','[\"Terra\"]',1,51,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/050.png','Lives about one yard underground where it feeds on plant roots. It sometimes appears above ground.',50),
(51,'Dugtrio',33.3,0.7,'Sand-veil','[\"Agua\",\"Grama\",\"Gelo\"]','[\"Terra\"]',1,NULL,50,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/051.png','A team of DIGLETT triplets. It triggers huge earthquakes by burrowing 60 miles underground.',51),
(52,'Meowth',4.2,0.4,'Pickup','[\"Lutador\"]','[\"Normal\"]',1,53,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/052.png','It washes its face regularly to keep the coin on its forehead spotless. It doesn’t get along with Galarian Meowth.',52),
(53,'Persian',32.0,1.0,'Limber','[\"Lutador\"]','[\"Normal\"]',1,NULL,52,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/053.png','Although its fur has many admirers, it is tough to raise as a pet because of its fickle meanness.',53),
(54,'Psyduck',19.6,0.8,'Damp','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,55,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/054.png','While lulling its enemies with its vacant look, this wily POKéMON will use psychokinetic powers.',54),
(55,'Golduck',76.6,1.7,'Damp','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,NULL,54,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/055.png','Often seen swim­ ming elegantly by lake shores. It is often mistaken for the Japanese monster, Kappa.',55),
(56,'Mankey',28.0,0.5,'Vital-spirit','[\"Voador\",\"Psiquico\",\"Fada\"]','[\"Lutador\"]',1,57,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/056.png','Extremely quick to anger. It could be docile one moment then thrashing away the next instant.',56),
(57,'Primeape',32.0,1.0,'Vital-spirit','[\"Voador\",\"Psiquico\",\"Fada\"]','[\"Lutador\"]',1,NULL,56,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/057.png','Always furious and tenacious to boot. It will not abandon chasing its quarry until it is caught.',57),
(58,'Growlithe',19.0,0.7,'Intimidate','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,59,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/058.png','Very protective of its territory. It will bark and bite to repel intruders from its space.',58),
(59,'Arcanine',155.0,1.9,'Intimidate','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,NULL,58,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/059.png','A POKéMON that has been admired since the past for its beauty. It runs agilely as if on wings.',59),
(60,'Poliwag',12.4,0.6,'Water-absorb','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,61,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/060.png','Its newly grown legs prevent it from running. It appears to prefer swimming than trying to stand.',60),
(61,'Poliwhirl',20.0,1.0,'Water-absorb','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,62,60,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/061.png','Capable of living in or out of water. When out of water, it sweats to keep its body slimy.',61),
(62,'Poliwrath',54.0,1.3,'Water-absorb','[\"Voador\",\"Grama\",\"Eletrico\",\"Psiquico\",\"Fada\"]','[\"Agua\",\"Lutador\"]',1,NULL,61,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/062.png','An adept swimmer at both the front crawl and breast stroke. Easily overtakes the best human swimmers.',62),
(63,'Abra',19.5,0.9,'Synchronize','[\"Fantasma\",\"Inseto\",\"Sombrio\"]','[\"Psiquico\"]',1,64,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/063.png','Using its ability to read minds, it will identify impending danger and TELEPORT to safety.',63),
(64,'Kadabra',56.5,1.3,'Synchronize','[\"Fantasma\",\"Inseto\",\"Sombrio\"]','[\"Psiquico\"]',1,65,63,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/064.png','It emits special alpha waves from its body that induce headaches just by being close by.',64),
(65,'Alakazam',48.0,1.5,'Synchronize','[\"Fantasma\",\"Inseto\",\"Sombrio\"]','[\"Psiquico\"]',1,NULL,64,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/065.png','Its brain can out­ perform a super­ computer. Its intelligence quotient is said to be 5,000.',65),
(66,'Machop',19.5,0.8,'Guts','[\"Voador\",\"Psiquico\",\"Fada\"]','[\"Lutador\"]',1,67,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/066.png','Loves to build its muscles. It trains in all styles of martial arts to become even stronger.',66),
(67,'Machoke',70.5,1.5,'Guts','[\"Voador\",\"Psiquico\",\"Fada\"]','[\"Lutador\"]',1,68,66,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/067.png','Its muscular body is so powerful, it must wear a power save belt to be able to regulate its motions.',67),
(68,'Machamp',130.0,1.6,'Guts','[\"Voador\",\"Psiquico\",\"Fada\"]','[\"Lutador\"]',1,NULL,67,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/068.png','Using its heavy muscles, it throws powerful punches that can send the victim clear over the horizon.',68),
(69,'Bellsprout',4.0,0.7,'Chlorophyll','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',1,70,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/069.png','A carnivorous POKéMON that traps and eats bugs. It uses its root feet to soak up needed moisture.',69),
(70,'Weepinbell',6.4,1.0,'Chlorophyll','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',1,71,69,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/070.png','It spits out POISONPOWDER to immobilize the enemy and then finishes it with a spray of ACID.',70),
(71,'Victreebel',15.5,1.7,'Chlorophyll','[\"Inseto\",\"Psiquico\",\"Voador\",\"Venenoso\",\"Gelo\",\"Terra\",\"Fogo\"]','[\"Grama\",\"Venenoso\"]',1,NULL,70,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/071.png','Said to live in huge colonies deep in jungles, although no one has ever returned from there.',71),
(72,'Tentacool',45.5,0.9,'Clear-body','[\"Terra\",\"Grama\",\"Eletrico\",\"Psiquico\"]','[\"Agua\",\"Venenoso\"]',1,73,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/072.png','Drifts in shallow seas. Anglers who hook them by accident are often punished by its stinging acid.',72),
(73,'Tentacruel',55.0,1.6,'Clear-body','[\"Terra\",\"Grama\",\"Eletrico\",\"Psiquico\"]','[\"Agua\",\"Venenoso\"]',1,NULL,72,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/073.png','The tentacles are normally kept short. On hunts, they are extended to ensnare and immobilize prey.',73),
(74,'Geodude',20.0,0.4,'Rock-head','[\"Aco\",\"Grama\",\"Agua\",\"Lutador\",\"Gelo\",\"Terra\"]','[\"Pedra\",\"Terra\"]',1,75,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/074.png','Found in fields and mountains. Mistaking them for boulders, people often step or trip on them.',74),
(75,'Graveler',105.0,1.0,'Rock-head','[\"Aco\",\"Grama\",\"Agua\",\"Lutador\",\"Gelo\",\"Terra\"]','[\"Pedra\",\"Terra\"]',1,76,74,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/075.png','Rolls down slopes to move. It rolls over any obstacle without slowing or changing its direction.',75),
(76,'Golem',300.0,1.4,'Rock-head','[\"Aco\",\"Grama\",\"Agua\",\"Lutador\",\"Gelo\",\"Terra\"]','[\"Pedra\",\"Terra\"]',1,NULL,75,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/076.png','Its boulder-like body is extremely hard. It can easily withstand dynamite blasts without damage.',76),
(77,'Ponyta',30.0,1.0,'Run-away','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,78,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/077.png','Its hooves are 10 times harder than diamonds. It can trample anything completely flat in little time.',77),
(78,'Rapidash',95.0,1.7,'Run-away','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,NULL,77,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/078.png','Very competitive, this POKéMON will chase anything that moves fast in the hopes of racing it.',78),
(79,'Slowpoke',36.0,1.2,'Oblivious','[\"Inseto\",\"Sombrio\",\"Grama\",\"Eletrico\",\"Fantasma\"]','[\"Agua\",\"Psiquico\"]',1,80,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/079.png','Incredibly slow and dopey. It takes 5 seconds for it to feel pain when under attack.',79),
(80,'Slowbro',78.5,1.6,'Oblivious','[\"Inseto\",\"Sombrio\",\"Grama\",\"Eletrico\",\"Fantasma\"]','[\"Agua\",\"Psiquico\"]',1,NULL,79,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/080.png','The SHELLDER that is latched onto SLOWPOKE\'s tail is said to feed on the host\'s left over scraps.',80),
(81,'Magnemite',6.0,0.3,'Magnet-pull','[\"Terra\",\"Fogo\",\"Lutador\"]','[\"Eletrico\",\"Aco\"]',1,82,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/081.png','Uses anti-gravity to stay suspended. Appears without warning and uses THUNDER WAVE and similar moves.',81),
(82,'Magneton',60.0,1.0,'Magnet-pull','[\"Terra\",\"Fogo\",\"Lutador\"]','[\"Eletrico\",\"Aco\"]',1,NULL,81,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/082.png','Formed by several MAGNEMITEs linked together. They frequently appear when sunspots flare up.',82),
(83,'Farfetchd',15.0,0.8,'Keen-eye','[\"Pedra\",\"Gelo\",\"Lutador\",\"Eletrico\"]','[\"Normal\",\"Voador\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/083.png','The sprig of green onions it holds is its weapon. It is used much like a metal sword.',83),
(84,'Doduo',39.2,1.4,'Run-away','[\"Pedra\",\"Gelo\",\"Lutador\",\"Eletrico\"]','[\"Normal\",\"Voador\"]',1,85,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/084.png','A bird that makes up for its poor flying with its fast foot speed. Leaves giant footprints.',84),
(85,'Dodrio',85.2,1.8,'Run-away','[\"Pedra\",\"Gelo\",\"Lutador\",\"Eletrico\"]','[\"Normal\",\"Voador\"]',1,NULL,84,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/085.png','Uses its three brains to execute complex plans. While two heads sleep, one head stays awake.',85),
(86,'Seel',90.0,1.1,'Thick-fat','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,87,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/086.png','The protruding horn on its head is very hard. It is used for bashing through thick ice.',86),
(87,'Dewgong',120.0,1.7,'Thick-fat','[\"Aco\",\"Pedra\",\"Grama\",\"Eletrico\",\"Lutador\",\"Fogo\"]','[\"Agua\",\"Gelo\"]',1,NULL,86,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/087.png','Stores thermal energy in its body. Swims at a steady 8 knots even in intensely cold waters.',87),
(88,'Grimer',30.0,0.9,'Stench','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,89,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/088.png','Appears in filthy areas. Thrives by sucking up polluted sludge that is pumped out of factories.',88),
(89,'Muk',30.0,1.2,'Stench','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,NULL,88,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/089.png','Thickly covered with a filthy, vile sludge. It is so toxic, even its footprints contain poison.',89),
(90,'Shellder',4.0,0.3,'Shell-armor','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,91,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/090.png','Its hard shell repels any kind of attack. It is vulnerable only when its shell is open.',90),
(91,'Cloyster',132.5,1.5,'Shell-armor','[\"Aco\",\"Pedra\",\"Grama\",\"Eletrico\",\"Lutador\",\"Fogo\"]','[\"Agua\",\"Gelo\"]',1,NULL,90,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/091.png','When attacked, it launches its horns in quick volleys. Its innards have never been seen.',91),
(92,'Gastly',0.1,1.3,'Levitate','[\"Terra\",\"Fantasma\",\"Sombrio\",\"Psiquico\"]','[\"Fantasma\",\"Venenoso\"]',1,93,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/092.png','Almost invisible, this gaseous POKéMON cloaks the target and puts it to sleep without notice.',92),
(93,'Haunter',0.1,1.6,'Levitate','[\"Terra\",\"Fantasma\",\"Sombrio\",\"Psiquico\"]','[\"Fantasma\",\"Venenoso\"]',1,94,92,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/093.png','Because of its ability to slip through block walls, it is said to be from an­ other dimension.',93),
(94,'Gengar',40.5,1.5,'Cursed-body','[\"Terra\",\"Fantasma\",\"Sombrio\",\"Psiquico\"]','[\"Fantasma\",\"Venenoso\"]',1,NULL,93,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/094.png','Under a full moon, this POKéMON likes to mimic the shadows of people and laugh at their fright.',94),
(95,'Onix',210.0,8.8,'Rock-head','[\"Aco\",\"Grama\",\"Agua\",\"Lutador\",\"Gelo\",\"Terra\"]','[\"Pedra\",\"Terra\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/095.png','As it grows, the stone portions of its body harden to become similar to a diamond, but colored black.',95),
(96,'Drowzee',32.4,1.0,'Insomnia','[\"Fantasma\",\"Inseto\",\"Sombrio\"]','[\"Psiquico\"]',1,97,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/096.png','Puts enemies to sleep then eats their dreams. Occasionally gets sick from eating bad dreams.',96),
(97,'Hypno',75.6,1.6,'Insomnia','[\"Fantasma\",\"Inseto\",\"Sombrio\"]','[\"Psiquico\"]',1,NULL,96,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/097.png','When it locks eyes with an enemy, it will use a mix of PSI moves such as HYPNOSIS and CONFUSION.',97),
(98,'Krabby',6.5,0.4,'Hyper-cutter','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,99,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/098.png','Its pincers are not only powerful weapons, they are used for balance when walking sideways.',98),
(99,'Kingler',60.0,1.3,'Hyper-cutter','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,NULL,98,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/099.png','The large pincer has 10000 hp of crushing power. However, its huge size makes it unwieldy to use.',99),
(100,'Voltorb',10.4,0.5,'Soundproof','[\"Terra\"]','[\"Eletrico\"]',1,101,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/100.png','Usually found in power plants. Easily mistaken for a POKé BALL, they have zapped many people.',100),
(101,'Electrode',66.6,1.2,'Soundproof','[\"Terra\"]','[\"Eletrico\"]',1,NULL,100,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/101.png','It stores electric energy under very high pressure. It often explodes with little or no provocation.',101),
(102,'Exeggcute',2.5,0.4,'Chlorophyll','[\"Inseto\",\"Voador\",\"Sombrio\",\"Venenoso\",\"Gelo\",\"Fantasma\",\"Fogo\"]','[\"Grama\",\"Psiquico\"]',1,103,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/102.png','Often mistaken for eggs. When disturbed, they quickly gather and attack in swarms.',102),
(103,'Exeggutor',120.0,2.0,'Chlorophyll','[\"Inseto\",\"Voador\",\"Sombrio\",\"Venenoso\",\"Gelo\",\"Fantasma\",\"Fogo\"]','[\"Grama\",\"Psiquico\"]',1,NULL,102,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/103.png','Legend has it that on rare occasions, one of its heads will drop off and continue on as an EXEGGCUTE.',103),
(104,'Cubone',6.5,0.4,'Rock-head','[\"Agua\",\"Grama\",\"Gelo\"]','[\"Terra\"]',1,105,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/104.png','Because it never removes its skull helmet, no one has ever seen this POKéMON\'s real face.',104),
(105,'Marowak',45.0,1.0,'Rock-head','[\"Agua\",\"Grama\",\"Gelo\"]','[\"Terra\"]',1,NULL,104,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/105.png','The bone it holds is its key weapon. It throws the bone skillfully like a boomerang to KO targets.',105),
(106,'Hitmonlee',49.8,1.5,'Limber','[\"Voador\",\"Psiquico\",\"Fada\"]','[\"Lutador\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/106.png','When in a hurry, its legs lengthen progressively. It runs smoothly with extra long, loping strides.',106),
(107,'Hitmonchan',50.2,1.4,'Keen-eye','[\"Voador\",\"Psiquico\",\"Fada\"]','[\"Lutador\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/107.png','While apparently doing nothing, it fires punches in lightning fast volleys that are impossible to see.',107),
(108,'Lickitung',65.5,1.2,'Own-tempo','[\"Lutador\"]','[\"Normal\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/108.png','Its tongue can be extended like a chameleon\'s. It leaves a tingling sensation when it licks enemies.',108),
(109,'Koffing',1.0,0.6,'Levitate','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,110,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/109.png','Because it stores several kinds of toxic gases in its body, it is prone to exploding without warning.',109),
(110,'Weezing',9.5,1.2,'Levitate','[\"Terra\",\"Psiquico\"]','[\"Venenoso\"]',1,NULL,109,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/110.png','Where two kinds of poison gases meet, 2 KOFFINGs can fuse into a WEEZING over many years.',110),
(111,'Rhyhorn',115.0,1.0,'Lightning-rod','[\"Aco\",\"Grama\",\"Agua\",\"Lutador\",\"Gelo\",\"Terra\"]','[\"Terra\",\"Pedra\"]',1,112,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/111.png','A POKéMON with a one-track mind. Once it charges,  it won\'t stop running until it falls asleep.',111),
(112,'Rhydon',120.0,1.9,'Lightning-rod','[\"Aco\",\"Grama\",\"Agua\",\"Lutador\",\"Gelo\",\"Terra\"]','[\"Terra\",\"Pedra\"]',1,NULL,111,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/112.png','Protected by an armor-like hide, it is capable of living in molten lava of 3,600 degrees.',112),
(113,'Chansey',34.6,1.1,'Natural-cure','[\"Lutador\"]','[\"Normal\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/113.png','A rare and elusive POKéMON that is said to bring happiness to those who manage to get it.',113),
(114,'Tangela',35.0,1.0,'Chlorophyll','[\"Inseto\",\"Voador\",\"Venenoso\",\"Gelo\",\"Fogo\"]','[\"Grama\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/114.png','The whole body is swathed with wide vines that are similar to sea­ weed. Its vines shake as it walks.',114),
(115,'Kangaskhan',80.0,2.2,'Early-bird','[\"Lutador\"]','[\"Normal\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/115.png','The infant rarely ventures out of its mother\'s protective pouch until it is 3 years old.',115),
(116,'Horsea',8.0,0.4,'Swift-swim','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,117,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/116.png','Known to shoot down flying bugs with precision blasts of ink from the surface of the water.',116),
(117,'Seadra',25.0,1.2,'Poison-point','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,NULL,116,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/117.png','Capable of swim­ ming backwards by rapidly flapping its wing-like pectoral fins and stout tail.',117),
(118,'Goldeen',15.0,0.6,'Swift-swim','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,119,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/118.png','Its tail fin billows like an elegant ballroom dress, giving it the nickname of the Water Queen.',118),
(119,'Seaking',39.0,1.3,'Swift-swim','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,NULL,118,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/119.png','In the autumn spawning season, they can be seen swimming powerfully up rivers and creeks.',119),
(120,'Staryu',34.5,0.8,'Illuminate','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,121,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/120.png','If its body is torn, it can grow back if the red core remains. The core flashes at midnight.',120),
(121,'Starmie',80.0,1.1,'Illuminate','[\"Inseto\",\"Sombrio\",\"Grama\",\"Eletrico\",\"Fantasma\"]','[\"Agua\",\"Psiquico\"]',1,NULL,120,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/121.png','Its central core glows with the seven colors of the rainbow. Some people value the core as a gem.',121),
(122,'Mr-mime',54.5,1.3,'Soundproof','[\"Inseto\",\"Aco\",\"Sombrio\",\"Venenoso\",\"Fantasma\"]','[\"Psiquico\",\"Fada\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/122.png','If interrupted while it is miming, it will slap around the offender with its broad hands.',122),
(123,'Scyther',56.0,1.5,'Swarm','[\"Voador\",\"Pedra\",\"Eletrico\",\"Gelo\",\"Fogo\"]','[\"Inseto\",\"Voador\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/123.png','With ninja-like agility and speed, it can create the illusion that there is more than one.',123),
(124,'Jynx',40.6,1.4,'Oblivious','[\"Inseto\",\"Aco\",\"Pedra\",\"Sombrio\",\"Lutador\",\"Fantasma\",\"Fogo\"]','[\"Gelo\",\"Psiquico\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/124.png','It seductively wiggles its hips as it walks. It can cause people to dance in unison with it.',124),
(125,'Electabuzz',30.0,1.1,'Static','[\"Terra\"]','[\"Eletrico\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/125.png','Normally found near power plants, they can wander away and cause major blackouts in cities.',125),
(126,'Magmar',44.5,1.3,'Flame-body','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/126.png','Its body always burns with an orange glow that enables it to hide perfectly among flames.',126),
(127,'Pinsir',55.0,1.5,'Hyper-cutter','[\"Voador\",\"Fogo\",\"Pedra\"]','[\"Inseto\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/127.png','If it fails to crush the victim in its pincers, it will swing it around and toss it hard.',127),
(128,'Tauros',88.4,1.4,'Intimidate','[\"Lutador\"]','[\"Normal\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/128.png','When it targets an enemy, it charges furiously while whipping its body with its long tails.',128),
(129,'Magikarp',10.0,0.9,'Swift-swim','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,130,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/129.png','In the distant past, it was somewhat stronger than the horribly weak descendants that exist today.',129),
(130,'Gyarados',235.0,6.5,'Intimidate','[\"Gelo\",\"Pedra\",\"Grama\",\"Eletrico\"]','[\"Agua\",\"Voador\"]',1,NULL,129,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/130.png','Once it begins to rampage, a GYARADOS will burn everything down, even in a harsh storm.',130),
(131,'Lapras',220.0,2.5,'Water-absorb','[\"Aco\",\"Pedra\",\"Grama\",\"Eletrico\",\"Lutador\",\"Fogo\"]','[\"Agua\",\"Gelo\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/131.png','A POKéMON that has been over­ hunted almost to extinction. It can ferry people across the water.',131),
(132,'Ditto',4.0,0.3,'Limber','[\"Lutador\"]','[\"Normal\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/132.png','Capable of copying an enemy\'s genetic code to instantly transform itself into a duplicate of the enemy.',132),
(133,'Eevee',6.5,0.3,'Run-away','[\"Lutador\"]','[\"Normal\"]',1,134,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/133.png','Its genetic code is irregular. It may mutate if it is exposed to radiation from element STONEs.',133),
(134,'Vaporeon',29.0,1.0,'Water-absorb','[\"Grama\",\"Eletrico\"]','[\"Agua\"]',1,NULL,133,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/134.png','Lives close to water. Its long tail is ridged with a fin which is often mistaken for a mermaid\'s.',134),
(135,'Jolteon',24.5,0.8,'Volt-absorb','[\"Terra\"]','[\"Eletrico\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/135.png','It accumulates negative ions in the atmosphere to blast out 10000- volt lightning bolts.',135),
(136,'Flareon',25.0,0.9,'Flash-fire','[\"Terra\",\"Agua\",\"Pedra\"]','[\"Fogo\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/136.png','When storing thermal energy in its body, its temperature could soar to over 1600 degrees.',136),
(137,'Porygon',36.5,0.8,'Trace','[\"Lutador\"]','[\"Normal\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/137.png','A POKéMON that consists entirely of programming code. Capable of moving freely in cyberspace.',137),
(138,'Omanyte',7.5,0.4,'Swift-swim','[\"Aco\",\"Grama\",\"Eletrico\",\"Agua\",\"Lutador\",\"Terra\"]','[\"Pedra\",\"Agua\"]',1,139,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/138.png','Although long extinct, in rare cases, it can be genetically resurrected from fossils.',138),
(139,'Omastar',35.0,1.0,'Swift-swim','[\"Aco\",\"Grama\",\"Eletrico\",\"Agua\",\"Lutador\",\"Terra\"]','[\"Pedra\",\"Agua\"]',1,NULL,138,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/139.png','A prehistoric POKéMON that died out when its heavy shell made it impossible to catch prey.',139),
(140,'Kabuto',11.5,0.5,'Swift-swim','[\"Aco\",\"Grama\",\"Eletrico\",\"Agua\",\"Lutador\",\"Terra\"]','[\"Pedra\",\"Agua\"]',1,141,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/140.png','A POKéMON that was resurrected from a fossil found in what was once the ocean floor eons ago.',140),
(141,'Kabutops',40.5,1.3,'Swift-swim','[\"Aco\",\"Grama\",\"Eletrico\",\"Agua\",\"Lutador\",\"Terra\"]','[\"Pedra\",\"Agua\"]',1,NULL,140,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/141.png','Its sleek shape is perfect for swim­ ming. It slashes prey with its claws and drains the body fluids.',141),
(142,'Aerodactyl',59.0,1.8,'Rock-head','[\"Aco\",\"Pedra\",\"Grama\",\"Eletrico\",\"Agua\",\"Lutador\",\"Gelo\",\"Terra\"]','[\"Pedra\",\"Voador\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/142.png','A Pokémon that roamed the skies in the dinosaur era. Its teeth are like saw blades.',142),
(143,'Snorlax',460.0,2.1,'Immunity','[\"Lutador\"]','[\"Normal\"]',1,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/143.png','Very lazy. Just eats and sleeps. As its rotund bulk builds, it becomes steadily more slothful.',143),
(144,'Articuno',55.4,1.7,'Pressure','[\"Aco\",\"Pedra\",\"Eletrico\",\"Lutador\",\"Gelo\",\"Fogo\"]','[\"Gelo\",\"Voador\"]',4,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/144.png','A legendary bird POKéMON that is said to appear to doomed people who are lost in icy mountains.',144),
(145,'Zapdos',52.6,1.6,'Pressure','[\"Terra\",\"Gelo\",\"Pedra\",\"Eletrico\"]','[\"Eletrico\",\"Voador\"]',4,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/145.png','A legendary bird POKéMON that is said to appear from clouds while dropping enormous lightning bolts.',145),
(146,'Moltres',60.0,2.0,'Pressure','[\"Pedra\",\"Eletrico\",\"Agua\",\"Gelo\",\"Terra\"]','[\"Fogo\",\"Voador\"]',4,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/146.png','Known as the legendary bird of fire. Every flap of its wings creates a dazzling flash of flames.',146),
(147,'Dratini',3.3,1.8,'Shed-skin','[\"Fada\",\"Gelo\",\"Dragao\"]','[\"Dragao\"]',1,148,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/147.png','Long considered a mythical POKéMON until recently when a small colony was found living underwater.',147),
(148,'Dragonair',16.5,4.0,'Shed-skin','[\"Fada\",\"Gelo\",\"Dragao\"]','[\"Dragao\"]',1,149,147,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/148.png','A mystical POKéMON that exudes a gentle aura. Has the ability to change climate conditions.',148),
(149,'Dragonite',210.0,2.2,'Inner-focus','[\"Pedra\",\"Eletrico\",\"Dragao\",\"Gelo\",\"Fada\"]','[\"Dragao\",\"Voador\"]',1,NULL,148,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/149.png','An extremely rarely seen marine POKéMON. Its intelligence is said to match that of humans.',149),
(150,'Mewtwo',122.0,2.0,'Pressure','[\"Fantasma\",\"Inseto\",\"Sombrio\"]','[\"Psiquico\"]',4,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/150.png','It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.',150),
(151,'Mew',4.0,0.4,'Synchronize','[\"Fantasma\",\"Inseto\",\"Sombrio\"]','[\"Psiquico\"]',3,NULL,NULL,'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/151.png','So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide.',151);
/*!40000 ALTER TABLE `pokemons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinadores`
--

DROP TABLE IF EXISTS `treinadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treinadores` (
  `id` varchar(36) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(40) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `treinadores_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinadores`
--

LOCK TABLES `treinadores` WRITE;
/*!40000 ALTER TABLE `treinadores` DISABLE KEYS */;
INSERT INTO `treinadores` VALUES
('79fa10d6-58ad-485e-a6b3-d420e533b982','Pedro Santos','ped@gmail.com','$2b$12$UFy6TyhR99i6B1SeT1QaO./2xO7QnKm6KRmQc4ieDHmgGM8Mszo4K','2024-10-11 07:03:07.278','2024-10-12 07:37:17.649',934234),
('e74bded7-5c2b-443b-881d-c90b5a21293f','Ana Maria Santos','ana@gmail.com','$2b$12$cVX4jhMH94flqCOk.gc4SuZ30C5jF6Al1dJsl8X0YAJf.yd4aeGoy','2024-10-11 07:02:09.413','2024-10-11 07:02:09.413',NULL);
/*!40000 ALTER TABLE `treinadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-10-12  4:40:16
