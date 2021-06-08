package com.chb.service;


import com.chb.dao.DeptMapper;
import com.chb.dao.PositionMapper;
import com.chb.pojo.Dept;
import com.chb.pojo.Position;

import java.util.List;

public class DeptServiceImpl implements DeptService{
    private DeptMapper deptMapper;

    public void setDeptMapper(DeptMapper deptMapper) {
        this.deptMapper=deptMapper;
    }

    public List<Dept> queryAllDept() {
        return deptMapper.queryAllDept();
    }

    public List<Dept> queryDept_idByName(String dept_name) {
        return deptMapper.queryDept_idByName(dept_name);
    }
}
