package com.xxxx.cms.service;

import com.xxxx.cms.dao.RoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PermissionService{

    @Resource
    private RoleMapper roleMapper;

    public List<Integer> queryUserHasRole(Integer userId) {
        return roleMapper.queryUserHasRole(userId);
    }
}
