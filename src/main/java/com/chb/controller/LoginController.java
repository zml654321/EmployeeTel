package com.chb.controller;

import com.chb.pojo.Dept;
import com.chb.pojo.Tel;
import com.chb.service.TelService;
import com.chb.tools.ADLogin;
import com.chb.tools.constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Resource(description = "TelServiceImpl")
    private TelService telService;
    //跳转到登录页面
    @RequestMapping("toLogin")
    public String toLogin()throws Exception{
        return "login";
    }
    //登录提交
    @RequestMapping("/login")
    public String login(HttpSession session, String username, String pwd, Model model)throws Exception{
        //1.验证用户名密码是否正确
        //2.正确，则根据用户所在部门，查询用户部门电话信息
        //3.错误，则给出提示信息，跳转到登录页面
        if (session.getAttribute("user")!=null) {
            username = (String) session.getAttribute("user");
            List<Tel> list=telService.queryDeptAllByStaff_id(username);
            model.addAttribute("list",list);
            model.addAttribute("username",username);
            return "success";
        }else {
            boolean flag= ADLogin.IV(username,pwd);
            String operate_grade=telService.queryOperate_grade(username);
            if(flag&&operate_grade.equals("1")){
                session.setAttribute("level","1");
                session.setAttribute("user",username);
                List<Tel> list=telService.queryDeptAllByStaff_id(username);
                model.addAttribute("list",list);
                model.addAttribute("username",username);
                return "success";
            }else if(flag&&operate_grade.equals("2")){
                session.setAttribute("level","2");
                session.setAttribute("user",username);
                List<Tel> list=telService.queryAllTel();
                model.addAttribute("list",list);
                model.addAttribute("username",username);
                return "success";
            }else{
                if(!flag){
                    model.addAttribute("msg","用户名或密码错误");

                }
                if(operate_grade.equals("0")){
                    model.addAttribute("msg","用户没有相关权限");
                }
                return "login";
            }
        }

    }
    //查询所有用户电话信息
    @RequestMapping("/allTel")
    public String list(Model model){
        List<Tel> list=telService.queryAllTel();
        model.addAttribute("list",list);
        return "showAllTel";
    }
    //查询所有部门信息
    @RequestMapping("/allDeptInfo")
    public String dept_info(Model model){
        List<String> list=telService.queryDeptInfo();
        model.addAttribute("list",list);
        for(String result:list){
            System.out.println(result);
        }
        return "test";
    }
    @RequestMapping("/queryInfoByInfo")
    public String queryInfoByInfo(Model model,String info,String dept_id){
        List<Tel> list=telService.queryInfoByInfo(info,dept_id);
        if(dept_id.equals("0888")){
            Tel singleTel=telService.queryTelByName(constant.HANGZHANGMISHU);
            list.add(singleTel);
        }
        model.addAttribute("list",list);
        model.addAttribute("dept_id",dept_id);
        model.addAttribute("info",info);
        return "showAllTel";
    }
    @RequestMapping("/queryAllDept")
    public String queryAllDept(Model model){
        List<Dept> list=telService.queryAllDept();
        System.out.println("list:"+list);
        model.addAttribute("list",list);
        return "test";
    }
    @RequestMapping("/toTest")
    public String toTest(){
        return "test";
    }
}
