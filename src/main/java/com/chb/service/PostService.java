package com.chb.service;

import com.chb.pojo.Dept;
import com.chb.pojo.Post;
import com.chb.pojo.Tel;

import java.util.List;

public interface PostService {
    List<Post> queryPostByLev(int lev);
    List<Post>   queryPostByBefore_id(int before_id);
}
