<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录页</title>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/modules/layer/default/layer.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <style type="text/css">

    </style>
</head>
<body>
<div class="login-main">
    <header class="layui-elip">服务租借系统</header>
    <form class="layui-form" action="" name="formf" method="post">

        <div class="layui-input-inline">
            <label class="layadmin-user-login-icon layui-icon layui-icon-username"></label>
            <input type="text" name="id" id="id" value="${loginid}" required lay-verify="required"
                   placeholder="账号" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <label class="layadmin-user-login-icon layui-icon layui-icon-password"></label>
            <input type="password" value="${loginpassword}" id="password" name="password" required
                   lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>

        <div style="padding-left: 100px;padding-bottom: 20px;">
            <input type="radio" name="roles" value="student" title="用户" checked>
            <input type="radio" name="roles" value="admin" title="管理员">
        </div>

        <div class="layui-input-inline login-btn">
            <button type="button" onclick="a()" lay-submit lay-filter="login" class="layui-btn" id="login"
                    name="submit-login">登录
            </button>
        </div>
        <hr/>
        <p><a href="register.jsp" class="fl">立即注册</a>
        <div class="tooltip">
            <span class="tooltiptext">${login_msg}</span>
        </div>
        </p>
    </form>
</div>
<script src="layui.js"></script>
<script src="./lay/modules/layer.js"></script>

<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form;
        //刷新界面 所有元素
        form.render();
    });
</script>

<script type="text/javascript">
    function a() {
        var num = document.getElementsByName("roles");
        var checked_value = "student";
        for (var i = 0; i < num.length; i++) {
            var radio = num[i];
            if (radio.checked) {
                checked_value = radio.value;
            }
        }
        var id = document.getElementById("id").value;
        var password = document.getElementById("password").value;
        if (id == '' || password == '') {
            return;
        } else {
            if (checked_value == "student") {
                document.formf.action = "${pageContext.request.contextPath}/loginServlet?roles=student";
                document.formf.submit();

            } else if (checked_value == "teacher") {
                document.formf.action = "${pageContext.request.contextPath}/loginServlet?roles=teacher";
                document.formf.submit();
            } else {
                document.formf.action = "${pageContext.request.contextPath}/loginServlet?roles=admin";
                document.formf.submit();
            }
        }
    }
</script>
</body>
</html>