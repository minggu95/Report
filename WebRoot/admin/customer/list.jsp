<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/page.css" rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script language="javascript"
		src="${pageContext.request.contextPath}/admin/js/helpUtil.js"></script>
<script type="text/javascript">
    var reg = /^[1-9]\d*$/;
    /*删除选中行*/
    function deleteCustomer() {
        var check = $("input[type='checkbox']:checked");//在table中找input下类型为checkbox属性为选中状态的数据
        if(check.length==0){
            alert("请选择一条数据！");
            return;
        }
        var r=confirm("确认删除！");
        if (r==true)
		var check_val = [];
        check.each(function () {//遍历
            var id = $(this).closest('tr').find('td').eq(1).text()
			if(reg.test(id)) {
                check_val.push(id)
            }
        })
		//使用ajax方式跳转到servlet，但是无法从servlet跳转到jsp
        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "${pageContext.request.contextPath}/deleteCustomer?id=" + check_val,
            dataType : 'json',
            success : function(result) {
                alert(result);
            }
        });
        myrefresh();
    }
	function addCustomer() {
		window.location.href = "${pageContext.request.contextPath}/admin/customer/add.jsp";
	}

    function editCustomer() {
        var check = $("input[type='checkbox']:checked");
        if(check.length==0){
            alert("请选择一条数据！")
		}
		else if(check.length>1){
            alert("一次仅可以修改一条记录！")
		}
		else {
            var editId ;
            check.each(function () {//遍历
                var id = $(this).closest('tr').find('td').eq(1).text()
                if(reg.test(id)) {
                    editId = id;
                }
            })
            location.href = "${pageContext.request.contextPath}/findCustomer?id=" + editId;
		}
    }

    function allcheck() {
        var nn = $("#checkAll").is(":checked"); //判断th中的checkbox是否被选中，如果被选中则nn为true，反之为false
        if(nn == true) {
            var namebox = $("input[name^='chkValue']");  //获取name值为boxs的所有input
            for(i = 0; i < namebox.length; i++) {
                namebox[i].checked=true;    //js操作选中checkbox
            }
        }
        if(nn == false) {
            var namebox = $("input[name^='chkValue']");
            for(i = 0; i < namebox.length; i++) {
                namebox[i].checked=false;
            }
        }
    }
    function myrefresh()
    {
        window.location.reload();
    }
    function searchCustomer() {
        var customerNo = document.getElementById("customerNo").value;
        var customerName = document.getElementById("customerName").value;
        location.href = "${pageContext.request.contextPath}/listCustomer?customerNo=" + customerNo+"&customerName="+customerName;
    }
    function resetText() {
		document.getElementById("customerNo").value = "";
        document.getElementById("customerName").value = "";
    }
</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1" action="" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<tbody>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>查 询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									客户编号</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
																		   name="customerNo" size="15" value="${customerNo}" id="customerNo" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									客户名称：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
																		   name="customerName" size="15" value="${customerName}" id="customerName" class="bg" />
								</td>
							</tr>
							<tr>
								<td class="ta_01" align="left">
									<button type="button" id="search" name="search"
											class="search" onclick="searchCustomer()">查询
									</button>
									<button type="button" id="reset" name="reset"
											class="reset" onclick="resetText()">重置
									</button>
								</td>
							</tr>
						</table>
					</td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>客 户 列 表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="left">
						<button type="button" id="add" name="add"
							class="button_add" onclick="addCustomer()">新增
						</button>
						<button type="button" id="delete" name="delete"
								class="button_delete" onclick="deleteCustomer()">删除
						</button>
						<button type="button" id="edit" name="edit"
								class="button_edit" onclick="editCustomer()">编辑
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							   bordercolor="gray" border="1" id="DataGrid2"
							   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td width="1%" align="left"><input type="checkbox" name="chkTittle" id="checkAll" onclick="allcheck()">
								</td>
								<td align="center" width="12%" hidden="true">ID</td>
								<td align="center" width="12%">客户编号</td>
								<td align="center" width="12%">客户名称</td>
								<td align="center" width="24%">客户地址</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<c:forEach items="${customers}" var="n">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td width="1%" align="left"><input type="checkbox" name="chkValue"></td>
									<td hidden="true" align="center"
										width="12%">${n.id}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="12%">${n.customerNo }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="12%">${n.customerName }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="24%">${n.address }</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center">
						<div id="barcon" class="barcon" >
							    <div id="barcon1" class="barcon1"></div>
							        <div id="barcon2" class="barcon2">
							            <ul>
							                <li><a href="###" id="firstPage">首页</a></li>
							                <li><a href="###" id="prePage">上一页</a></li>
							                <li><a href="###" id="nextPage">下一页</a></li>
							                <li><a href="###" id="lastPage">尾页</a></li>
							                <li><select id="jumpWhere">
							                </select></li>
							                <li><a href="###" id="jumpPage" onclick="jumpPage()">跳转</a></li>
							            </ul>
							        </div>
						</div>
					</td>
				</tr>
			</TBODY>
		</table>

	</form>
</body>
</HTML>

