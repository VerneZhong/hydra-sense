package com.hydra.server.modules.platform.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author Mr.Zxb
 * @description
 * @date 2023/12/29 21:42
 */
@Data
@TableName("Pandora_194")
@ApiModel(value = "PandoraFile对象", description = "潘多拉文件表")
public class PandoraFile {
    @ApiModelProperty("主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private String fileName;
    private String filePath;
    private String description;
}
