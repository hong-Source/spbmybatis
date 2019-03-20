package com.hong.controller.security.exception;

import com.hong.common.Exception.BaseException;

public class NeedLoginException extends BaseException {
    public NeedLoginException(){
        super("需要登录", 401);
    }
}
