package com.xxxx.cms.service;

import com.xxxx.cms.base.BaseService;
import com.xxxx.cms.dao.BrushMapper;
import com.xxxx.cms.utils.AssertUtil;
import com.xxxx.cms.utils.DelHtmlUtil;
import com.xxxx.cms.utils.LoginUserUtil;
import com.xxxx.cms.vo.Brush;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class BrushService extends BaseService<Brush,Integer> {

    @Resource
    private BrushMapper brushMapper;

    //查询所有的题目
    public Map<String,Object> queryAllBrush(HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        Integer userId = LoginUserUtil.releaseUserIdFromCookie(request);
        //查询
        List<Brush> list = brushMapper.queryAllBrush(userId);
        list.forEach(System.out::println);
        //先设置所有的当前登录用户
        for (int i=0;i<list.size();i++){
            list.get(i).setdId(userId);
        }
        for (int i = 0;i<list.size();i++){
            Integer count = 0;
            Integer num = 0;
            if (list.get(i).getParentId()==-1){
                for (int j =0;j<list.size();j++){
                    if (list.get(j).getParentId()==list.get(i).getBrushId()){
                        count++;
                    }
                    if (list.get(j).getParentId()==list.get(i).getBrushId()&&list.get(j).getAnswerId()!=null){
                        System.out.println(list.get(j).getUserId());
                        System.out.println(list.get(j).getdId());
                        num++;
                    }
                }
                list.get(i).setCount(count);
                list.get(i).setNum(num);
            }
            //将标签去除，只保留文本部分
            list.get(i).setQuestion(DelHtmlUtil.delHTMLTag(list.get(i).getQuestion()));
        }


        map.put("code",0);
        map.put("msg","");
        map.put("count",list.size());
        map.put("data",list);
        return map;
    }

    public List<Brush> queryByParentId(Integer brushId) {
        //参数校验
        AssertUtil.isTrue(brushId==null,"要查找数据不存在");
        List<Brush> list = brushMapper.queryByParentId(brushId);
        return list;
    }

}
