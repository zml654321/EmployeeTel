package com.chb.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tel {
    private int id;
    private String staff_id;
    private String dept_id;
    private String dept_name;
    private String enter_date;
    private String sex;
    private String emp_name;
    private String post;
    private String level;
    private String manger_level;
    private String tel;
    private String operate_grade;
}
