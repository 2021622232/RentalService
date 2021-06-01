<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <a class="layui-logo" id="fresh" href="${pageContext.request.contextPath}/studentSelectCourseListServlet">服务租借系统</a>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    ${admin.a_id} 管理员
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/adminPasswordIndexServlet">修改密码</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/logoutServlet">退出</a></dd>
                </dl>
            </li>
        </ul>
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
