package com.chb.dao;

import com.chb.pojo.Dept;
import com.chb.pojo.Position;

import java.util.List;

public interface DeptMapper {
        List<Dept> queryAllDept();
        List<Dept> queryDept_idByName(String dept_name);
}
