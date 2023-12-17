package com.hydra.server.modules.platform.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hydra.common.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author Mr.Zxb
 * @description
 * @date 2023/12/17 12:41
 */
@Data
@TableName("hydra_dept")
@ApiModel(value = "XlDept对象", description = "部门表")
public class HumidityPandora176 extends BaseEntity<HumidityPandora176> {

    /** 主键ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Long indexId;

    private String filePath;

    private String humidity;

    private LocalDateTime time;
}
