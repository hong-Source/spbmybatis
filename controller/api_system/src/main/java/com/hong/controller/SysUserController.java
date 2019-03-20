package com.hong.controller;


import com.hong.common.controller.CrudController;
import com.hong.model.system.SysUser;
import com.hong.service.system.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Gumh
 * @since 2019-03-20
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController implements CrudController<SysUser,SysUserService> {

    @Autowired
    private SysUserService sysUserService;

    @Override
    public SysUserService getService() {
        return sysUserService;
    }
}

