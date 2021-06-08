package com.chb.dao;

import com.chb.pojo.Position;
import com.chb.pojo.Post;

import java.util.List;

public interface PositionMapper {
        List<String> queryAllPosition();
        List<Position> queryPositionByName(String name);
        List<Position> queryOrder_levelById(int id);
}
