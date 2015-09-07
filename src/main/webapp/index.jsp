<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="bootstrap.min.css" rel="stylesheet">
<style>
.page-header {
	padding-bottom: 9px;
	margin: 0px 0 20px;
	border-bottom: 1px solid #eee;
	background-color: #3fc2ea;
}

.btn-primary {
	height: 20px;
	font-size: 10px;
}

hr {
	padding: 0px;
	margin: 0px;
}

a {
	color: write
}
</style>
<title>主界面</title>
</head>
<body onload="onselect()">
	<div class="page-header">
		<div class="col-xs-4">8821 孙堉澍</div>
		<div class="col-xs-offset-10">
			<a href="loginout.jsp"> <%=session.getAttribute("username") %>
			</a>
		</div>
	</div>

	<div class="container-fluid">


		<div id="navbar" class="navbar-collapse collapse col-xs-2">
			<ul class="nav nav-pills nav-stacked">

				<li role="presentation" class="active"><a href="#">Customer管理</a></li>
				<li role="presentation"><a href="#">Film设置</a></li>

			</ul>

		</div>
		<!--/.左侧导航 -->

		<div class="left col-xs-10">
			<div class="col-xs-10">
				<h3>客户管理</h3>
			</div>
		</div>
		<div class="left col-xs-10">
			<hr />
			<div class="col-xs-10">
				客户列表 <label class="btn btn-success"> <a
					href="addCustomer.jsp">新建</a>
				</label>
			</div>
			<!-- 表格-->
			<table
				class="table table-striped table-bordered table-hover table-condensed">
				<thead>

					<td><strong>操作</strong></td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>Address</td>
					<td>Email</td>
					<td>CustomerId</td>
					<td>LastUpdate</td>


				</thead>
				<tbody>




				</tbody>

			</table>
			<!--分页-->
			<nav class="col-xs-offset-8">

				<ul class="pagination" id="pages">
					<li><a href="#" aria-label="Previous" id="priw"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#" class="pager">1</a></li>
					<li><a href="#" class="pager">2</a></li>
					<li><a href="#" class="pager">3</a></li>
					<li><a href="#" class="pager">4</a></li>
					<li><a href="#" class="pager">5</a></li>
					<li><a href="#" aria-label="Next" id="next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>

		</div>
	</div>
	<!-- 模态框 -->
	<div class="modal fade" id="editModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">电影租赁管系统</h4>
				</div>
				<div class="modal-body">
					<form action="changeUser" method="post">
						<div>
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">First
									Name</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="firstname"
										placeholder="First Name" name="firstName">
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">Last
									Name</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="lastname"
										placeholder="LastName" name="lastName">
								</div>
							</div>

							<div class="form-group">
								<label for="address" class="col-sm-3 control-label">address</label>


								<div class="col-sm-9">
									<input type="email" class="form-control" id="address"
										placeholder="address" name="address">
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="col-sm-3 control-label">email</label>


								<div class="col-sm-9">
									<input type="text" class="form-control" id="email"
										placeholder="email" name="email">
								</div>
							</div>

							<div class="form-group">
								<label for="cid" class="col-sm-3 control-label">Customer_id</label>
								<div class="col-sm-9">
									<input type="text" class="form-control " id="cid"
										placeholder="Customer_id" name="cid" Readonly>
								</div>
							</div>

							<div class="form-group">
								<button type="submit" class="btn btn-primary col-xs-offset-3"
									id="modBtn">确认修改</button>
								<label id="tip"></label>
							</div>
						</div>
						<!--login div -->
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<!-- 删除时使用的模态框 -->
	<div class="modal fade" id="delModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title">确认删除？</h4>
					<label id="cdid"></label>
				</div>
				<div class="modal-body">

					<div>
						<button class="btn btn-warning" id="delConfirmBtn">确认</button>
						<button type="button" class="btn btn-warning" data-dismiss="modal"
							aria-label="Close">取消</button>

					</div>
					<!--login div -->

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

</body>

<script src="jquery-2.1.4.min.js"></script>
<script src="bootstrap.min.js"></script>
<script>
function load(){

        	$("tbody").text("");
            $.ajax({
                type: "post",
                dataType: "json",
                url: "UserMange",
                success: function (msg) {
                    var str = "";
                    for (i in msg) {
                        str += "<tr><td><a  data-toggle='modal' data-target='#editModal' data-whatever='"+msg[i].first_name+"' data-lastname='"+msg[i].last_name+"' data-address='"+msg[i].address+"' data-email='" + msg[i].email + "' data-cid='"+msg[i].cid+"'>编辑</a>|<a   data-toggle='modal' data-target='#delModal' data-cid='"+msg[i].cid+"'>删除</a></td><td>" + msg[i].first_name+ "</td><td>" + msg[i].last_name+ "</td><td>" + msg[i].address + "</td><td>" + msg[i].email + "</td><td>" + msg[i].cid + "</td><td>" + msg[i].last_update + "</td></tr>";
                    }
                    $("tbody").append(str);
                }
            });

    };
    
    function loadPage(){

    	
        $.ajax({
            type: "post",
            url: "getPageNum",
            success: function (msg) {
            	document.getElementById('pages').html(msg);
            }
        });

}
</script>




<script>
function onselect(){
	load();
	
	$('#editModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var lastname = button.data('lastname')
		  var address = button.data('address')
		  var cid = button.data('cid')
		  var email = button.data('email')
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('New info to ' + recipient+"  （email格式为 地址,电话 (英文逗号)）such as \"692 Joliet Street,448477190408\"")
		  modal.find('#firstname').val(recipient)
		  modal.find('#lastname').val(lastname)
		   modal.find('#email').val(email)
		    modal.find('#address').val(address)
		     modal.find('#cid').val(cid)
		})
		
		
			$('#delModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  
		  var cid = button.data('cid')
		  
		
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text("确认删除 编号为\""+cid+"\"的用户？")

		     modal.find('#cdid').html(cid)
		})
		
		
		
	var ul = document.getElementById('pages');
	var lis = ul.getElementsByClassName("pager");
	for(var i=0;i<lis.length;i++){
	lis[i].onclick = function(){

		$("tbody").text("");
    $.ajax({
    	
        type: "post",
        
        dataType: "json",
        url: "UserMange",
        data:{code:this.innerHTML},
        success: function (msg) {
            var str = "";
            for (i in msg) {
                str += "<tr><td><a  data-toggle='modal' data-target='#editModal' data-whatever='"+msg[i].first_name+"' data-lastname='"+msg[i].last_name+"' data-address='"+msg[i].address+"' data-email='" + msg[i].email + "' data-cid='"+msg[i].cid+"'>编辑</a>|<a   data-toggle='modal' data-target='#delModal' data-cid='"+msg[i].cid+"'>删除</a></td><td>" + msg[i].first_name+ "</td><td>" + msg[i].last_name+ "</td><td>" + msg[i].address + "</td><td>" + msg[i].email + "</td><td>" + msg[i].cid + "</td><td>" + msg[i].last_update + "</td></tr>";
            }
           

        	
            $("tbody").html(str);

        }
    });
	}
	}
	}
</script>

<script>

$("#delConfirmBtn").click(function(){
	var ciddd=document.getElementById("cdid").innerHTML;

    $.ajax({
    	
        type: "post",
        url: "delUser",
        async: true,
        data:{cid:ciddd},
		success:function(msg){
			if (msg=="success"){
				window.location.href="index.jsp";
			}
			else{
				alert("删除失败");
			}
		}
    });
})
</script>

<script>
	$("#next").click(function(){
		var i=$('.pagination').children().children();
		var p=parseInt(i[1].innerHTML) ;
		
		$('.pagination').children()[1].innerHTML="<a href='#' class='pager'>"+(p+5)+"</a>";
		$('.pagination').children()[2].innerHTML="<a href='#' class='pager'>"+(p+6)+"</a>";
		$('.pagination').children()[3].innerHTML="<a href='#' class='pager'>"+(p+7)+"</a>";
		$('.pagination').children()[4].innerHTML="<a href='#' class='pager'>"+(p+8)+"</a>";
		$('.pagination').children()[5].innerHTML="<a href='#' class='pager'>"+(p+9)+"</a>";
		
		var ul = document.getElementById('pages');
		var lis = ul.getElementsByClassName("pager");
		for(var i=0;i<lis.length;i++){
		lis[i].onclick = function(){

			$("tbody").text("");
	    $.ajax({
	    	
	        type: "post",
	        
	        dataType: "json",
	        url: "UserMange",
	        data:{code:this.innerHTML},
	        success: function (msg) {
	            var str = "";
	            for (i in msg) {
	                str += "<tr><td><a  data-toggle='modal' data-target='#editModal' data-whatever='"+msg[i].first_name+"' data-lastname='"+msg[i].last_name+"' data-address='"+msg[i].address+"' data-email='" + msg[i].email + "' data-cid='"+msg[i].cid+"'>编辑</a>|<a   data-toggle='modal' data-target='#delModal' data-cid='"+msg[i].cid+"'>删除</a></td><td>" + msg[i].first_name+ "</td><td>" + msg[i].last_name+ "</td><td>" + msg[i].address + "</td><td>" + msg[i].email + "</td><td>" + msg[i].cid + "</td><td>" + msg[i].last_update + "</td></tr>";
	            }
	           

	        	
	            $("tbody").html(str);

	        }
	    });
		}
		}
		
	})
</script>

<script>
	$("#priw").click(function(){
		var i=$('.pagination').children().children();
		var p=parseInt(i[1].innerHTML) ;
		
		$('.pagination').children()[1].innerHTML="<a href='#' class='pager'>"+(p-5)+"</a>";
		$('.pagination').children()[2].innerHTML="<a href='#' class='pager'>"+(p-4)+"</a>";
		$('.pagination').children()[3].innerHTML="<a href='#' class='pager'>"+(p-3)+"</a>";
		$('.pagination').children()[4].innerHTML="<a href='#' class='pager'>"+(p-2)+"</a>";
		$('.pagination').children()[5].innerHTML="<a href='#' class='pager'>"+(p-1)+"</a>";
		
		var ul = document.getElementById('pages');
		var lis = ul.getElementsByClassName("pager");
		for(var i=0;i<lis.length;i++){
		lis[i].onclick = function(){

			$("tbody").text("");
	    $.ajax({
	    	
	        type: "post",
	        
	        dataType: "json",
	        url: "UserMange",
	        data:{code:this.innerHTML},
	        success: function (msg) {
	            var str = "";
	            for (i in msg) {
	                str += "<tr><td><a  data-toggle='modal' data-target='#editModal' data-whatever='"+msg[i].first_name+"' data-lastname='"+msg[i].last_name+"' data-address='"+msg[i].address+"' data-email='" + msg[i].email + "' data-cid='"+msg[i].cid+"'>编辑</a>|<a   data-toggle='modal' data-target='#delModal' data-cid='"+msg[i].cid+"'>删除</a></td><td>" + msg[i].first_name+ "</td><td>" + msg[i].last_name+ "</td><td>" + msg[i].address + "</td><td>" + msg[i].email + "</td><td>" + msg[i].cid + "</td><td>" + msg[i].last_update + "</td></tr>";
	            }
	           

	        	
	            $("tbody").html(str);

	        }
	    });
		}
		}
		
	})
</script>


</html>
