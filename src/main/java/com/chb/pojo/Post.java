package com.chb.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {
    private int id;
    private int lev;
    private int before_id;
    private String name;
    private String post_no;
}
