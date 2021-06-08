package com.chb.controller;

import com.chb.pojo.Tel;
import com.chb.service.TelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/tel")
public class TelController {
    @Resource(description = "TelServiceImpl")
    private TelService telService;

    //到新增用户界面
    @RequestMapping("/toAdd")
    public String toAddTel(){
        return "addTel";
    }
    //新增用户电话信息
    @RequestMapping("/addTel")
    public String addTel(HttpSession session,Tel tel){
        session.setAttribute("changeId",tel.getDept_id());
        telService.addTel(tel);
        return "redirect:/user/queryByStaff_id";
    }
    //删除用户电话信息
    @RequestMapping("deleteTelById")
    public String deleteTelById(HttpSession session,int id){
      Tel tel=telService.queryTelById(id);
        session.setAttribute("changeId",tel.getDept_id());
        telService.deleteTelById(id);
        return "redirect:/user/queryByStaff_id";
    }
    //到更新电话信息页面
    @RequestMapping("toUpdate")
    public String toUpdate(int id, Model model){
       Tel tel=telService.queryTelById(id);
        System.out.println("tel:"+tel);
       model.addAttribute("tel",tel);
        return "updateTel";
    }
    //修改用户电话信息
    @RequestMapping("updateTel")
    public String updateTelById(HttpSession session,Tel tel){
        session.setAttribute("changeId",tel.getDept_id());
        telService.updateTel(tel);
        return "redirect:/user/queryByStaff_id";
    }
}
