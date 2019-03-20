package com.hong.controller.security.exception;

import com.hong.common.Exception.BaseException;

public class NoAuthExcetion extends BaseException {
    public NoAuthExcetion(){
        super("权限不足", 403);
    }
}
