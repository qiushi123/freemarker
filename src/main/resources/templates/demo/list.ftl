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