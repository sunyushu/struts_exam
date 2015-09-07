<%@page import="com.hand.getAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="bootstrap.min.css" rel="stylesheet">
<title>新建Customer</title>
<style>
.page-header {
	padding-bottom: 9px;
	margin: 0px 0 20px;
	border-bottom: 1px solid #eee;
	background-color: #3fc2ea;
}

lp {
	color: red;
}

hr {
	padding: 0px;
	margin: 0px;
}
</style>
</head>

<body>


	<div class="page-header">
		<div class="col-xs-4">8821 孙堉澍</div>
		<div class="col-xs-offset-10">用户名</div>

	</div>
	<div class="container-fluid">

		<div id="navbar" class="navbar-collapse collapse col-xs-2">
			<ul class="nav nav-pills nav-stacked">
				<li role="presentation"><a href="#">Dashboard</a></li>
				<li role="presentation" class="active"><a href="#">应用设置</a></li>
				<li role="presentation"><a href="#">管理设置</a></li>
				<li role="presentation"><a href="#">数据配置</a></li>
				<li role="presentation"><a href="#">主数据管理</a></li>
				<li role="presentation"><a href="#">客户订单管理</a></li>
				<li role="presentation"><a href="#">发货单管理</a></li>
			</ul>

		</div>
		<!--/.左侧导航 -->

		<div class="col-xs-10">
			<div>
				<h3>创建Customer</h3>
			</div>

			<div>
				<h5>基本信息</h5>
			</div>

			<div class="form-group col-xs-7">
				<form action="addCustomer" method="post">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">First
							Name<lp>*</lp>
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="firstname"
								placeholder="firstname" name="firstName"> <br>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">Last
							Name<lp>*</lp>
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="lastname"
								placeholder="lastname" name="lastName"> <br>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="email"
								placeholder="email" name="email"> <br>
						</div>
					</div>

					<div class="form-group">
						<label for="address" class="col-sm-2 control-label">address<lp>*</lp></label>
						<div class="col-sm-10">
							<select class="form-control" id="address" name="addr">
								<%=getAddress.getAddr() %>
							</select> <br>
						</div>
					</div>

					<div class="form-group col-xs-offset-3">
						<input type="submit" class="btn btn-primary" value="新建"> <label
							class="btn btn-primary"><a href="index.jsp"
							style="color: white;">取消</a></label>
					</div>
				</form>
			</div>

		</div>



	</div>
	<!-- /container -->
</body>
</html>