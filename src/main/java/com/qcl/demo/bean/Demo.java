package com.qcl.demo.bean;

import lombok.Data;

/**
 * Created by qcl on 2019-04-29
 * 微信：2501902696
 * desc:
 */
@Data
public class Demo {
    private int id;
    private String title;
    private String name;
    private String wechat;

    public Demo(int id, String title, String name, String wechat) {
        this.id = id;
        this.title = title;
        this.name = name;
        this.wechat = wechat;
    }
}
