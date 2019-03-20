package com.hong.controller.security.exception;

import com.hong.common.Exception.BaseException;

public class WrongSpecialTokenException extends BaseException {
    public WrongSpecialTokenException(){
        super("特殊token密码错误", 377);
    }
}
