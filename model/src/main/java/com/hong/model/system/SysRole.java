package com.hong.model.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class SysRole {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    @TableField("roleNumber")
    private String roleNumber;

    @TableField("roleName")
    private String roleName;

    private String organization;

    private Boolean common;

    private Boolean enable;

    private String description;
}
