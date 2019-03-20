package com.hong.model.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author Gumh
 * @since 2019-03-20
 */
@TableName("sys_user")
@Data
@Accessors(chain = true)
public class SysUser extends Model<SysUser> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    private String username;

    private String password;

    private String nickname;

    private Boolean gender;

    @TableField("phoneNumber")
    private String phoneNumber;

    private String email;

    @TableField("weChat")
    private String weChat;

    private String qq;

    @TableField("imageUrl")
    private String imageUrl;

    @TableField("birthDay")
    private LocalDate birthDay;

    private String manager;

    private String description;

    private String organization;

    private String department;

    private Boolean enable;

    private String remark;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "SysUser{" +
        "id=" + id +
        ", username=" + username +
        ", password=" + password +
        ", nickname=" + nickname +
        ", gender=" + gender +
        ", phoneNumber=" + phoneNumber +
        ", email=" + email +
        ", weChat=" + weChat +
        ", qq=" + qq +
        ", imageUrl=" + imageUrl +
        ", birthDay=" + birthDay +
        ", manager=" + manager +
        ", description=" + description +
        ", organization=" + organization +
        ", department=" + department +
        ", enable=" + enable +
        ", remark=" + remark +
        "}";
    }
}
