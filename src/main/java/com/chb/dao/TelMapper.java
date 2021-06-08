package com.chb.dao;

import com.chb.pojo.Dept;
import com.chb.pojo.Tel;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface TelMapper {
    //增加员工电话信息
    int addTel(Tel tel);
    //根据id删除一个电话信息
    int deleteTelById(int id);
    //更新用户电话信息
    int updateTel(Tel tel);
    //根据用户id查询电话信息
    Tel queryTelById(@Param("id") int id);
    //查询全部员工电话信息，返回list集合
    List<Tel> queryAllTel();
    //根据用户的员工编号，查询所在部门的所有员工信息
    List<Tel> queryDeptAllTelByStaff_id(@Param("staff_id") String staff_id);
    //根据用户员工编号，查询用户具有的权限
    String queryOperate_grade(@Param("staff_id") String staff_id);
    //查询部门信息
    List<String> queryDeptInfo();
    //根据用户提交信息查询结果
    List<Tel> queryInfoByInfo(@Param("info") String info,@Param("dept_id") String dept_id);
    //查询所有部门信息
    List<Dept> queryAllDept();
    //根据员工姓名查询电话信息
    Tel queryTelByName(@Param("name") String name);
}
