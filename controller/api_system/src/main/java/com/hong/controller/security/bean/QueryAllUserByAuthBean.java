package com.hong.controller.security.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class QueryAllUserByAuthBean {
    private String auth;
}
