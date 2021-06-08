package com.chb.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dept {
    private  int id;
    private  String dept_no;
    private  String dept_name;
}
