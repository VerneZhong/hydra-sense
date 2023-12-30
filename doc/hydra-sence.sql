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


CREATE INDEX Pandora_176_time_IDX USING BTREE ON hydra.Pandora_176 (`time`);
CREATE INDEX Pandora_194_time_IDX USING BTREE ON hydra.Pandora_194 (`time`);

CREATE TABLE pandora_file
(
    id          BIGINT auto_increment NOT NULL,
    file_name   varchar(100)          NOT NULL,
    file_path   varchar(255)          NOT NULL,
    description varchar(255)          NOT NULL,
    CONSTRAINT pandora_file_PK PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
ALTER TABLE pandora_file ADD CONSTRAINT pandora_file_UN UNIQUE KEY (file_name);

