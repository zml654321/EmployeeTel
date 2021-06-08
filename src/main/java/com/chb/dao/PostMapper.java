package com.chb.dao;

import com.chb.pojo.Dept;
import com.chb.pojo.Post;
import com.chb.pojo.Tel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostMapper {
    //根据lev查询岗位
    List<Post> queryPostByLev(int lev);
    //根据before_id查询岗位
    List<Post> queryPostByBefore_id(int before_id);
}
