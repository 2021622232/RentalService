package web.servlet.cdc;

import domain.CDC;
import domain.Teacher;
import service.CDCService;
import service.TeacherService;
import service.impl.CDCServiceImpl;
import service.impl.TeacherServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCDCInfoServlet")
public class AddCDCInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        CDCService service = new CDCServiceImpl();
        //先进行判断是否已存在该教师
        String tid = request.getParameter("cdc-id");
        CDC t = new CDC();
        t.setTime(tid);

        CDC updateTeacher = new CDC();

        updateTeacher.setTime(tid);

        service.addCDCAllInfo(updateTeacher);
        request.setAttribute("update_msg", "添加成功！");
        request.getRequestDispatcher("addCDCServlet").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}