package web.servlet.admin;


import domain.CDC;
import domain.Student;
import domain.Teacher;
import service.CDCService;
import service.StudentService;
import service.TeacherService;
import service.impl.CDCServiceImpl;
import service.impl.StudentServiceImpl;
import service.impl.TeacherServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/updateStudentInfoServlet")
public class UpdateStudentInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tid = request.getParameter("teacher-id");

        String name = request.getParameter("teacher-name");
        String sex = request.getParameter("teacher-sex");
        String education = request.getParameter("teacher-education");
        String title = request.getParameter("teacher-title");

        Teacher updateTeacher = new Teacher();
        //判断输入位数是否大于数据库位数

        //封装教师对象
        updateTeacher.setT_id(tid);
        updateTeacher.setT_name(name);
        updateTeacher.setT_sex(sex);
        updateTeacher.setT_education(education);
        updateTeacher.setT_title(title);

        //调用TeacherUpdate服务
        TeacherService service = new TeacherServiceImpl();
        service.updateInfo(updateTeacher);

        //成功则返回并给提示
        request.setAttribute("update_msg", "修改成功！");
        request.getRequestDispatcher("updateStudentServlet?tid=" + tid).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
