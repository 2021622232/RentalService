package web.servlet.student;

import service.NotifyService;
import service.StudentService;
import service.TeacherService;
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

@WebServlet("/deleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String teacherid = request.getParameter("tid");
        TeacherService service = new TeacherServiceImpl();
        service.deleteTeacherById(teacherid);
        request.getRequestDispatcher("/findStudentByPageServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
