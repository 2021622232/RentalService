<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>时间表列表</title>
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
                    <a href="">时间表管理</a>
                    <a><cite>时间表列表</cite></a>
                </span>
            <table class="layui-table" lay-filter="test">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                </thead>

                <c:forEach items="${cdcs}" var="cdcs" varStatus="c">
                    <tr>
                        <td>${c.count}</td>
                        <td>${cdcs.time}</td>
                        <td><a class="layui-btn layui-btn-normal"
                               href="">修改</a>
                            <a class="layui-btn layui-btn-danger"
                               href="javascript:deleteCDC(${cdcs.time});">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#nav li:nth-child(4) dl dd:nth-child(1)").addClass("layui-this");
    $("#nav li:nth-child(4)").addClass("layui-nav-itemed");
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
        element.init();
    });
</script>
<script>
    function deleteCDC(t_id) {
        if (confirm("你确定删除该时间表吗？")) {
            location.href = "${pageContext.request.contextPath}/deleteCDCServlet?tid=" + t_id;
        }
    }
</script>

</body>
</html>
