package com.xxxx.cms.aspect;

import com.xxxx.cms.annoation.RequirePermission;
import com.xxxx.cms.exceptions.AuthException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Component
@Aspect
public class PermissionProxy {

    @Resource
    private HttpSession session;

    @Around(value = "@annotation(com.xxxx.cms.annoation.RequirePermission)")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        Object result = null;
        // 得到当前登录用户拥有的权限
        List<Integer> roles = (List<Integer>) session.getAttribute("roles");
        // 判断用户是否拥有权限
        if (roles == null || roles.size() < 1){
            // 抛出权限异常
            throw new AuthException();
        }

        // 得到对应的目标
        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        // 得到方法上的注解
        RequirePermission requirePermission = methodSignature.getMethod().getDeclaredAnnotation(RequirePermission.class);
        if (!(roles.contains(requirePermission.code()))){
            throw new AuthException();
        }

        result = pjp.proceed();
        return result;
    }

}
