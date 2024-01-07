package com.hydra.server.modules.platform.entity;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author Mr.Zxb
 * @description
 * @date 2023/12/17 12:41
 */
@Data
public class Pandora {

    /** 主键ID */
    private Long id;

    private String fileName;

    private Float humidity;

    private LocalDateTime time;
}
