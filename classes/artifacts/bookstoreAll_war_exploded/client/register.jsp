<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>bookStore注册页面</title>
<%--导入css --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/client/css/main.css"
	type="text/css" />
<script type="text/javascript">
	function changeImage() {
		// 改变验证码图片中的文字
		document.getElementById("img").src = "${pageContext.request.contextPath}/imageCode?time="
				+ new Date().getTime();
	}
	
	function tosubmit(){
		//邮箱验证
		var email = document.getElementById("email").value;
		var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		if(!filter.test(email)) {
			alert("邮箱格式不正确!"); return false;
		}
		//用户验证
		var username = document.getElementById("username").value;
		if(username == ""){
			alert("用户名为空,请填写用户名!"); return false;
		}
		//密码及确认密码
		var password = document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;

		if(password =="" && repassword==""){
			alert("密码或确认密码为空,请填写!"); return false;
		}else {
			if(!password == repassword){
				alert("2次密码不相符!请确认!"); return false;
			}
		}
		//电话验证
		var telephone = document.getElementById("telephone").value;
		var r1 = /^1\d{10}$/;

		if(!r1.test(telephone)){
			alert("电话格式不正确!!"); return false;
		}

		document.getElementById("registform").submit();
	}
</script>
</head>

<body class="main" onload="changeImage()">
	<%--导入头 --%>
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp"%><%--导入导航条与搜索 --%>
	<div id="divcontent">
		<form id="registform" action="${pageContext.request.contextPath}/servlet/RegisterServlet" method = "post" >
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 30px"><h1>新会员注册</h1>
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right; width: 20%">会员邮箱：</td>
								<td style="width: 40%">
								<input type="text" class="textinput" name="email" id="email" />
								</td>
								<td><font color="#999999">请输入有效的邮箱地址</font></td>
							</tr>
							<tr>
								<td style="text-align: right">会员名：</td>
								<td><input type="text" class="textinput" name="username" id="username"/>
								</td>
								<td><font color="#999999">会员名请设置4-20位字符</font></td>
							</tr>
							<tr>
								<td style="text-align: right">密码：</td>
								<td><input type="password" class="textinput"
									name="password" id="password"/></td>
								<td><font color="#999999">密码请设置4-20位字符</font></td>
							</tr>
							<tr>
								<td style="text-align: right">重复密码：</td>
								<td>
								<input type="password" class="textinput" name="repassword" id="repassword"/>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right">性别：</td>
								<td colspan="2">&nbsp;&nbsp;<input type="radio"
									name="gender" value="男" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio"
									name="gender" value="女" /> 女
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right">联系电话：</td>
								<td colspan="2">
								<input type="text" class="textinput"
									style="width: 350px" name="telephone" id="telephone"/>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right">备注：</td>
								<td colspan="2">
								<textarea class="textarea" name="introduce"></textarea>
								</td>
								<td>&nbsp;</td>
							</tr>
						</table>


						<h1>注册校验</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right; width: 20%">输入校验码：</td>
								<td style="width: 50%">
								<input type="text" class="textinput" />
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right; width: 20%;">&nbsp;</td>
								<td rowspan="2" style="width: 50%">
								<img src="${pageContext.request.contextPath}/imageCode" width="180"
									height="30" class="textinput" style="height: 30px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>
								</td>
							</tr>
						</table>

						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top: 20px; text-align: center">
								<a href="#">
								<img  src="images/signup.gif" border="0" onclick="tosubmit()">
								</a>
								<!-- 
								<input type="image" src="images/signup.gif" name="submit" border="0">
								 -->
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="foot.jsp"%>
</body>
</html>
