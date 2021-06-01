<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="./layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="layui-layout-body" style="background-color: #F2F2F2">
<jsp:include page="/filterLogin.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin/aHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin/adminNav.jsp"></jsp:include>
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
                <span class="layui-breadcrumb">
                    <a href="">管理员</a>
                    <a><cite>用户管理</cite></a>
                </span>
            <table class="layui-table" lay-filter="test">
                <thead>
                <tr>
                    <th>账号</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>操作</th>
                </tr>
                </thead>

                <c:forEach items="${selectcourses}" var="selectcourse" varStatus="s">
                    <tr>
                        <td>${selectcourse.s_id}</td>
                        <td>${selectcourse.s_name}</td>
                        <td>${selectcourse.s_password}</td>
                        <td><a class="layui-btn layui-btn-danger"
                               href="javascript:deleteStudent(${selectcourse.s_id});">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#nav li:nth-child(1) dl dd:nth-child(1)").addClass("layui-this");
    $("#nav li:nth-child(1)").addClass("layui-nav-itemed");
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
        element.init();
    });
</script>
<script>
    function deleteStudent(s_id) {
        if (confirm("你确定删除该用户吗？")) {
            location.href = "${pageContext.request.contextPath}/deleteSelectStudentServlet?sid=" + s_id;
        }
    }

    window.onload = function () {
        document.getElementById("deleteSelectStudent").onclick = function () {
            var flag = false;
            var cbs = document.getElementsByName("sid");
            for (var i = 0; i < cbs.length; i++) {
                if (cbs[i].checked) {
                    //有一个条目选中了,那么就不显示提示删除框
                    //且不提交
                    flag = true;
                    break;
                }
            }

            if (flag) {
                if (confirm("你确定要删除选中条目吗？")) {
                    document.getElementById("selectStudent").submit();
                }
            }

        }
        document.getElementById("firstCb").onclick = function () {
            var cbs = document.getElementsByName("sid");
            for (var i = 0; i < cbs.length; i++) {
                cbs[i].checked = this.checked;
            }
        }

    }
</script>
</body>
</html>

