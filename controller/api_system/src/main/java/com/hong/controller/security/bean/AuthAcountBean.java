package com.hong.controller.security.bean;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;

@Data
@Accessors(chain = true)
public class AuthAcountBean {
    @NotBlank(message = "用户名不能为空")
    private String password;
    @NotBlank(message = "密码不能为空")
    private String username;
}
