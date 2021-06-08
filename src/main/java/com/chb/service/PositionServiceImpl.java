package com.chb.service;


import com.chb.dao.PositionMapper;
import com.chb.dao.PostMapper;
import com.chb.pojo.Position;

import java.util.List;

public class PositionServiceImpl implements PositionService{
    private PositionMapper positionMapper;

    public void setPositionMapper(PositionMapper positionMapper) {
        this.positionMapper=positionMapper;
    }

    public List<String> queryAllPosition() {
        return positionMapper.queryAllPosition();
    }

    public List<Position> queryPositionByName(String name) {
        return positionMapper.queryPositionByName(name);
    }

    public List<Position> queryOrder_levelById(int id) {
        return positionMapper.queryOrder_levelById(id);
    }
}
