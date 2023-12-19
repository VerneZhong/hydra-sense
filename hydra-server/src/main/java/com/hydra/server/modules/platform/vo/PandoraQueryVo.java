package com.hydra.server.modules.platform.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author Mr.Zxb
 * @description
 * @date 2023/12/18 21:46
 */
@Data
public class PandoraQueryVo {
    private String startTime;
    private String endTime;
    private int pandoraType;
}
