package com.chb.controller;

import com.chb.pojo.Dept;
import com.chb.pojo.Position;
import com.chb.pojo.Post;
import com.chb.pojo.Tel;
import com.chb.service.DeptService;
import com.chb.service.PositionService;
import com.chb.service.PostService;
import com.chb.service.TelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/ajax")
public class AjaxController {
    @Resource(description = "DeptServiceImpl")
    private DeptService deptService;
    @Resource(description = "TelServiceImpl")
    private TelService telService;
    @Resource(description = "PositionServiceImpl")
    private PositionService positionService;
    @Resource(description = "PostServiceImpl")
    private PostService postService;
    //第一种方式，服务器要返回一个字符串，直接使用response
    @RequestMapping("/a1")
    public void ajax(String name, HttpServletResponse response)throws IOException {
        if("admin".equals(name)){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }
    @RequestMapping("/a2")
    @ResponseBody
    public List<Tel> ajax2(){
        List<Tel> list=telService.queryAllTel();
        return list;
    }
    @RequestMapping("/a3")
    @ResponseBody
    public List<Dept> ajax3(){
        List<Dept> list=deptService.queryAllDept();
        return list;
    }
    @RequestMapping("/a4")
    @ResponseBody
    public List<Tel> ajax4(String dept_id){
        List<Tel> list;
        if(dept_id.equals("0")){
            list = telService.queryAllTel();
        }else {
            list = telService.queryInfoByInfo("", dept_id);
        }
        return list;

    }
    @RequestMapping("/queryPostByLev")
    @ResponseBody
    public List<Post> ajax5(int lev){
       List<Post> list;
       list=postService.queryPostByLev(lev);
       return list;

    }
    @RequestMapping("/queryPostByBefore_id")
    @ResponseBody
    public List<Post> ajax6(int before_id){
        List<Post> list;
        list=postService.queryPostByBefore_id(before_id);
        return list;

    }
    @RequestMapping("/queryAllPosition")
    @ResponseBody
    public List<String> ajax7(){
       List<String> list;
       list=positionService.queryAllPosition();
        return list;
    }
    @RequestMapping("/queryPositionByName")
    @ResponseBody
    public List<Position> ajax8(String name){
        List<Position> list;
        System.out.println("name:"+name);
        list=positionService.queryPositionByName(name);
        return list;
    }
    @RequestMapping("/queryAllDept")
    @ResponseBody
    public List<Dept> ajax9(){
        List<Dept> list;
        list=deptService.queryAllDept();
        return list;
    }
    @RequestMapping("/queryDept_idByName")
    @ResponseBody
    public List<Dept> ajax10(String dept_name){
        List<Dept> list;
        list=deptService.queryDept_idByName(dept_name);
        return list;
    }
    @RequestMapping("/queryOrder_levelById")
    @ResponseBody
    public List<Position> ajax11(int id){
        List<Position> list;
        list=positionService.queryOrder_levelById(id);
        return list;
    }
}
