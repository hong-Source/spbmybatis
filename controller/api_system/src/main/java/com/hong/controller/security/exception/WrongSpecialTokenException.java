package com.hong.controller.security.exception;

import com.hong.dao.common.Exception.BaseException;

public class WrongSpecialTokenException extends BaseException {
    public WrongSpecialTokenException(){
        super("特殊token密码错误", 377);
    }
}
