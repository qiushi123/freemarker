package com.qcl.demo.bean;

import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

/**
 * Created by qcl on 2019-04-28
 * 微信：2501902696
 * desc:
 */
@Entity
@Data
@DynamicUpdate//自动更新时间
@EntityListeners(AuditingEntityListener.class)
public class UserDemo {
    //员工和管理员信息相关
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userId;//主键

    private String name;
    private String phone;
    private int age;
    private String password;
    private int userType;
    private String address;


    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    //    @JsonSerialize(using = Date2StringSerializer.class)//用于把date类型转换为string类型
    private Date createTime;//配送时间

    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    //    @JsonSerialize(using = Date2StringSerializer.class)//用于把date类型转换为string类型
    private Date updateTime;
}
