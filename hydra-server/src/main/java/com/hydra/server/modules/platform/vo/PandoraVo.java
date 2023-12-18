package com.hydra.server.modules.platform.vo;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author Mr.Zxb
 * @description
 * @date 2023/12/18 21:46
 */
@Data
@Builder
public class PandoraVo {
    private Float humidity;
    private LocalDateTime time;
}
