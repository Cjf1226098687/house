<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=UTF-8">
    <title>房屋租赁系统</title>
    <link rel="stylesheet" type="text/css" href="../../../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../../../css/main.css"/>
    <script type="text/javascript" src="../../../js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="../../../js/libs/modernizr.min.js"></script>
</head>

<script type="text/javascript">
    var error = "${param.error}";
    if (error === "deleteSuccess") {

        alert("删除成功！");
    }

</script>

<body>
<div>
    <div class="result-title">
        <h1>用户列表</h1>
    </div>
    <form id="houseForm" name="houseForm"
          action="/findAllUserList"
          method="post">
        <div class="result-title">
            <div class="result-list">
            </div>
        </div>

        <%--用户列表--%>
        <div class="result-content">
            <table id=grid
                   class="result-tab" width="100%">
                <tbody>
                <tr style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                    <td>租客用户名</td>
                    <td>租客姓名</td>
                    <td>租客身份证号码</td>
                    <td>租客联系电话</td>
                    <td>操作</td>
                </tr>

                <c:forEach items="${userList}" var="userlist">
                    <tr style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
                        <td>${userlist.user.username}</td>
                        <td>${userlist.name}</td>
                        <td>${userlist.idcard}</td>
                        <td>${userlist.phone}</td>
                        <td>
                            <a class="link-update"
                               href="/deleteUserList?id=${userlist.user.id}"
                               onclick="return window.confirm('确定删除吗？')">删除</a>
                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>

        <tbody>
            <tr>
                <span id="pagelink">
                    <div style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right; margin-top:10px">
                        共[<B>${pageInfo.total}</B>]条记录，共[<B>${pageInfo.pages}</B>]页
                        ,

                        <c:if test="${ pageInfo.pageNum > 1 }">
                            [<A href="javascript:to_page(${pageInfo.prePage})">前一页</A>]
                        </c:if>
                            <input type="hidden" name="page" id="page" value=""/>
                        第<B>${pageInfo.pageNum}</B>页

                        <c:if test="${ pageInfo.pageNum < pageInfo.pages }">
                            [<A href="javascript:to_page(${pageInfo.nextPage})">后一页</A>]
                        </c:if>
                    </div>
                </span>
            </tr>
        </tbody>
    </form>
</div>
</body>

<script type="text/javascript" language="JavaScript">
    // 提交分页的查询的表单
    function to_page(page) {
        if (page) {
            $("#page").val(page);
        }
        document.houseForm.submit();
    }
</script>

</html>