<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人信息修改</title>
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
                <a><cite>个人信息修改</cite></a>
            </span>
            <form class="layui-form" action="${pageContext.request.contextPath}/studentInfomationUpdateServlet"
                  style="padding-top: 50px" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-block">
                        <input type="text" readonly="readonly" name="student-id" value="${student.s_id}" required
                               lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="student-name" id="student-name" value="${student.s_name}"
                               placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">

                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
                        <span style="padding-left: 20px;">${update_msg}</span>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#nav li:nth-child(5) dl dd:nth-child(1)").addClass("layui-this");
    $("#nav li:nth-child(5)").addClass("layui-nav-itemed");
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
        element.init();
    });
</script>

<script>
    //Demo
    layui.use('form', function () {

    });
</script>
<script>
    var sex = "${student.s_sex}";
    if (sex == '男') {
        $("#idsex").attr("checked", "checked");
        $("#idsex2").removeAttr("checked");
    } else if (sex == '女') {
        $("#idsex2").attr("checked", "checked");
        $("#idsex").removeAttr("checked");
    } else {
        $("#idsex").removeAttr("checked");
        $("#idsex2").removeAttr("checked");
    }
</script>
<script type="text/javascript">
    $(function () {
        $('#inforeset').bind('click', function () {
            $("#idsex").removeAttr("checked");
            $("#idsex2").removeAttr("checked");
            $("#student-name").val("");
            $("#student-age").val("");
            $("#student-phone").val("");
            $("#student-email").val("");
            $("#student-address").val("");
            alert("已重置！");
        });


    });
</script>

</body>
</html>

