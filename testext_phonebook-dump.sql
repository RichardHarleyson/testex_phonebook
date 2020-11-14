-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: testex_phonebook
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `country_name` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `phonecode` int(5) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AF','Afghanistan','AFG',93),(2,'AX','Aland Islands','ALA',358),(3,'AL','Albania','ALB',355),(4,'DZ','Algeria','DZA',213),(5,'AS','American Samoa','ASM',1684),(6,'AD','Andorra','AND',376),(7,'AO','Angola','AGO',244),(8,'AI','Anguilla','AIA',1264),(9,'AQ','Antarctica','ATA',0),(10,'AG','Antigua and Barbuda','ATG',1268),(11,'AR','Argentina','ARG',54),(12,'AM','Armenia','ARM',374),(13,'AW','Aruba','ABW',297),(14,'AU','Australia','AUS',61),(15,'AT','Austria','AUT',43),(16,'AZ','Azerbaijan','AZE',994),(17,'BS','Bahamas','BHS',1242),(18,'BH','Bahrain','BHR',973),(19,'BD','Bangladesh','BGD',880),(20,'BB','Barbados','BRB',1246),(21,'BY','Belarus','BLR',375),(22,'BE','Belgium','BEL',32),(23,'BZ','Belize','BLZ',501),(24,'BJ','Benin','BEN',229),(25,'BM','Bermuda','BMU',1441),(26,'BT','Bhutan','BTN',975),(27,'BO','Bolivia','BOL',591),(28,'BQ','Bonaire, Sint Eustatius and Saba','BES',599),(29,'BA','Bosnia and Herzegovina','BIH',387),(30,'BW','Botswana','BWA',267),(31,'BV','Bouvet Island','BVT',0),(32,'BR','Brazil','BRA',55),(33,'IO','British Indian Ocean Territory','IOT',246),(34,'BN','Brunei Darussalam','BRN',673),(35,'BG','Bulgaria','BGR',359),(36,'BF','Burkina Faso','BFA',226),(37,'BI','Burundi','BDI',257),(38,'KH','Cambodia','KHM',855),(39,'CM','Cameroon','CMR',237),(40,'CA','Canada','CAN',1),(41,'CV','Cape Verde','CPV',238),(42,'KY','Cayman Islands','CYM',1345),(43,'CF','Central African Republic','CAF',236),(44,'TD','Chad','TCD',235),(45,'CL','Chile','CHL',56),(46,'CN','China','CHN',86),(47,'CX','Christmas Island','CXR',61),(48,'CC','Cocos (Keeling) Islands','CCK',672),(49,'CO','Colombia','COL',57),(50,'KM','Comoros','COM',269),(51,'CG','Congo','COG',242),(52,'CD','Congo, the Democratic Republic of the','COD',242),(53,'CK','Cook Islands','COK',682),(54,'CR','Costa Rica','CRI',506),(55,'CI','Cote D\'Ivoire','CIV',225),(56,'HR','Croatia','HRV',385),(57,'CU','Cuba','CUB',53),(58,'CW','Curacao','CUW',599),(59,'CY','Cyprus','CYP',357),(60,'CZ','Czech Republic','CZE',420),(61,'DK','Denmark','DNK',45),(62,'DJ','Djibouti','DJI',253),(63,'DM','Dominica','DMA',1767),(64,'DO','Dominican Republic','DOM',1809),(65,'EC','Ecuador','ECU',593),(66,'EG','Egypt','EGY',20),(67,'SV','El Salvador','SLV',503),(68,'GQ','Equatorial Guinea','GNQ',240),(69,'ER','Eritrea','ERI',291),(70,'EE','Estonia','EST',372),(71,'ET','Ethiopia','ETH',251),(72,'FK','Falkland Islands (Malvinas)','FLK',500),(73,'FO','Faroe Islands','FRO',298),(74,'FJ','Fiji','FJI',679),(75,'FI','Finland','FIN',358),(76,'FR','France','FRA',33),(77,'GF','French Guiana','GUF',594),(78,'PF','French Polynesia','PYF',689),(79,'TF','French Southern Territories','ATF',0),(80,'GA','Gabon','GAB',241),(81,'GM','Gambia','GMB',220),(82,'GE','Georgia','GEO',995),(83,'DE','Germany','DEU',49),(84,'GH','Ghana','GHA',233),(85,'GI','Gibraltar','GIB',350),(86,'GR','Greece','GRC',30),(87,'GL','Greenland','GRL',299),(88,'GD','Grenada','GRD',1473),(89,'GP','Guadeloupe','GLP',590),(90,'GU','Guam','GUM',1671),(91,'GT','Guatemala','GTM',502),(92,'GG','Guernsey','GGY',44),(93,'GN','Guinea','GIN',224),(94,'GW','Guinea-Bissau','GNB',245),(95,'GY','Guyana','GUY',592),(96,'HT','Haiti','HTI',509),(97,'HM','Heard Island and Mcdonald Islands','HMD',0),(98,'VA','Holy See (Vatican City State)','VAT',39),(99,'HN','Honduras','HND',504),(100,'HK','Hong Kong','HKG',852),(101,'HU','Hungary','HUN',36),(102,'IS','Iceland','ISL',354),(103,'IN','India','IND',91),(104,'ID','Indonesia','IDN',62),(105,'IR','Iran, Islamic Republic of','IRN',98),(106,'IQ','Iraq','IRQ',964),(107,'IE','Ireland','IRL',353),(108,'IM','Isle of Man','IMN',44),(109,'IL','Israel','ISR',972),(110,'IT','Italy','ITA',39),(111,'JM','Jamaica','JAM',1876),(112,'JP','Japan','JPN',81),(113,'JE','Jersey','JEY',44),(114,'JO','Jordan','JOR',962),(115,'KZ','Kazakhstan','KAZ',7),(116,'KE','Kenya','KEN',254),(117,'KI','Kiribati','KIR',686),(118,'KP','Korea, Democratic People\"s Republic of','PRK',850),(119,'KR','Korea, Republic of','KOR',82),(120,'XK','Kosovo','XKX',381),(121,'KW','Kuwait','KWT',965),(122,'KG','Kyrgyzstan','KGZ',996),(123,'LA','Lao People\'s Democratic Republic','LAO',856),(124,'LV','Latvia','LVA',371),(125,'LB','Lebanon','LBN',961),(126,'LS','Lesotho','LSO',266),(127,'LR','Liberia','LBR',231),(128,'LY','Libyan Arab Jamahiriya','LBY',218),(129,'LI','Liechtenstein','LIE',423),(130,'LT','Lithuania','LTU',370),(131,'LU','Luxembourg','LUX',352),(132,'MO','Macao','MAC',853),(133,'MK','Macedonia, the Former Yugoslav Republic of','MKD',389),(134,'MG','Madagascar','MDG',261),(135,'MW','Malawi','MWI',265),(136,'MY','Malaysia','MYS',60),(137,'MV','Maldives','MDV',960),(138,'ML','Mali','MLI',223),(139,'MT','Malta','MLT',356),(140,'MH','Marshall Islands','MHL',692),(141,'MQ','Martinique','MTQ',596),(142,'MR','Mauritania','MRT',222),(143,'MU','Mauritius','MUS',230),(144,'YT','Mayotte','MYT',269),(145,'MX','Mexico','MEX',52),(146,'FM','Micronesia, Federated States of','FSM',691),(147,'MD','Moldova, Republic of','MDA',373),(148,'MC','Monaco','MCO',377),(149,'MN','Mongolia','MNG',976),(150,'ME','Montenegro','MNE',382),(151,'MS','Montserrat','MSR',1664),(152,'MA','Morocco','MAR',212),(153,'MZ','Mozambique','MOZ',258),(154,'MM','Myanmar','MMR',95),(155,'NA','Namibia','NAM',264),(156,'NR','Nauru','NRU',674),(157,'NP','Nepal','NPL',977),(158,'NL','Netherlands','NLD',31),(159,'AN','Netherlands Antilles','ANT',599),(160,'NC','New Caledonia','NCL',687),(161,'NZ','New Zealand','NZL',64),(162,'NI','Nicaragua','NIC',505),(163,'NE','Niger','NER',227),(164,'NG','Nigeria','NGA',234),(165,'NU','Niue','NIU',683),(166,'NF','Norfolk Island','NFK',672),(167,'MP','Northern Mariana Islands','MNP',1670),(168,'NO','Norway','NOR',47),(169,'OM','Oman','OMN',968),(170,'PK','Pakistan','PAK',92),(171,'PW','Palau','PLW',680),(172,'PS','Palestinian Territory, Occupied','PSE',970),(173,'PA','Panama','PAN',507),(174,'PG','Papua New Guinea','PNG',675),(175,'PY','Paraguay','PRY',595),(176,'PE','Peru','PER',51),(177,'PH','Philippines','PHL',63),(178,'PN','Pitcairn','PCN',0),(179,'PL','Poland','POL',48),(180,'PT','Portugal','PRT',351),(181,'PR','Puerto Rico','PRI',1787),(182,'QA','Qatar','QAT',974),(183,'RE','Reunion','REU',262),(184,'RO','Romania','ROM',40),(185,'RU','Russian Federation','RUS',70),(186,'RW','Rwanda','RWA',250),(187,'BL','Saint Barthelemy','BLM',590),(188,'SH','Saint Helena','SHN',290),(189,'KN','Saint Kitts and Nevis','KNA',1869),(190,'LC','Saint Lucia','LCA',1758),(191,'MF','Saint Martin','MAF',590),(192,'PM','Saint Pierre and Miquelon','SPM',508),(193,'VC','Saint Vincent and the Grenadines','VCT',1784),(194,'WS','Samoa','WSM',684),(195,'SM','San Marino','SMR',378),(196,'ST','Sao Tome and Principe','STP',239),(197,'SA','Saudi Arabia','SAU',966),(198,'SN','Senegal','SEN',221),(199,'RS','Serbia','SRB',381),(200,'CS','Serbia and Montenegro','SCG',381),(201,'SC','Seychelles','SYC',248),(202,'SL','Sierra Leone','SLE',232),(203,'SG','Singapore','SGP',65),(204,'SX','Sint Maarten','SXM',1),(205,'SK','Slovakia','SVK',421),(206,'SI','Slovenia','SVN',386),(207,'SB','Solomon Islands','SLB',677),(208,'SO','Somalia','SOM',252),(209,'ZA','South Africa','ZAF',27),(210,'GS','South Georgia and the South Sandwich Islands','SGS',0),(211,'SS','South Sudan','SSD',211),(212,'ES','Spain','ESP',34),(213,'LK','Sri Lanka','LKA',94),(214,'SD','Sudan','SDN',249),(215,'SR','Suriname','SUR',597),(216,'SJ','Svalbard and Jan Mayen','SJM',47),(217,'SZ','Swaziland','SWZ',268),(218,'SE','Sweden','SWE',46),(219,'CH','Switzerland','CHE',41),(220,'SY','Syrian Arab Republic','SYR',963),(221,'TW','Taiwan, Province of China','TWN',886),(222,'TJ','Tajikistan','TJK',992),(223,'TZ','Tanzania, United Republic of','TZA',255),(224,'TH','Thailand','THA',66),(225,'TL','Timor-Leste','TLS',670),(226,'TG','Togo','TGO',228),(227,'TK','Tokelau','TKL',690),(228,'TO','Tonga','TON',676),(229,'TT','Trinidad and Tobago','TTO',1868),(230,'TN','Tunisia','TUN',216),(231,'TR','Turkey','TUR',90),(232,'TM','Turkmenistan','TKM',7370),(233,'TC','Turks and Caicos Islands','TCA',1649),(234,'TV','Tuvalu','TUV',688),(235,'UG','Uganda','UGA',256),(236,'UA','Ukraine','UKR',380),(237,'AE','United Arab Emirates','ARE',971),(238,'GB','United Kingdom','GBR',44),(239,'US','United States','USA',1),(240,'UM','United States Minor Outlying Islands','UMI',1),(241,'UY','Uruguay','URY',598),(242,'UZ','Uzbekistan','UZB',998),(243,'VU','Vanuatu','VUT',678),(244,'VE','Venezuela','VEN',58),(245,'VN','Viet Nam','VNM',84),(246,'VG','Virgin Islands, British','VGB',1284),(247,'VI','Virgin Islands, U.s.','VIR',1340),(248,'WF','Wallis and Futuna','WLF',681),(249,'EH','Western Sahara','ESH',212),(250,'YE','Yemen','YEM',967),(251,'ZM','Zambia','ZMB',260),(252,'ZW','Zimbabwe','ZWE',263);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `public` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `uid` (`uid`),
  CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (6,'email@gmail.com',13,1),(7,'email2@gmail.com',13,0),(8,'walter.white@gmail.com',14,1),(9,'walter@gmail.com',14,0),(10,'some@gmail.com',15,1),(11,'ddd@gmail.com',16,1);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_numbers`
--

DROP TABLE IF EXISTS `phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pnum` varchar(20) NOT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `phone_numbers_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` VALUES (1,'+1234567890',0,13),(2,'+1234567890',1,13),(3,'09876554321',1,14),(4,'09876543212',1,14),(5,'222',1,14),(6,'+123443224',1,15),(7,'+42324235',1,15),(8,'+123443224',1,15),(9,'+42324235',0,15),(10,'1111',1,16),(11,'+2323232223',1,16);
/*!40000 ALTER TABLE `phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `sname` varchar(50) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `ustate` tinyint(1) DEFAULT '1',
  `public` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (13,'Larry','$2y$10$81aJH4ujEBnc1NBmZHGUee52EtB6kWxGWLxr7E3wGIfSn4wbpO9li','Larry','Brown','Mountain Plains, 58','2324','China',1,1),(14,'Walter','$2y$10$Lk3inEXEs9sv.2wXZQulZeGNMfuxXI43ndXZ71nrH5EJI7qIuwP0m','Walter','White','Albuquerque ,44','10023','Mexico',1,1),(15,'Jessie','$2y$10$A7cTxZq5rzPBqrff0AZ2w.ul2BdYLTphn.AJNW1m9xSpW.y1ec2ZG','Jessie','Pinkman','Albuquerque ,128','1111','Holy See (Vatican City State)',1,1),(16,'Gus','$2y$10$z/eJxXF6Pw6Q71Gjzp1auOl255brr6.q77Acktfs6yBzkP9nOlT/2','Gus','Fring','Albuquerque ,1211','1212','Barbados',1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-14 12:58:09
