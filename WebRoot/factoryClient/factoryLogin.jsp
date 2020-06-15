<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>LLGREPORT</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/factoryMain.css" type="text/css" />
</head>

<body class="main">
	<div id="divcontent">
		<form action="${pageContext.request.contextPath}/factoryLogin" method="post">
			<table width="900px" border="0" cellspacing="0">
				<tr>
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<td>
								<div id="logindiv">
									<table width="100%" border="0" cellspacing="0">
										<tr>
											<td style="text-align:center;padding-top:40px;">
												<font size="6" style="font-weight: 600;" color="#00bfff">LLGREPORT</font>
											</td>
										</tr>
										<tr>
											<td style="text-align:center;padding-top:20px;"><font
													color="#ff0000">${requestScope["register_message"]}</font>
											</td>
										</tr>
										<tr>
											<td style="text-align:center">
												<table width="80%" border="0" cellspacing="0"
													   style="margin-top:15px ;margin-left:auto; margin-right:auto">
													<tr>
														<td
																style="text-align:right; padding-top:5px; width:25%">用户名：</td>
														<td style="text-align:left"><input name="username"
																						   type="text" class="textinput" />
														</td>
													</tr>
													<tr>
														<td style="text-align:right; padding-top:5px">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
														<td style="text-align:left"><input name="password"
																						   type="password" class="textinput" />
														</td>
													</tr>
													<tr>
														<td colspan="2" style="text-align:center"><input
																type="checkbox" name="checkbox" value="checkbox" />
															记住用户名&nbsp;&nbsp; <input type="checkbox"
																					 name="checkbox" value="checkbox" /> 自动登录</td>
													</tr>
													<tr>
														<td colspan="2"
															style="padding-top:10px; text-align:center">
															<input name="image" type="image" onclick="return formcheck()"
																   src="${pageContext.request.contextPath }/admin/images/loginbutton.gif" width="83" height="22" />
														</td>
													</tr>

													<tr>
														<td colspan="2" style="padding-top:10px">
															<img src="${pageContext.request.contextPath }/admin/images/loginline.gif" width="241" height="10" />
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</div></td>
						</tr>
					</table>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
