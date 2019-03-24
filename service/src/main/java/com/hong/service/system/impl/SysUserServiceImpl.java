package com.hong.service.system.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hong.dao.common.Exception.BaseException;
import com.hong.model.system.SysUser;
import com.hong.dao.system.SysUserMapper;
import com.hong.service.system.SysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Gumh
 * @since 2019-03-20
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Override
    public SysUser login(String userName, String passWord) {
        SysUser sysUser = baseMapper.selectOne(new QueryWrapper<SysUser>().eq("username", userName));
        if(null == sysUser)
            throw new BaseException("用户名不存在", 432);
        sysUser = baseMapper.selectOne(new QueryWrapper<SysUser>().eq("username", userName).eq("password", passWord));
        if(null == sysUser)
            throw new BaseException("密码错误", 433);

        return sysUser;
    }

    @Override
    public List<SysUser> loadNameField(List<SysUser> list) {
        if(null == list || 0 == list.size())
            return list;
        /**
         * filter去空 Set去重
         */
        Set<String> managerIdList = list.stream().map(u -> {
            return u.getManager();
        }).filter(u -> null != u).collect(Collectors.toSet());
        Map<String, String> managerMap = this.list(new QueryWrapper<SysUser>().select("id", "nickname").in("id", managerIdList))
                .stream().collect(Collectors.toMap(SysUser::getId, SysUser::getNickname));
        for (SysUser user:list) {
            user.setPassword(null);
            user.setManager(managerMap.getOrDefault(user.getManager(), ""));
        }
        list.sort(Comparator.comparing(SysUser::getUsername));
        return list;
    }

}
