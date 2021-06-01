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
                    <a href="${pageContext.request.contextPath}/studentSelectCourseListServlet">用户管理</a>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">自由职业者管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/findStudentByPageServlet">自由职业者列表</a></dd>
                        <dd hidden id="hidden-update"><a href="#">修改自由职业者信息</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/addStudentServlet">添加自由职业者</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">项目管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/teacherListServlet">项目列表</a></dd>
                        <dd hidden id="hidden-update2"><a href="#">修改项目信息</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/addTeacherServlet">添加项目</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">时间表管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/cdcListServlet">时间表列表</a></dd>
                        <dd hidden id="hidden-update3"><a href="#">修改时间表</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/addCDCServlet">创建时间表</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
