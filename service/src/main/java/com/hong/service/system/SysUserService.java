package com.hong.service.system;

import com.hong.model.system.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Gumh
 * @since 2019-03-20
 */
public interface SysUserService extends IService<SysUser> {

    SysUser login(String userName, String passWord);

    List<SysUser> loadNameField(List<SysUser> list);

}
