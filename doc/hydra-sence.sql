CREATE TABLE `Pandora_176`
(
    `id`        bigint       NOT NULL AUTO_INCREMENT,
    `file_name` varchar(255) NOT NULL,
    `time`      datetime     NOT NULL,
    `humidity`  float        NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE `Pandora_194`
(
    `id`        bigint       NOT NULL AUTO_INCREMENT,
    `file_name` varchar(255) NOT NULL,
    `time`      datetime     NOT NULL,
    `humidity`  float        NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;