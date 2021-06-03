<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>自由职业者信息</title>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="./layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="layui-layout-body" style="background-color: #F2F2F2">
<jsp:include page="/filterLogin.jsp"></jsp:include>
<jsp:include page="/WEB-INF/student/sHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/student/studentNav.jsp"></jsp:include>
    <div class="layui-layout layui-layout-admin">
        <div class="layui-body">
            <!-- 内容主体区域 -->
            <div style="padding: 15px;">
                <span class="layui-breadcrumb">
                    <a href="">用户端</a>
                    <a><cite>自由职业者信息</cite></a>
                </span>
                <table class="layui-table" lay-filter="test">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>电话</th>
                        <th>地址</th>
                        <th>价格</th>
                        <th>工作</th>
                    </tr>
                    </thead>

                    <c:forEach items="${teachers}" var="teacher" varStatus="t">
                        <tr style="height: 70px;">
                            <td>${t.count}</td>
                            <td>${teacher.t_name}</td>
                            <td>${teacher.t_id}</td>
                            <td>${teacher.t_sex}</td>
                            <td>${teacher.t_education}</td>
                            <td>${teacher.t_title}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>


<script type="text/javascript">
    $("#nav li:nth-child(3) dl dd:nth-child(1)").addClass("layui-this");
    $("#nav li:nth-child(3)").addClass("layui-nav-itemed");
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        element.init();
    });
</script>

</body>
</html>
