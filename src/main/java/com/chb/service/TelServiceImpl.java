package com.chb.service;

import com.chb.dao.TelMapper;
import com.chb.pojo.Dept;
import com.chb.pojo.Tel;

import java.util.List;

public class TelServiceImpl implements TelService{
    private TelMapper telMapper;

    public void setTelMapper(TelMapper telMapper) {
        this.telMapper = telMapper;
    }

    public int addTel(Tel tel) {
        return telMapper.addTel(tel);
    }

    public int deleteTelById(int id) {
        return telMapper.deleteTelById(id);
    }

    public int updateTel(Tel tel) {
        return telMapper.updateTel(tel);
    }

    public Tel queryTelById(int id){ return  telMapper.queryTelById(id);}

    public List<Tel> queryAllTel() {
        return telMapper.queryAllTel();
    }

    public List<Tel> queryDeptAllByStaff_id(String staff_id) {
        return telMapper.queryDeptAllTelByStaff_id(staff_id);
    }
    public String queryOperate_grade(String staff_id){
        return telMapper.queryOperate_grade(staff_id);
    }

    public List<String> queryDeptInfo() {
        return telMapper.queryDeptInfo();
    }

    public List<Tel> queryInfoByInfo(String info, String dept_id) {
        return telMapper.queryInfoByInfo(info,dept_id);
    }

    public List<Dept> queryAllDept() {
        return telMapper.queryAllDept();
    }
    public Tel queryTelByName(String name){
        return telMapper.queryTelByName(name);
    }
}
