package com.chb.controller;

import com.chb.pojo.Tel;
import com.chb.service.TelService;
import com.chb.tools.ADLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource(description = "TelServiceImpl")
    private TelService telService;


    //根据用户名查询电话信息
    @RequestMapping("queryByStaff_id")
    public String listByStaff_id(HttpSession session,Model model, String staff_id){
        String level= (String) session.getAttribute("level");
        String id= (String) session.getAttribute("user");
        if (level.equals("1")){
          List<Tel>  list= telService.queryDeptAllByStaff_id(id);
            model.addAttribute("list",list);
        }else if (level.equals("2")){
           List<Tel> list= telService.queryInfoByInfo("", (String) session.getAttribute("changeId"));
            model.addAttribute("list",list);
        }
        model.addAttribute("username",id);
        return "success";
    }
    //退出登录
    @RequestMapping("logout")
    public String logout(HttpSession session) throws Exception{
        session.invalidate();
        return "login";
    }
    //跳转到成功页面
    @RequestMapping("toSuccess")
    public String toSuccess()throws Exception{
        return "success";
    }
}
