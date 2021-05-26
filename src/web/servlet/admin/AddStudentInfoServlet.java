package web.servlet.admin;

import domain.Student;
import domain.Teacher;
import service.StudentService;
import service.TeacherService;
import service.impl.StudentServiceImpl;
import service.impl.TeacherServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/addStudentInfoServlet")
public class AddStudentInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        TeacherService service = new TeacherServiceImpl();
        //先进行判断是否已存在该教师
        String tid = request.getParameter("teacher-id");
        Teacher t = new Teacher();
        t.setT_id(tid);
        Teacher newTeacher = service.findTeacherById(t);
        if (newTeacher != null) {
            request.setAttribute("update_msg", "已存在，请重新添加！");
            request.getRequestDispatcher("addStudentServlet").forward(request, response);
        } else {
            String name = request.getParameter("teacher-name");
            String sex = request.getParameter("teacher-sex");
            String education = request.getParameter("teacher-education");
            String title = request.getParameter("teacher-title");

            Teacher updateTeacher = new Teacher();

            updateTeacher.setT_id(tid);
            updateTeacher.setT_name(name);
            updateTeacher.setT_sex(sex);
            updateTeacher.setT_education(education);
            updateTeacher.setT_title(title);

            service.addTeacherAllInfo(updateTeacher);
            request.setAttribute("update_msg", "添加成功！");
            request.getRequestDispatcher("addStudentServlet").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
