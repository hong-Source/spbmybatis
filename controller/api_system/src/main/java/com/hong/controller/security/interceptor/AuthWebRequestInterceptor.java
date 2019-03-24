package com.hong.controller.security.interceptor;

import com.hong.controller.security.exception.NeedLoginException;
import com.hong.controller.security.exception.NoAuthExcetion;
import com.hong.controller.security.exception.WrongSpecialTokenException;
import com.hong.controller.security.exception.WrongTokenExcetion;
import com.hong.controller.security.util.JwtTokenUtil;
import com.hong.service.system.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Component
@ConfigurationProperties(prefix = "com.env.config.auth")
public class AuthWebRequestInterceptor implements HandlerInterceptor {
    @Autowired
    SysUserService sysUserService;
    //放行登录和报错url
    @Value("${env.config.auth.allowPath}")
    private String [] allowList;
    @Value("${env.config.auth.authForEverything}")
    private String authForEverything;
    @Value("${env.config.auth.specialUlr}")
    private String [] specialUlrList;
    @Value("${env.config.auth.specialPassword}")
    private String specialPassword;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String method = request.getMethod();
        //放行所有Option请求
        if(method.equals("OPTIONS"))
            return true;
        String requestURI = request.getRequestURI();

        /**
         * 特殊空值开发用的url 单独逻辑
         */
        for (String specialUlr:specialUlrList) {
            if(requestURI.startsWith(specialUlr)){
                String authToken = request.getHeader(JwtTokenUtil.tokenHeader);
                if(specialPassword.equals(authToken))
                    return true;
                else
                    throw new WrongSpecialTokenException();
            }
        }

        for (String allowUrl:allowList) {
            if(requestURI.startsWith(allowUrl))
                return true;
        }

        String authToken = request.getHeader(JwtTokenUtil.tokenHeader);
        if(null == authToken) {
            throw new NeedLoginException();
        }
        Serializable userId = null;
        try {
            userId = JwtTokenUtil.getUserIdFromToken(authToken);
        }catch (Exception e){
            throw new WrongTokenExcetion();
        }

        if(null == userId)
            throw new NoAuthExcetion();
        List<String> list = new ArrayList<>();

//        list = sysUserService.queryAllUrlByUserId(userId);
        if(null != list){
            if(list.contains(authForEverything))
                return true;
            for (String sourceUrl:list) {
                if(requestURI.startsWith(sourceUrl))
                    return true;
            }
        }

        throw new NoAuthExcetion();
    }
}