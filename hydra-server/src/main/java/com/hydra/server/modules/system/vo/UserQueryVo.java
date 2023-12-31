package com.hydra.server.modules.system.vo;


import com.hydra.common.domain.BasePageEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author hydra
 * @description
 * @date 2021/9/26
 */
@Data
public class UserQueryVo extends BasePageEntity {

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "用户名")
    private String userCode;

    @ApiModelProperty(value = "姓名")
    private String realName;
}
