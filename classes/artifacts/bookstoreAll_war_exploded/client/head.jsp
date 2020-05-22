<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String user = request.getParameter("user");
String name;
if(user == null || "".equals(user)){
	name = "您好，欢迎光临无涯网！";
}else{
	name = "亲爱的 "+user+" 童鞋,您好！";
}
%>
<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath }/index.jsp">
					<img src="${pageContext.request.contextPath}/client/images/logo.png" width="200" height="60" border="0" /> 
				</a>
			</td>
			<td style="text-align:right">
			<span style="color: #0066ff"><%=name %></span>
				<img src="${pageContext.request.contextPath}/client/images/cart.gif" width="26" height="23" style="margin-bottom:-4px" />&nbsp;<a href="${pageContext.request.contextPath}/client/cart.jsp">购物车</a> 
				| <a href="${pageContext.request.contextPath}/client/help.jsp">帮助中心</a> 
				| <a href="${pageContext.request.contextPath}/myAccount">我的帐户</a>
				| <a href="${pageContext.request.contextPath}/client/login.jsp">登录/注册</a>
				| <a href="${pageContext.request.contextPath}/factoryClient/factoryLogin.jsp">第三方登录</a>
			</td>
		</tr>
	</table>
</div>