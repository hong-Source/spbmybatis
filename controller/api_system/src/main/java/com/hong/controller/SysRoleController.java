package com.hong.controller;

import com.hong.model.system.SysRole;
import com.hong.service.system.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sys/role")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;
    @GetMapping("getall")
    public String getAll(){
        List<SysRole> list = sysRoleService.list(null);
        return list.toString();
    }

}
