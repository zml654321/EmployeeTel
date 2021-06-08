package com.chb.service;


import com.chb.pojo.Position;

import java.util.List;


public interface PositionService {
    List<String> queryAllPosition();
    List<Position> queryPositionByName(String name);
    List<Position> queryOrder_levelById(int id);
}
