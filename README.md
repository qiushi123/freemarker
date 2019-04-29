# freemarker
springboot+freemarker+bootstrap快速实现管理后台，包含分页功能等

## 目前已实现功能
- 1，管理后台表格数据展示
- 2，分页功能

持续完善中。。。。

### 准备工作
- 1，项目要引入freemarker和bootstrap，如果不知道怎么引入的，请查看
[《10小时入门java开发03 springboot+freemarker+bootstrap快速实现管理后台》](https://www.jianshu.com/u/eff28500592a)

## 还是老规矩，看效果图
![](https://upload-images.jianshu.io/upload_images/6273713-d6465ec034e58cde.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

可以看出我们实现了如下功能
- 1，表格数据的展示
- 2，分页效果的实现
- 3，上一页和下一页的实现
- 4，当前选中页码加重颜色

# 下面来看实现步骤
## 一，定义表格和分页组件
简单说说代码
- head里面是引入bootstrap的样式库
- table定义表格来展示数据
- ul里定义分页
代码如下：
```
<html>
<head>
	<meta charset="utf-8">
	<title>freemarker+bootstrap学习</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- 新 Bootstrap4 核心 CSS 文件 -->
	<link rel="stylesheet"
		  href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">

</head>
<body>
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table table-bordered table-condensed table-striped">
				<thead>
				<tr>
					<th>id</th>
					<th>姓名</th>
					<th>微信</th>
					<th colspan="2">操作</th>
				</tr>
				</thead>
				<tbody>

				<#list productInfoPage as productInfo>
					<tr>
						<td>${productInfo.id}</td>
						<td>${productInfo.name}</td>
						<td>${productInfo.wechat}</td>
						<td>
							<#if productInfo.id%2 == 0>
								<a href="#">下架</a>
							<#else>
								<a href="">上架</a>
							</#if>
						</td>
					</tr>
				</#list>
				</tbody>
			</table>
		</div>

		<#--分页-->
		<div class="col-md-12 column">
			<ul class="pagination ">
				<#if currentPage lte 1>
					<li class="disabled "><a class="page-link" href="#">上一页</a></li>
				<#else>
					<li>
						<a class="page-link" href="/pageList?page=${currentPage -
						1}&size=${size}">上一页</a>
					</li>
				</#if>

				<#list 1..totalPage as index>
					<#if currentPage == index>
						<li class="page-item active "><a class="page-link" href="#">${index}</a>
						</li>
					<#else>
						<li>
							<a class="page-link" href="/pageList?page=${index}&size=${size}">
								${index}</a>
						</li>
					</#if>
				</#list>

				<#if currentPage gte totalPage>
					<li class="disabled "><a class="page-link" href="#">下一页</a></li>
				<#else>
					<li>
						<a class="page-link" href="/pageList?page=${currentPage + 1}&size=${size}">下一页</a>
					</li>
				</#if>
			</ul>
		</div>
	</div>
</div>
</body>
</html>
```
## 二，定义好页面后，我们就来获取数据
同样这里的数据我们先用模拟数据，后面会用数据库里的数据。
看下面代码可以看出来，我们模拟了6条数据，然后每页显示2条数据。
```
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
        return new ModelAndView("demo/list", map);
    }
}
```
## 三，启动springboot查看效果。
注意每一页地址栏的url
![](https://upload-images.jianshu.io/upload_images/6273713-4846df549b951b31.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](https://upload-images.jianshu.io/upload_images/6273713-665670873a1c62eb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](https://upload-images.jianshu.io/upload_images/6273713-dec270640f9547a8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
可以看出，我们第一次访问时，默认显示第一页，url里没有page和size字段。
访问第2页和第3页时，url里就有了page和size。page是显示那一页，size是每页显示多少条数据。
到这里我们就实现的管理后台的分页效果。

> 我会把10小时实战入门java系列课程录制成视频，如果你看文章不能很好的理解，可以去看下视频：[https://edu.csdn.net/course/detail/23443](https://links.jianshu.com/go?to=https%3A%2F%2Fedu.csdn.net%2Fcourse%2Fdetail%2F23443)

有任何关于编程的问题都可以加我微信2501902696（备注编程开发）

#### 编程小石头，码农一枚，非著名全栈开发人员。分享自己的一些经验，学习心得，希望后来人少走弯路，少填坑。











