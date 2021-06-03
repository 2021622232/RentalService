<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test" id="nav">
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/teacherListServlet">自由职业者信息</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/studentInfomationServlet">个人信息修改</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;
        element.init();
    });
</script>
</body>
</html>
