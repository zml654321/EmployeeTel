package com.chb.service;

import com.chb.dao.PostMapper;
import com.chb.dao.TelMapper;
import com.chb.pojo.Dept;
import com.chb.pojo.Post;
import com.chb.pojo.Tel;

import java.util.List;

public class PostServiceImpl implements PostService{
    private PostMapper postMapper;
    public void setPostMapper(PostMapper postMapper) {
        this.postMapper=postMapper;
    }
    public List<Post> queryPostByLev(int lev) {
        return postMapper.queryPostByLev(lev);
    }
    public List<Post> queryPostByBefore_id(int before_id) {
        return postMapper.queryPostByBefore_id(before_id);
    }
}
