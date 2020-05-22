<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>bookStore首页</title>
	<%-- 导入css --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
	<!-- 导入首页轮播图css和js脚本 -->
	<link type="text/css" href="${pageContext.request.contextPath }/client/css/autoplay.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/autoplay.js"></script>
</head>

<body class="main">
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<%-- <div id="divad">
		<img src="${pageContext.request.contextPath}/client/ad/index_ad.jpg"/>
	</div> --%>
	<!-- 图书商场首页轮播图  start -->
	<img src="${pageContext.request.contextPath}/client/ad/weixin.jpg" width="130" height="130" style="position:absolute; left:10px; top:250px; "/><label style="position:absolute; left:10px; top:400px;"><font >微信客服<br>在线时间 9：00-17：00</font></label>
	<table border="1" cellpadding="0" cellspacing="0" style="position:absolute;left:1070px; top:240px;height:200;width:150; ">
		<tr>
		<td>
		<label>购买指南</label><br><br>
		<a href="${pageContext.request.contextPath}/client/help.jsp"><font color="black">1:银行担保交易，<br>安全快捷</font></a><br><br>
		<a href="${pageContext.request.contextPath}/client/help.jsp"><font color="black">2:保证24小时之内发货</font></a><br><br>
		<a href="${pageContext.request.contextPath}/client/help.jsp"><font color="black">3:提供电子商务小包,<br>EMS,快递</font></a><br><br>
		<a href="${pageContext.request.contextPath}/client/help.jsp"><font color="black">4:提供免费短信提醒服务</font></a>
		</td></tr>
	</table>
	<div id="box_autoplay">
    	<div class="list">
        	<ul>
            	<li><img src="${pageContext.request.contextPath }/client/ad/index_ad1.jpg" width="900" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/client/ad/index_ad2.jpg" width="900" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/client/ad/index_ad3.jpg" width="900" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/client/ad/index_ad4.jpg" width="900" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/client/ad/index_ad5.jpg" width="900" height="335" /></li>
        	</ul>
    	</div>
	</div>
	<!-- 图书商场首页轮播图  end -->
	
	<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td width="497">
					<img src="${pageContext.request.contextPath}/client/images/billboard.gif" width="497" height="38" />
					<table cellspacing="0" class="ctl">
						<tr>
							<td width="485" height="29">${n.details }</td>
						</tr>
					</table>
				</td>
				<td style="padding:5px 15px 10px 40px">
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<td>
								<img src="${pageContext.request.contextPath}/client/images/hottitle.gif" width="126" height="29" />
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0">
						<tr>
						<c:forEach items="${pList }" var="pArray">
							<td style="width:80; text-align:center">
								<a href="${pageContext.request.contextPath}/findProductById?id=${pArray[0]}">
									<img src="${pageContext.request.contextPath }${pArray[2]}" width="102" height="130" border="0" /> 
								</a>
								<br /> 
								<a href="${pageContext.request.contextPath}/findProductById?id=${pArray[0]}">${pArray[1]}</a>
								<%-- <br />作者:${pArray[2] } --%>
							</td>
						</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="foot.jsp" %>
</body>
</html>
