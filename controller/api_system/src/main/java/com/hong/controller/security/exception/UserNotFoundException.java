package com.hong.controller.security.exception;

import com.hong.dao.common.Exception.BaseException;

public class UserNotFoundException extends BaseException {
    public UserNotFoundException(){
        super("用户名或者密码错误", null);
    }
}
