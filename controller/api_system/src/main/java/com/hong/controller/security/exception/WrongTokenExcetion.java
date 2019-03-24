package com.hong.controller.security.exception;

import com.hong.dao.common.Exception.BaseException;

public class WrongTokenExcetion extends BaseException {
    public WrongTokenExcetion(){
        super("错误的Token", 401);
    }
}
