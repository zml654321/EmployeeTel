package com.chb.service;


import com.chb.pojo.Dept;
import com.chb.pojo.Position;

import java.util.List;


public interface DeptService {
  List<Dept> queryAllDept();
  List<Dept> queryDept_idByName(String dept_name);
}
