CREATE TABLE `bot_hash_tag_rels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_id` int(11) DEFAULT NULL,
  `hash_tag_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash_tag_fk_idx` (`hash_tag_id`),
  KEY `bot_id_fk_idx` (`bot_id`),
  CONSTRAINT `bot_id_fk` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hash_tag_fk` FOREIGN KEY (`hash_tag_id`) REFERENCES `hash_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE `bots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `twitter_name` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `access_secret` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE `hash_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_tag` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE `realtime_bot_hash_tag_trackings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_id` int(11) DEFAULT NULL,
  `bot_type` int(11) DEFAULT NULL,
  `content` text,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `realtime_bot_hash_tag_trackings_bot_id_fk_idx` (`bot_id`),
  CONSTRAINT `realtime_bot_hash_tag_trackings_bot_id_fk` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
