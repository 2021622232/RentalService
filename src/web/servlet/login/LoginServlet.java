package web.servlet.login;

import domain.Admin;
import domain.Notify;
import domain.Student;
import domain.Teacher;
import service.AdminService;
import service.NotifyService;
import service.StudentService;
import service.TeacherService;
import service.impl.AdminServiceImpl;
import service.impl.NotifyServiceImpl;
import service.impl.StudentServiceImpl;
import service.impl.TeacherServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student loginStudent;
        Teacher loginTeacher;
        Admin loginAdmin;

        //设置编码
        request.setCharacterEncoding("utf-8");

        //获取数据
        String loginid = request.getParameter("id");
        String loginpassword = request.getParameter("password");

        //验证码校验
        HttpSession session = request.getSession();
        session.removeAttribute("CHECKCODE_SERVER");//确保验证一次性
        //封装对象
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");

        //公告加载
        NotifyService notifyService = new NotifyServiceImpl();
        List<Notify> notifys = notifyService.find();
        session.setAttribute("notifys", notifys);

        //判断roles封装对象、保存session、调用不同Service查询
        if ("student".equals(roles)) {

            Student student = new Student();
            student.setS_id(id);
            student.setS_password(password);

            StudentService service = new StudentServiceImpl();
            loginStudent = service.login(student);

            if (loginStudent != null) {
                session.setAttribute("student", loginStudent);
                session.setAttribute("html_title", "用户");
                response.sendRedirect("studentIndexServlet");
            } else {
                //登录失败 提示信息
                request.setAttribute("login_msg", "账号或密码错误！");
                request.setAttribute("loginid", loginid);
                request.setAttribute("loginpassword", loginpassword);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else if ("teacher".equals(roles)) {

            Teacher teacher = new Teacher();
            teacher.setT_id(id);
            teacher.setT_password(password);

            TeacherService service = new TeacherServiceImpl();
            loginTeacher = service.login(teacher);

            if (loginTeacher != null) {
                session.setAttribute("teacher", loginTeacher);
                session.setAttribute("html_title", "教师端");
                response.sendRedirect("teacherIndexServlet");
            } else {
                //登录失败 提示信息
                request.setAttribute("login_msg", "账号或密码错误！");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }

        } else {

            Admin admin = new Admin();
            admin.setA_id(id);
            admin.setA_password(password);

            AdminService service = new AdminServiceImpl();
            loginAdmin = service.login(admin);

            if (loginAdmin != null) {
                session.setAttribute("admin", loginAdmin);
                session.setAttribute("html_title", "管理员");
                response.sendRedirect("studentSelectCourseListServlet");
            } else {
                //登录失败 提示信息
                request.setAttribute("login_msg", "账号或密码错误！");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
