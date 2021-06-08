package com.chb.service;

import com.chb.pojo.Dept;
import com.chb.pojo.Tel;

import java.util.List;

public interface TelService {
    //增加一个tel
    int addTel(Tel tel);
    //根据id删除一个tel
    int deleteTelById(int id);
    //更新用户电话信息
    int updateTel(Tel tel);
    //根据用户id查询用户信息
    Tel queryTelById(int id);
    //查询全部员工电话信息，返回LIST集合
    List<Tel> queryAllTel();
    //根据员工编号查询员工所在部门所有用户信息
    List<Tel> queryDeptAllByStaff_id(String staff_id);
    //根据员工编号查询员工的操作权限
    String queryOperate_grade(String staff_id);
    //查询部门信息
    List<String> queryDeptInfo();
    //根据提交用户信息查询用户信息
    List<Tel> queryInfoByInfo(String info,String dept_id);
    //查询所有部门信息
    List<Dept> queryAllDept();
    //根据用户名查询电话信息
    Tel queryTelByName(String name);
}
