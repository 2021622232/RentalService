<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TITLE</title>
</head>
<body>

<%
    if (session.getAttribute("student")!=null) {
%>
        <jsp:forward page = "/WEB-INF/student/sFindTeacherList.jsp"/>
<%
    }else if (session.getAttribute("teacher")!=null) {
%>
        <jsp:forward page = "/WEB-INF/teacher/tIndex.jsp"/>
<%
    }else if (session.getAttribute("admin")!=null) {
%>
        <jsp:forward page = "/WEB-INF/admin/allStudentSelectCourseList.jsp"/>
<%
    }else {
%>
        <jsp:forward page = "login.jsp" />
<%
    }
%>
</body>
</html>
