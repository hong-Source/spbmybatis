package com.hong.controller.security.controller;

import com.hong.common.bean.ResponseBean;
import com.hong.controller.security.bean.AuthAcountBean;
import com.hong.controller.security.exception.UserNotFoundException;
import com.hong.controller.security.util.JwtTokenUtil;
import com.hong.model.system.SysUser;
import com.hong.service.system.SysUserService;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping
public class AuthController {
    @Autowired
    SysUserService sysUserService;
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ApiResponses(value={
            @ApiResponse(code=432, message="该用户未注册"),
            @ApiResponse(code=433, message="密码错误")})
    private ResponseBean login(@Valid @RequestBody AuthAcountBean authAcountBean) throws Exception {
        SysUser user = sysUserService.login(authAcountBean.getUsername(), authAcountBean.getPassword());
        user.setLastLoginTime(new Date());
        user.updateById();
        sysUserService.loadNameField(Arrays.asList(user));
        return tokenResponse(user);
    }

//    /**
//     * 方法到此已经通过拦截器 无需再次检查token相关
//     */
//    @PostMapping(value = "/refresh")
//    private ResponseBean refresh(HttpServletRequest request) throws Exception {
//        String authToken = request.getHeader(JwtTokenUtil.tokenHeader);
//        Serializable userId = JwtTokenUtil.getUserIdFromToken(authToken);
//
//        SysUser user = sysUserService.getById(userId);
//        user.setLastlogintime(new Date());
//        user.updateById();
//        sysUserService.loadNameField(Arrays.asList(user));
//        return tokenResponse(user);
//    }

    private ResponseBean tokenResponse(SysUser user){
        if(null != user) {
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("token", JwtTokenUtil.createJWT(user.getId()));
            resultMap.put("user", user);
//            resultMap.put("menu", sysUserService.queryAllMenuByUserId(user.getId()));

            return new ResponseBean().success(resultMap);
        }

        throw new UserNotFoundException();
    }
}
