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

@WebServlet("/login.do")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("login.do doGet 진입");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	/**
	 * 로그인 처리
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("login.do doPost 진입");

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("userID");
		String pw = request.getParameter("userPassword");

		RequestDispatcher dispatcher = null;

		UserDTO uDto = new UserDTO();
		uDto.setUserID(id);
		uDto.setUserPassword(pw);

		UserDAO uDao = new UserDAO();
		try {
			int result = uDao.login(uDto);

			if (result > 0) {
				request.getSession().setAttribute("userID", id);
				request.getSession().setAttribute("loginYn", "Y");
				System.out.println("회원구분 :: " + result);
				if (result == 1) {
					System.out.println("일반회원");
					request.getSession().setAttribute("adminYn", "N");
					dispatcher = request.getRequestDispatcher("index.jsp");
				}else if (result == 2) {
					System.out.println("괸리자");
					request.getSession().setAttribute("adminYn", "Y");
					dispatcher = request.getRequestDispatcher("adminPage.jsp");
				}
			} else {
				request.getSession().setAttribute("loginYn", "N");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			dispatcher = request.getRequestDispatcher("login.jsp");
		}

		dispatcher.forward(request, response);
	}

}
