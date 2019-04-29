package com.qcl.demo.controller;

import com.qcl.demo.bean.UserDemo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

import lombok.extern.slf4j.Slf4j;

/**
 * Created by qcl on 2019-04-28
 * 微信：2501902696
 * desc:
 */
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {


    @GetMapping("/index")
    public ModelAndView getUser(Map<String, Object> map) {
        UserDemo userDemo = new UserDemo();
        userDemo.setName("邱是");
        userDemo.setAge(10);
        map.put("user", userDemo);
        return new ModelAndView("user/index", map);
    }
}
