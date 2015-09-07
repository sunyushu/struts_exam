<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="bootstrap.min.css" rel="stylesheet">
<style>
body {
	background-image: url("Desert.jpg");
}
</style>
<title>登录界面</title>
</head>
<body>
	<div class="container-fluid">

		<div class="col-xs-4">
			<h2 style="color: red;">
				<strong>8821 孙堉澍</strong>
			</h2>
		</div>
		<!-- 模态框-->
		<div class="modal fade" id="loginModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">

						<h4 class="modal-title">电影租赁管系统</h4>
					</div>
					<div class="modal-body">

						<div>
							<form action="login">
								<div class="form-group">
									<label for="username" class="col-sm-2 control-label">用户名</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="username"
											placeholder="用户名" name="userName">
									</div>
								</div>
								<br>
								<div class="form-group">
									<label for="userpass" class="col-sm-2 control-label">密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="userpass"
											placeholder="密码" name="userPass">
									</div>
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-primary col-xs-offset-3"
										id="loginBtn">登录</button>
									<label id="tip"></label>
								</div>
							</form>
						</div>
						<!--login div -->

					</div>
				</div>
				<!-- /.modal-content -->

			</div>
			<!-- /.modal-dialog -->

		</div>
	</div>
</body>
<script src="jquery-2.1.4.min.js"></script>
<script src="bootstrap.min.js"></script>
<script>

    $("#loginModal").modal("show");
</script>

<script>


    $("#loginBtn").click(function(){

        var username=$("input[name='userName']").val();
        var userpass=$("input[name='userPass']").val();


        if(username!=""){

            if(userpass!=""){
                $.ajax({
                    type: "post",
                    url: "login.check",
                    data: {username:username,userpass:userpass},
                    async: true,
                    success: function (msg) {
                        $("#tip").html(msg);
                        if(msg=="success"){
                            window.location.href="index.jsp";
                        }
                    },
                    error: function (msg) {
                        $("#tip").html("登录失败，请重试")
                    }
                });



            }
            else{
                $("#tip").html("密码不能为空")
            }

        }



        else{
            $("#regTip").html("用户名不能为空")
        }


    })
</script>
</html>