package com.hydra.server.modules.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.hydra.common.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 部门表
 * </p>
 *
 * @author hydra
 * @since 2022-07-12
 */
@Data
@TableName("hydra_dept")
@ApiModel(value = "XlDept对象", description = "部门表")
public class XlDept extends BaseEntity<XlDept> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    @TableId(value = "dept_id", type = IdType.AUTO)
    private Long deptId;

    @ApiModelProperty("父部门id")
    private Long parentId;

    @ApiModelProperty("祖级列表")
    private String ancestors;

    @ApiModelProperty("部门名称")
    private String deptName;

    @ApiModelProperty("显示顺序")
    private Integer sort;

    @ApiModelProperty("负责人")
    private String leader;

    @ApiModelProperty("联系电话")
    private String phone;

    @ApiModelProperty("邮箱")
    private String email;

    @ApiModelProperty("部门状态（0正常 1停用）")
    private Integer status;

    @ApiModelProperty("部门级别")
    private Integer deptLevel;

    @ApiModelProperty("租户ID")
    private Long tenantId;

    /** 子部门 */
    @TableField(exist = false)
    private List<XlDept> children = new ArrayList<>();
}
