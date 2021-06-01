<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>自由职业者列表</title>
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
                <a href="">自由职业者管理</a>
                <a><cite>自由职业者列表</cite></a>
            </span>

            <form style="padding-top: 20px;" action="${pageContext.request.contextPath}/findStudentByPageServlet"
                  method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label" style="width: auto;">姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="s_name" value="${condition.s_name[0]}" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label" style="width: auto;">电话</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="s_id" value="${condition.s_id[0]}" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label" style="width: auto;">工作</label>
                        <div class="layui-input-inline">
                            <input type="text" name="s_name" value="${condition.s_name[0]}" autocomplete="off"
                                   class="layui-input">
                        </div>

                        <div class="layui-input-inline">
                            <button type="submit" class="layui-btn">查询</button>
                        </div>
                    </div>
                </div>
            </form>

            <table class="layui-table" lay-filter="test">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>电话</th>
                    <th>地址</th>
                    <th>价格</th>
                    <th>工作</th>
                    <th>操作</th>
                </tr>
                </thead>

                <c:forEach items="${teachers}" var="teacher" varStatus="t">
                    <tr>
                        <td>${teacher.t_name}</td>
                        <td>${teacher.t_id}</td>
                        <td>${teacher.t_sex}</td>
                        <td>${teacher.t_education}</td>
                        <td>${teacher.t_title}</td>
                        <td><a class="layui-btn layui-btn-normal"
                               href="${pageContext.request.contextPath}/updateStudentServlet?tid=${teacher.t_id}">修改</a><a
                                class="layui-btn layui-btn-danger"
                                href="javascript:deleteTeacher(${teacher.t_id});">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <%--            <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1"><a href="javascript:;" class="layui-laypage-prev" data-page="3">上一页</a><a href="javascript:;" data-page="1">1</a><a href="javascript:;" data-page="2">2</a><a href="javascript:;" data-page="3">3</a><span class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>4</em></span><a href="javascript:;" data-page="5">5</a><a href="javascript:;" class="layui-laypage-next" data-page="5">下一页</a></div>--%>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#nav li:nth-child(2) dl dd:nth-child(1)").addClass("layui-this");
    $("#nav li:nth-child(2)").addClass("layui-nav-itemed");
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
        element.init();
    });
</script>
<script>
    function deleteTeacher(t_id) {
        if (confirm("你确定删除该自由职业者吗？")) {
            location.href = "${pageContext.request.contextPath}/deleteStudentServlet?tid=" + t_id;
        }
    }
</script>

</body>
</html>
