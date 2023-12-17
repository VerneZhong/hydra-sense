package com.hydra.server.modules.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.hydra.common.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 字典表对象 hydra_dict
 * 
 * @author hydra
 * @date 2022-08-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("hydra_dict")
public class XlDict extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "dict_id", type = IdType.AUTO)
    private Long dictId;

    /** 字典类型 */
    private String dictType;

    /** 字典名称 */
    private String dictName;

    /** 状态（0正常 1停用） */
    private Integer status;

    /** 备注 */
    private String remark;

}
