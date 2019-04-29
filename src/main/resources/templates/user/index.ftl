<html>
<#include "../common/header.ftl">
<body>
<div id="wrapper" class="toggled">
	<#--边栏sidebar-->
	<#--<#include "../common/nav.ftl">-->


	<#--主要内容content-->
	<div id="page-content-wrapper">
		<div class="container-fluid">
			<div class="row clearfix">
				<div class="col-md-6 column">
					<#--<form role="form" method="post" action="/sell/picture/save">-->
					<div class="form-group">
						<label>姓名</label>
						<input name="name" type="text" class="form-control"
							   value="${(user.name)!''}"/>
					</div>
					<div class="form-group">
						<label>年龄</label>
						<input name="age" type="text" class="form-control"
							   value="${(user.age)!''}"/>
					</div>
					<#--<input hidden type="text" name="picId"-->
					<#--value="${(category.picId)!''}">-->
					<#--<button type="submit" class="btn btn-default">提交</button>-->
					<#--</form>-->
				</div>
			</div>
		</div>
	</div>

</div>
</body>
</html>