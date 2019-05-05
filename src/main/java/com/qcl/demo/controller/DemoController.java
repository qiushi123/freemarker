package com.qcl.demo.controller;

import com.qcl.demo.bean.Demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by qcl on 2019-04-29
 * 微信：2501902696
 * desc:freemarker学习
 */
@RestController
public class DemoController {

    @GetMapping("/navDemo")
    public ModelAndView navDemo() {
        return new ModelAndView("demo/nav");
    }

    @GetMapping("/cardDemo")
    public ModelAndView cardDemo() {
        return new ModelAndView("demo/card");
    }

    /*
     * 分页效果的实现
     * */
    @GetMapping("/pageList")
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                             @RequestParam(value = "size", defaultValue = "2") Integer size,
                             Map<String, Object> map) {
        List<Demo> demoList = new ArrayList<>(4);
        demoList.add(new Demo(1, "标题1", "编程小石头1", "2501902696"));
        demoList.add(new Demo(2, "标题2", "编程小石头2", "2501902696"));
        demoList.add(new Demo(3, "标题3", "编程小石头3", "2501902696"));
        demoList.add(new Demo(4, "标题4", "编程小石头4", "2501902696"));
        demoList.add(new Demo(5, "标题5", "编程小石头4", "2501902696"));
        demoList.add(new Demo(6, "标题6", "编程小石头4", "2501902696"));
        demoList.add(new Demo(7, "标题7", "编程小石头7", "2501902696"));
        int start = (page - 1) * 2;
        int end = start + size;
        List<Demo> subList = demoList.subList(start, end);
        int totalPage = (int) Math.ceil(demoList.size() / size);
        map.put("productInfoPage", subList);
        map.put("totalPage", totalPage);
        map.put("currentPage", page);
        map.put("size", size);
        return new ModelAndView("demo/pagelist", map);
    }
}
