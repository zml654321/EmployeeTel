package com.chb.dao;

import com.chb.pojo.Tel;
import com.chb.service.TelService;
import com.chb.service.TelServiceImpl;
import org.junit.Test;

import java.util.List;

public class test {
    @Test
    public  void testDAO(){
         TelService telService=new TelServiceImpl();
      List<Tel> telList=telService.queryDeptAllByStaff_id("900038");
      for(Tel tel:telList){
          System.out.println(tel);
      }
    }
}
