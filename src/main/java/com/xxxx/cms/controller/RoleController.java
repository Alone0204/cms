package com.xxxx.cms.controller;

import com.xxxx.cms.annoation.RequirePermission;
import com.xxxx.cms.base.BaseController;
import com.xxxx.cms.base.ResultInfo;
import com.xxxx.cms.query.RoleQuery;
import com.xxxx.cms.service.RoleService;
import com.xxxx.cms.vo.Role;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Resource
    private RoleService roleService;

    /**
     * 查询⻆⾊列表
     * @return
     */
    @RequirePermission(code = 40)
    @RequestMapping("queryAllRoles")
    @ResponseBody
    public List<Map<String,Object>> queryAllRoles(Integer userId){
        return roleService.queryAllRoles(userId);
    }

    @RequirePermission(code = 40)
    @RequestMapping("list")
    @ResponseBody
    public Map<String,Object> selectByParams(RoleQuery roleQuery){
        return roleService.queryByParamsForTable(roleQuery);
    }

    @RequirePermission(code = 40)
    @RequestMapping("index")
    public String index(){
        return "role/role";
    }

    @RequirePermission(code = 40)
    @PostMapping("add")
    @ResponseBody
    public ResultInfo saveRole(Role role){
        roleService.saveRole(role);
        return success("角色记录添加成功");
    }

    @RequirePermission(code = 40)
    @PostMapping("update")
    @ResponseBody
    public ResultInfo updateRole(Role role){
        roleService.updateRole(role);
        return success("角色记录修改成功");
    }

    @RequirePermission(code = 40)
    @PostMapping("delete")
    @ResponseBody
    public ResultInfo deleteRole(Integer roleId){
        roleService.deleteRole(roleId);
        return success("角色记录删除成功");
    }

    @RequirePermission(code = 40)
    @RequestMapping("addOrUpdateRolePage")
    public  String addOrUpdateRolePage(Integer id, Model model) {
        if (id!=null) {
            model.addAttribute("role", roleService.selectByPrimaryKey(id));
        }
        return "role/add_update";
    }

    @RequirePermission(code = 40)
    @PostMapping("addGrant")
    @ResponseBody
    public  ResultInfo addGrant(Integer[] mids,Integer roleId){
        roleService.addGrant(mids,roleId);
        return success("角色授权成功!");
    }

}
