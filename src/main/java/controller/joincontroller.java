package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.UserDAO;
import user.UserDTO;


@WebServlet("/join.do")
public class joincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public joincontroller() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");

		UserDTO uDto = new UserDTO();
		uDto.setUserID(id);
		uDto.setUserPassword(pw);
		uDto.setUserName(name);
		uDto.setUserGender(gender);
		uDto.setUserEmail(email);

		UserDAO uDao = new UserDAO();
		try {
			uDao.insertMember(uDto);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("join.jsp");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		

	}

}
