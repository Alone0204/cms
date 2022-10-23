package com.xxxx.cms.dao;

import com.xxxx.cms.base.BaseMapper;
import com.xxxx.cms.vo.Role;
import com.xxxx.cms.vo.UserRole;

import java.util.List;
import java.util.Map;

public interface RoleMapper extends BaseMapper<Role, Integer> {
    // 查询⻆⾊列表
    public List<Map<String,Object>> queryAllRoles(Integer userId);

    List<Integer> queryUserHasRole(Integer userId);

    // 根据用户ID查询角色记录
    Integer countUserRoleByUserId(Integer useId);

    // 根据用户ID删除角色记录
    Integer deleteUserRoleByUserId(Integer useId);

    Integer insertUserRole(List<UserRole> userRoles);

    public Role selectByRoleName(String roleName);
}