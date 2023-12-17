CREATE TABLE `Humidity_Pandora_176`
(
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `index_id`     bigint       NOT NULL COMMENT '索引ID',
    `file_path`    varchar(255) NOT NULL COMMENT '文件路径',
    `humidity`     double   DEFAULT NULL COMMENT '湿度',
    `time`         datetime DEFAULT NULL COMMENT '时间序列',
    `created_time` datetime DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='潘多拉176湿度表';