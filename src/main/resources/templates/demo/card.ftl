<html>
<#include "../common/header.ftl">
<body>
<h1>卡片图片</h1>
<div class="container-fluid">
	<div class="card" style="width:400px">
		<img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png"
			 alt="Card image">
		<div class="card-body">
			<h4 class="card-title">John Doe</h4>
			<p class="card-text">Some example text.</p>
			<a href="#" class="btn btn-primary">See Profile</a>
		</div>
	</div>
</div>

<#--折叠元素-->
<div class="container">
	<p><strong>注意:</strong> 使用 <strong>data-parent</strong> 属性来确保所有的折叠元素在指定的父元素下，
		这样就能实现在一个折叠选项显示时其他选项就隐藏。</p>
	<div id="accordion">
		<div class="card">
			<div class="card-header">
				<a class="card-link" data-toggle="collapse" href="#collapseOne">
					选项一
				</a>
			</div>
			<div id="collapseOne" class="collapse show" data-parent="#accordion">
				<div class="card-body">
					#1 内容：菜鸟教程 -- 学的不仅是技术，更是梦想！！！
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header">
				<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
					选项二
				</a>
			</div>
			<div id="collapseTwo" class="collapse" data-parent="#accordion">
				<div class="card-body">
					#2 内容：菜鸟教程 -- 学的不仅是技术，更是梦想！！！
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header">
				<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
					选项三
				</a>
			</div>
			<div id="collapseThree" class="collapse" data-parent="#accordion">
				<div class="card-body">
					#3 内容：菜鸟教程 -- 学的不仅是技术，更是梦想！！！
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>