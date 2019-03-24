package com.hong.controller.security.exception;

import com.hong.common.Exception.GlobalExceptionHandler;
import com.hong.common.bean.ResponseBean;
import io.jsonwebtoken.ExpiredJwtException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
@ResponseBody
public class AuthExceptionHandler {
    @ExceptionHandler(value = ExpiredJwtException.class)
    private ResponseBean expiredJwtExceptionHandler(Exception e){
        return GlobalExceptionHandler.process(e, 401, "权限过期");
    }
}
