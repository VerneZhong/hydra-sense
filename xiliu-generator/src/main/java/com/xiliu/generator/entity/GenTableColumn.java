package com.xiliu.generator.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.xiliu.common.utils.StringUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @author xiliu
 * @description 代码生成业务字段表 gen_table_column
 * @date 2022/7/14
 */
@Getter
@Setter
@TableName("gen_table_column")
@ApiModel(value = "GenTableColumn对象", description = "代码生成业务表字段")
public class GenTableColumn implements Serializable{

    /** 编号 */
    @ApiModelProperty("主键ID")
    @TableId(value = "table_id", type = IdType.AUTO)
    private Long columnId;

    /** 归属表编号 */
    private Long tableId;

    /** 列名称 */
    private String columnName;

    /** 列描述 */
    private String columnComment;

    /** 列类型 */
    private String columnType;

    /** JAVA类型 */
    private String javaType;

    /** JAVA字段名 */
    @NotBlank(message = "Java属性不能为空")
    private String javaField;

    /** 是否主键（1是） */
    private String isPk;

    /** 是否自增（1是） */
    private String isIncrement;

    /** 是否必填（1是） */
    private String isRequired;

    /** 是否为插入字段（1是） */
    private String isInsert;

    /** 是否编辑字段（1是） */
    private String isEdit;

    /** 是否列表字段（1是） */
    private String isList;

    /** 是否查询字段（1是） */
    private String isQuery;

    /** 查询方式（EQ等于、NE不等于、GT大于、LT小于、LIKE模糊、BETWEEN范围） */
    private String queryType;

    /** 显示类型（input文本框、textarea文本域、select下拉框、checkbox复选框、radio单选框、datetime日期控件、image图片上传控件、upload文件上传控件、editor富文本控件） */
    private String htmlType;

    /** 字典类型 */
    private String dictType;

    /** 排序 */
    private Integer sort;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "逻辑删除 1已删除 0未删除")
    private Boolean deleted;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建人")
    private Long createdBy;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private java.util.Date createdTime;

    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private java.util.Date updatedTime;

    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新人")
    private Long updatedBy;

    @ApiModelProperty(value = "数据版本")
    private Integer version;


    public boolean isSuperColumn() {
        return isSuperColumn(this.javaField);
    }

    public static boolean isSuperColumn(String javaField) {
        return StringUtils.equalsAnyIgnoreCase(javaField,
                // BaseEntity
                "createdBy", "createdTime", "updatedBy", "updatedTime", "deleted",
                // TreeEntity
                "parentName", "parentId", "orderNum", "ancestors");
    }

    public String getCapJavaField() {
        return StringUtils.capitalize(javaField);
    }
}
